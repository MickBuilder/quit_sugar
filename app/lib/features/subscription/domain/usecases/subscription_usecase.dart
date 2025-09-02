import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_info.dart';
import 'package:quit_suggar/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

/// Subscription usecase to manage user subscription status and limits
///
/// Following the recommended pricing strategy:
/// - Free tier: 7-day trial + limited ongoing (3 scans/day, manual entry)
/// - Premium: $6.99/month or $29.99/year (unlimited scans, all features)
class SubscriptionUsecase {
  static const int _freeTierDailyScanLimit = 100;
  static const int _trialDurationDays = 7;

  final SubscriptionRepository _repository;

  SubscriptionStatus _status = SubscriptionStatus.free;
  SubscriptionType? _subscriptionType;
  DateTime? _trialStartDate;
  DateTime? _subscriptionExpiry;
  int _dailyScanCount = 0;
  bool _isInitialized = false;

  SubscriptionUsecase(this._repository);

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
    if (_trialStartDate == null || _status != SubscriptionStatus.trial) {
      return 0;
    }
    final daysSinceStart = DateTime.now().difference(_trialStartDate!).inDays;
    return (_trialDurationDays - daysSinceStart).clamp(0, _trialDurationDays);
  }

  /// Initialize the usecase by loading subscription data
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _loadFromRepository();
      await _updateSubscriptionStatus();
      _isInitialized = true;
      AppLogger.logState(
        'SubscriptionUsecase initialized - Status: ${_status.name}',
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to initialize SubscriptionUsecase',
        e,
        stackTrace,
      );
      _isInitialized = true;
    }
  }

  /// Load subscription data from repository
  Future<void> _loadFromRepository() async {
    _status = await _repository.getSubscriptionStatus();
    _subscriptionType = await _repository.getSubscriptionType();
    _trialStartDate = await _repository.getTrialStartDate();
    _subscriptionExpiry = await _repository.getSubscriptionExpiry();
    _dailyScanCount = await _repository.getDailyScanCount();
  }

  /// Save subscription data to repository
  Future<void> _saveToRepository() async {
    await _repository.saveAllSubscriptionData(
      status: _status,
      subscriptionType: _subscriptionType,
      trialStartDate: _trialStartDate,
      subscriptionExpiry: _subscriptionExpiry,
    );
  }

  /// Start free trial for new users
  Future<bool> startTrial() async {
    if (_trialStartDate != null) {
      AppLogger.logState('Trial already started, cannot start again');
      return false;
    }

    _status = SubscriptionStatus.trial;
    _trialStartDate = DateTime.now();

    await _saveToRepository();
    AppLogger.logState('Started 7-day free trial');
    return true;
  }

  /// Show paywall
  Future<bool> showPaywall() async {
    try {
      final result = await _repository.showPaywall();

      if (result == PaywallResult.purchased) {
        // Refresh subscription status after purchase
        await syncPremiumStatus();
        return true;
      }

      return false;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to show paywall', e, stackTrace);
      return false;
    }
  }

  /// Restore purchases
  Future<bool> restorePurchases() async {
    try {
      final restored = await _repository.restorePurchases();

      if (restored) {
        // Refresh subscription status after restore
        await syncPremiumStatus();
      }

      return restored;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to restore purchases',
        e,
        stackTrace,
      );
      return false;
    }
  }

  /// Check and sync with RevenueCat premium status
  Future<bool> syncPremiumStatus() async {
    final hasPremium = await _repository.hasPremiumAccess();

    if (hasPremium && !isPremium) {
      // User purchased via RevenueCat, update local status
      _status = SubscriptionStatus.premium;
      _subscriptionType =
          await _repository.getActiveSubscriptionType() ??
          SubscriptionType.monthly;
      _subscriptionExpiry = await _repository.getRemoteSubscriptionExpiry();

      await _saveToRepository();
      AppLogger.logState('Synced premium status from RevenueCat');
      return true;
    }

    return hasPremium;
  }

  /// Update subscription status based on RevenueCat and local data
  Future<void> _updateSubscriptionStatus() async {
    // Check RevenueCat for current premium status
    final hasPremium = await _repository.hasPremiumAccess();

    if (hasPremium) {
      // User has active premium subscription via RevenueCat
      _status = SubscriptionStatus.premium;
      _subscriptionType =
          await _repository.getActiveSubscriptionType() ??
          SubscriptionType.monthly;
      _subscriptionExpiry = await _repository.getRemoteSubscriptionExpiry();

      await _saveToRepository();
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
        await _saveToRepository();
        AppLogger.logState('Trial expired, reverted to free tier');
      }
    } else if (_status == SubscriptionStatus.premium && !hasPremium) {
      // Local says premium but RevenueCat says no - revert to free
      _status = SubscriptionStatus.free;
      _subscriptionType = null;
      _subscriptionExpiry = null;
      await _saveToRepository();
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
    await _repository.saveScanCount(_dailyScanCount);
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

    await _repository.clearAllData();
    AppLogger.logState('Subscription reset to free tier');
  }
}
