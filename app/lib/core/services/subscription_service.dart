import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/services/revenuecat_service.dart';

/// Subscription service to manage user subscription status and limits
///
/// Following the recommended pricing strategy:
/// - Free tier: 7-day trial + limited ongoing (3 scans/day, manual entry)
/// - Premium: $6.99/month or $29.99/year (unlimited scans, all features)
class SubscriptionService {
  static const String _prefsKeySubscriptionStatus = 'subscription_status';
  static const String _prefsKeyTrialStartDate = 'trial_start_date';
  static const String _prefsKeyDailyScanCount = 'daily_scan_count';
  static const String _prefsKeyLastScanDate = 'last_scan_date';
  static const String _prefsKeySubscriptionType = 'subscription_type';
  static const String _prefsKeySubscriptionExpiry = 'subscription_expiry';

  static const int _freeTierDailyScanLimit = 3;
  static const int _trialDurationDays = 7;

  SubscriptionStatus _status = SubscriptionStatus.free;
  SubscriptionType? _subscriptionType;
  DateTime? _trialStartDate;
  DateTime? _subscriptionExpiry;
  int _dailyScanCount = 0;
  bool _isInitialized = false;

  // Getters
  SubscriptionStatus get status => _status;
  SubscriptionType? get subscriptionType => _subscriptionType;
  DateTime? get trialStartDate => _trialStartDate;
  DateTime? get subscriptionExpiry => _subscriptionExpiry;
  int get dailyScanCount => _dailyScanCount;
  bool get isInitialized => _isInitialized;

  // Computed properties
  bool get isPremium => _status == SubscriptionStatus.premium;
  bool get isInTrial => _status == SubscriptionStatus.trial;
  bool get isFree => _status == SubscriptionStatus.free;
  bool get hasUnlimitedScans => isPremium || isInTrial;
  int get remainingScans => hasUnlimitedScans
      ? -1
      : (_freeTierDailyScanLimit - _dailyScanCount).clamp(
          0,
          _freeTierDailyScanLimit,
        );

  /// Days remaining in trial (0 if not in trial)
  int get trialDaysRemaining {
    if (_trialStartDate == null || _status != SubscriptionStatus.trial)
      return 0;
    final daysSinceStart = DateTime.now().difference(_trialStartDate!).inDays;
    return (_trialDurationDays - daysSinceStart).clamp(0, _trialDurationDays);
  }

