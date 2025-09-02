import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/storage/hive_storage_service.dart';

class SubscriptionStorageService {

  /// Load subscription status from storage
  Future<SubscriptionStatus> loadSubscriptionStatus() async {
    try {
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      final statusString = subscriptionData?['subscription_status'];

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
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};
      subscriptionData['subscription_status'] = status.name;
      await HiveStorageService.saveSubscriptionData(subscriptionData);
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
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      final typeString = subscriptionData?['subscription_type'];

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
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};

      if (type != null) {
        subscriptionData['subscription_type'] = type.name;
      } else {
        subscriptionData.remove('subscription_type');
      }
      
      await HiveStorageService.saveSubscriptionData(subscriptionData);
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
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      final trialStartString = subscriptionData?['trial_start_date'];

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
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};

      if (date != null) {
        subscriptionData['trial_start_date'] = date.toIso8601String();
      } else {
        subscriptionData.remove('trial_start_date');
      }

      await HiveStorageService.saveSubscriptionData(subscriptionData);
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
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      final expiryString = subscriptionData?['subscription_expiry'];

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
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};

      if (expiry != null) {
        subscriptionData['subscription_expiry'] = expiry.toIso8601String();
      } else {
        subscriptionData.remove('subscription_expiry');
      }

      await HiveStorageService.saveSubscriptionData(subscriptionData);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save subscription expiry to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load daily scan count from storage
  Future<int> loadDailyScanCount() async {
    try {
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      return subscriptionData?['daily_scan_count']?.toInt() ?? 0;
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
  Future<void> saveDailyScanCount(int count) async {
    try {
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};
      subscriptionData['daily_scan_count'] = count;
      await HiveStorageService.saveSubscriptionData(subscriptionData);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save daily scan count to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load last scan date from storage
  Future<String?> loadLastScanDate() async {
    try {
      final subscriptionData = await HiveStorageService.getSubscriptionData();
      return subscriptionData?['last_scan_date'];
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load last scan date from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save last scan date to storage
  Future<void> saveLastScanDate(String date) async {
    try {
      final subscriptionData = await HiveStorageService.getSubscriptionData() ?? {};
      subscriptionData['last_scan_date'] = date;
      await HiveStorageService.saveSubscriptionData(subscriptionData);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save last scan date to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Reset daily scan count (called when date changes)
  Future<void> resetDailyScanCount() async {
    try {
      await saveDailyScanCount(0);
      AppLogger.logState('Reset daily scan count');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to reset daily scan count',
        e,
        stackTrace,
      );
    }
  }

  /// Increment daily scan count
  Future<void> incrementDailyScanCount() async {
    try {
      final currentCount = await loadDailyScanCount();
      await saveDailyScanCount(currentCount + 1);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to increment daily scan count',
        e,
        stackTrace,
      );
    }
  }

  /// Clear all subscription data
  Future<void> clearAllData() async {
    try {
      await HiveStorageService.saveSubscriptionData({});
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
