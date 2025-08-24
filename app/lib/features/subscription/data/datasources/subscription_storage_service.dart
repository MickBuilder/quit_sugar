import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class SubscriptionStorageService {
  static const String _prefsKeySubscriptionStatus = 'subscription_status';
  static const String _prefsKeyTrialStartDate = 'trial_start_date';
  static const String _prefsKeyDailyScanCount = 'daily_scan_count';
  static const String _prefsKeyLastScanDate = 'last_scan_date';
  static const String _prefsKeySubscriptionType = 'subscription_type';
  static const String _prefsKeySubscriptionExpiry = 'subscription_expiry';

  /// Load subscription status from storage
  Future<SubscriptionStatus> loadSubscriptionStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final statusString = prefs.getString(_prefsKeySubscriptionStatus);

      if (statusString != null) {
        return SubscriptionStatus.values.firstWhere(
          (status) => status.name == statusString,
          orElse: () => SubscriptionStatus.free,
        );
      }

      return SubscriptionStatus.free;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load subscription status from storage',
        e,
        stackTrace,
      );
      return SubscriptionStatus.free;
    }
  }

  /// Save subscription status to storage
  Future<void> saveSubscriptionStatus(SubscriptionStatus status) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKeySubscriptionStatus, status.name);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save subscription status to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load subscription type from storage
  Future<SubscriptionType?> loadSubscriptionType() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final typeString = prefs.getString(_prefsKeySubscriptionType);

      if (typeString != null) {
        return SubscriptionType.values.firstWhere(
          (type) => type.name == typeString,
          orElse: () => SubscriptionType.monthly,
        );
      }

      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load subscription type from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save subscription type to storage
  Future<void> saveSubscriptionType(SubscriptionType? type) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (type != null) {
        await prefs.setString(_prefsKeySubscriptionType, type.name);
      } else {
        await prefs.remove(_prefsKeySubscriptionType);
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save subscription type to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load trial start date from storage
  Future<DateTime?> loadTrialStartDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final trialStartString = prefs.getString(_prefsKeyTrialStartDate);

      if (trialStartString != null) {
        return DateTime.parse(trialStartString);
      }

      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load trial start date from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save trial start date to storage
  Future<void> saveTrialStartDate(DateTime? date) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (date != null) {
        await prefs.setString(_prefsKeyTrialStartDate, date.toIso8601String());
      } else {
        await prefs.remove(_prefsKeyTrialStartDate);
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save trial start date to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load subscription expiry date from storage
  Future<DateTime?> loadSubscriptionExpiry() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiryString = prefs.getString(_prefsKeySubscriptionExpiry);

      if (expiryString != null) {
        return DateTime.parse(expiryString);
      }

      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load subscription expiry from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save subscription expiry date to storage
  Future<void> saveSubscriptionExpiry(DateTime? expiry) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (expiry != null) {
        await prefs.setString(
          _prefsKeySubscriptionExpiry,
          expiry.toIso8601String(),
        );
      } else {
        await prefs.remove(_prefsKeySubscriptionExpiry);
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save subscription expiry to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load daily scan count and reset if new day
  Future<int> loadDailyScanCount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final today = DateTime.now().toIso8601String().split('T')[0];
      final lastScanDate = prefs.getString(_prefsKeyLastScanDate);

      if (lastScanDate != today) {
        // New day, reset scan count
        await _saveScanCount(0);
        return 0;
      } else {
        // Same day, load existing count
        return prefs.getInt(_prefsKeyDailyScanCount) ?? 0;
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load daily scan count from storage',
        e,
        stackTrace,
      );
      return 0;
    }
  }

  /// Save daily scan count to storage
  Future<void> saveScanCount(int count) async {
    await _saveScanCount(count);
  }

  Future<void> _saveScanCount(int count) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final today = DateTime.now().toIso8601String().split('T')[0];

      await Future.wait([
        prefs.setInt(_prefsKeyDailyScanCount, count),
        prefs.setString(_prefsKeyLastScanDate, today),
      ]);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save scan count to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Save all subscription data in batch
  Future<void> saveAllSubscriptionData({
    required SubscriptionStatus status,
    SubscriptionType? subscriptionType,
    DateTime? trialStartDate,
    DateTime? subscriptionExpiry,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final futures = <Future>[
        prefs.setString(_prefsKeySubscriptionStatus, status.name),
      ];

      if (subscriptionType != null) {
        futures.add(
          prefs.setString(_prefsKeySubscriptionType, subscriptionType.name),
        );
      } else {
        futures.add(prefs.remove(_prefsKeySubscriptionType));
      }

      if (trialStartDate != null) {
        futures.add(
          prefs.setString(
            _prefsKeyTrialStartDate,
            trialStartDate.toIso8601String(),
          ),
        );
      } else {
        futures.add(prefs.remove(_prefsKeyTrialStartDate));
      }

      if (subscriptionExpiry != null) {
        futures.add(
          prefs.setString(
            _prefsKeySubscriptionExpiry,
            subscriptionExpiry.toIso8601String(),
          ),
        );
      } else {
        futures.add(prefs.remove(_prefsKeySubscriptionExpiry));
      }

      await Future.wait(futures);
      AppLogger.logState('Saved subscription data - Status: ${status.name}');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save subscription data in batch',
        e,
        stackTrace,
      );
    }
  }

  /// Clear all subscription data (for reset/testing)
  Future<void> clearAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await Future.wait([
        prefs.remove(_prefsKeySubscriptionStatus),
        prefs.remove(_prefsKeySubscriptionType),
        prefs.remove(_prefsKeyTrialStartDate),
        prefs.remove(_prefsKeySubscriptionExpiry),
        prefs.remove(_prefsKeyDailyScanCount),
        prefs.remove(_prefsKeyLastScanDate),
      ]);

      AppLogger.logState('Cleared all subscription data from storage');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to clear subscription data',
        e,
        stackTrace,
      );
    }
  }
}