  /// Initialize the service by loading subscription data
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _loadFromStorage();
      await _updateSubscriptionStatus();
      _isInitialized = true;
      AppLogger.logState(
        'SubscriptionService initialized - Status: ${_status.name}',
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to initialize SubscriptionService',
        e,
        stackTrace,
      );
      _isInitialized = true;
    }
  }

  /// Load subscription data from storage
  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();

    // Load subscription status
    final statusString = prefs.getString(_prefsKeySubscriptionStatus);
    if (statusString != null) {
      _status = SubscriptionStatus.values.firstWhere(
        (status) => status.name == statusString,
        orElse: () => SubscriptionStatus.free,
      );
    }

    // Load subscription type
    final typeString = prefs.getString(_prefsKeySubscriptionType);
    if (typeString != null) {
      _subscriptionType = SubscriptionType.values.firstWhere(
        (type) => type.name == typeString,
        orElse: () => SubscriptionType.monthly,
      );
    }

    // Load trial start date
    final trialStartString = prefs.getString(_prefsKeyTrialStartDate);
    if (trialStartString != null) {
      _trialStartDate = DateTime.parse(trialStartString);
    }

    // Load subscription expiry
    final expiryString = prefs.getString(_prefsKeySubscriptionExpiry);
    if (expiryString != null) {
      _subscriptionExpiry = DateTime.parse(expiryString);
    }

    // Load daily scan count
    await _loadDailyScanCount();
  }

  /// Load and reset daily scan count if needed
  Future<void> _loadDailyScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final lastScanDate = prefs.getString(_prefsKeyLastScanDate);

    if (lastScanDate != today) {
      // New day, reset scan count
      _dailyScanCount = 0;
      await _saveScanCount();
    } else {
      // Same day, load existing count
      _dailyScanCount = prefs.getInt(_prefsKeyDailyScanCount) ?? 0;
    }
  }

  /// Save subscription data to storage
  Future<void> _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.setString(_prefsKeySubscriptionStatus, _status.name),
      if (_subscriptionType != null)
        prefs.setString(_prefsKeySubscriptionType, _subscriptionType!.name),
      if (_trialStartDate != null)
        prefs.setString(
          _prefsKeyTrialStartDate,
          _trialStartDate!.toIso8601String(),
        ),
      if (_subscriptionExpiry != null)
        prefs.setString(
          _prefsKeySubscriptionExpiry,
          _subscriptionExpiry!.toIso8601String(),
        ),
    ]);
  }

  /// Save daily scan count to storage
  Future<void> _saveScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];

    await Future.wait([
      prefs.setInt(_prefsKeyDailyScanCount, _dailyScanCount),
      prefs.setString(_prefsKeyLastScanDate, today),
    ]);
  }

  /// Start free trial for new users
  Future<bool> startTrial() async {
    if (_trialStartDate != null) {
      AppLogger.logState('Trial already started, cannot start again');
      return false;
    }

    _status = SubscriptionStatus.trial;
    _trialStartDate = DateTime.now();

    await _saveToStorage();
    AppLogger.logState('Started 7-day free trial');
    return true;
  }

  /// Check and sync with RevenueCat premium status
  Future<bool> syncPremiumStatus() async {
    final hasPremium = await RevenueCatService.hasPremiumAccess();

    if (hasPremium && !isPremium) {
      // User purchased via RevenueCat, update local status
      _status = SubscriptionStatus.premium;
      _subscriptionType =
          SubscriptionType.monthly; // Could be determined from RevenueCat
      await _saveToStorage();
      AppLogger.logState('Synced premium status from RevenueCat');
      return true;
    }

    return hasPremium;
  }

  /// Update subscription status based on RevenueCat and local data
  Future<void> _updateSubscriptionStatus() async {
    // Check RevenueCat for current premium status
    final hasPremium = await RevenueCatService.hasPremiumAccess();

    if (hasPremium) {
      // User has active premium subscription via RevenueCat
      _status = SubscriptionStatus.premium;
      _subscriptionType = SubscriptionType
          .monthly; // Default, could be determined from RevenueCat
      await _saveToStorage();
      AppLogger.logState('Premium status confirmed via RevenueCat');
      return;
    }

    // No RevenueCat premium, check local trial status
    final now = DateTime.now();

    // Check if trial has expired
    if (_status == SubscriptionStatus.trial && _trialStartDate != null) {
      final daysSinceStart = now.difference(_trialStartDate!).inDays;
      if (daysSinceStart >= _trialDurationDays) {
        _status = SubscriptionStatus.free;
        await _saveToStorage();
        AppLogger.logState('Trial expired, reverted to free tier');
      }
    } else if (_status == SubscriptionStatus.premium && !hasPremium) {
      // Local says premium but RevenueCat says no - revert to free
      _status = SubscriptionStatus.free;
      _subscriptionType = null;
      _subscriptionExpiry = null;
      await _saveToStorage();
      AppLogger.logState(
        'Premium subscription no longer active, reverted to free tier',
      );
    }
  }

  /// Check if user can scan (within daily limits for free users)
  bool canScan() {
    if (hasUnlimitedScans) return true;
    return _dailyScanCount < _freeTierDailyScanLimit;
  }

  /// Record a scan attempt (increments daily count for free users)
  Future<bool> recordScan() async {
    if (hasUnlimitedScans) {
      AppLogger.logState('Premium/trial user - unlimited scans');
      return true;
    }

    if (_dailyScanCount >= _freeTierDailyScanLimit) {
      AppLogger.logState(
        'Free user - daily scan limit reached ($_freeTierDailyScanLimit)',
      );
      return false;
    }

    _dailyScanCount++;
    await _saveScanCount();
    AppLogger.logState(
      'Free user - recorded scan $_dailyScanCount/$_freeTierDailyScanLimit',
    );
    return true;
  }

  /// Get subscription info for display
  SubscriptionInfo getSubscriptionInfo() {
    return SubscriptionInfo(
      status: _status,
      subscriptionType: _subscriptionType,
      trialDaysRemaining: trialDaysRemaining,
      remainingScans: remainingScans,
      hasUnlimitedScans: hasUnlimitedScans,
      subscriptionExpiry: _subscriptionExpiry,
    );
  }

  /// Reset subscription (for testing purposes)
  Future<void> resetSubscription() async {
    _status = SubscriptionStatus.free;
    _subscriptionType = null;
    _trialStartDate = null;
    _subscriptionExpiry = null;
    _dailyScanCount = 0;

    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(_prefsKeySubscriptionStatus),
      prefs.remove(_prefsKeySubscriptionType),
      prefs.remove(_prefsKeyTrialStartDate),
      prefs.remove(_prefsKeySubscriptionExpiry),
      prefs.remove(_prefsKeyDailyScanCount),
      prefs.remove(_prefsKeyLastScanDate),
    ]);

    AppLogger.logState('Subscription reset to free tier');
  }
}

enum SubscriptionStatus {
  free, // Free tier with limited features
  trial, // 7-day trial with all features
  premium, // Paid subscription with all features
}

enum SubscriptionType {
  monthly, // $6.99/month
  yearly, // $29.99/year
}

class SubscriptionInfo {
  final SubscriptionStatus status;
  final SubscriptionType? subscriptionType;
  final int trialDaysRemaining;
  final int remainingScans;
  final bool hasUnlimitedScans;
  final DateTime? subscriptionExpiry;

  SubscriptionInfo({
    required this.status,
    this.subscriptionType,
    required this.trialDaysRemaining,
    required this.remainingScans,
    required this.hasUnlimitedScans,
    this.subscriptionExpiry,
  });

  String get displayStatus {
    switch (status) {
      case SubscriptionStatus.free:
        return 'Free';
      case SubscriptionStatus.trial:
        return 'Trial ($trialDaysRemaining days left)';
      case SubscriptionStatus.premium:
        return 'Premium';
    }
  }

  String get scanLimitDisplay {
    if (hasUnlimitedScans) return 'Unlimited scans';
    return '$remainingScans scans remaining today';
  }
}
