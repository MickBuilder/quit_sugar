import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

/// Hive-based storage service for the app
/// Uses simple key-value storage with JSON serialization
class HiveStorageService {
  static const String _onboardingBox = 'onboarding_data';
  static const String _trackingBox = 'tracking_data';
  static const String _subscriptionBox = 'subscription_data';
  static const String _productCacheBox = 'product_cache';
  static const String _historicalBox = 'historical_data';
  static const String _settingsBox = 'app_settings';

  /// Initialize Hive storage
  static Future<void> initialize() async {
    try {
      await Hive.initFlutter();
      
      // Open boxes
      await Future.wait([
        Hive.openBox(_onboardingBox),
        Hive.openBox(_trackingBox),
        Hive.openBox(_subscriptionBox),
        Hive.openBox(_productCacheBox),
        Hive.openBox(_historicalBox),
        Hive.openBox(_settingsBox),
      ]);
      
      AppLogger.logState('Hive storage initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to initialize Hive storage', e, stackTrace);
      rethrow;
    }
  }

  /// Close all Hive boxes
  static Future<void> close() async {
    await Hive.close();
  }

  // ===== ONBOARDING DATA =====
  
  /// Save onboarding data
  static Future<void> saveOnboardingData(Map<String, dynamic> data) async {
    try {
      final box = Hive.box(_onboardingBox);
      await box.put('onboarding_data', json.encode(data));
      AppLogger.logState('Onboarding data saved to Hive');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save onboarding data', e, stackTrace);
    }
  }

  /// Get onboarding data
  static Future<Map<String, dynamic>?> getOnboardingData() async {
    try {
      final box = Hive.box(_onboardingBox);
      final data = box.get('onboarding_data');
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get onboarding data', e, stackTrace);
      return null;
    }
  }

  /// Save onboarding completion status
  static Future<void> saveOnboardingCompleted(bool completed) async {
    try {
      final box = Hive.box(_onboardingBox);
      await box.put('onboarding_completed', completed);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save onboarding status', e, stackTrace);
    }
  }

  /// Get onboarding completion status
  static Future<bool> getOnboardingCompleted() async {
    try {
      final box = Hive.box(_onboardingBox);
      return box.get('onboarding_completed', defaultValue: false);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get onboarding status', e, stackTrace);
      return false;
    }
  }

  // ===== TRACKING DATA =====

  /// Save daily tracking data
  static Future<void> saveDailyTracking(Map<String, dynamic> data) async {
    try {
      final box = Hive.box(_trackingBox);
      await box.put('daily_tracking', json.encode(data));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save daily tracking', e, stackTrace);
    }
  }

  /// Get daily tracking data
  static Future<Map<String, dynamic>?> getDailyTracking() async {
    try {
      final box = Hive.box(_trackingBox);
      final data = box.get('daily_tracking');
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get daily tracking', e, stackTrace);
      return null;
    }
  }

  /// Save food entries
  static Future<void> saveFoodEntries(List<Map<String, dynamic>> entries) async {
    try {
      final box = Hive.box(_trackingBox);
      await box.put('food_entries', json.encode(entries));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save food entries', e, stackTrace);
    }
  }

  /// Get food entries
  static Future<List<Map<String, dynamic>>> getFoodEntries() async {
    try {
      final box = Hive.box(_trackingBox);
      final data = box.get('food_entries');
      if (data != null) {
        final List<dynamic> entries = json.decode(data);
        return entries.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get food entries', e, stackTrace);
      return [];
    }
  }

  /// Save streak data
  static Future<void> saveStreakData(Map<String, dynamic> data) async {
    try {
      final box = Hive.box(_trackingBox);
      await box.put('streak_data', json.encode(data));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save streak data', e, stackTrace);
    }
  }

  /// Get streak data
  static Future<Map<String, dynamic>?> getStreakData() async {
    try {
      final box = Hive.box(_trackingBox);
      final data = box.get('streak_data');
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get streak data', e, stackTrace);
      return null;
    }
  }

  // ===== SUBSCRIPTION DATA =====

  /// Save subscription data
  static Future<void> saveSubscriptionData(Map<String, dynamic> data) async {
    try {
      final box = Hive.box(_subscriptionBox);
      await box.put('subscription_data', json.encode(data));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save subscription data', e, stackTrace);
    }
  }

  /// Get subscription data
  static Future<Map<String, dynamic>?> getSubscriptionData() async {
    try {
      final box = Hive.box(_subscriptionBox);
      final data = box.get('subscription_data');
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get subscription data', e, stackTrace);
      return null;
    }
  }

  // ===== PRODUCT CACHE =====

  /// Save product to cache
  static Future<void> saveProductToCache(String barcode, Map<String, dynamic> product) async {
    try {
      final box = Hive.box(_productCacheBox);
      await box.put(barcode, json.encode(product));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save product to cache', e, stackTrace);
    }
  }

  /// Get product from cache
  static Future<Map<String, dynamic>?> getProductFromCache(String barcode) async {
    try {
      final box = Hive.box(_productCacheBox);
      final data = box.get(barcode);
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get product from cache', e, stackTrace);
      return null;
    }
  }

  /// Clear product cache
  static Future<void> clearProductCache() async {
    try {
      final box = Hive.box(_productCacheBox);
      await box.clear();
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to clear product cache', e, stackTrace);
    }
  }

  // ===== HISTORICAL DATA =====

  /// Save historical data (complete map)
  static Future<void> saveHistoricalData(Map<String, dynamic> data) async {
    try {
      final box = Hive.box(_historicalBox);
      await box.put('historical_data', json.encode(data));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save historical data', e, stackTrace);
    }
  }

  /// Get historical data (complete map)
  static Future<Map<String, dynamic>?> getHistoricalData() async {
    try {
      final box = Hive.box(_historicalBox);
      final data = box.get('historical_data');
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get historical data', e, stackTrace);
      return null;
    }
  }

  /// Save daily log
  static Future<void> saveDailyLog(String date, Map<String, dynamic> log) async {
    try {
      final box = Hive.box(_historicalBox);
      await box.put(date, json.encode(log));
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save daily log', e, stackTrace);
    }
  }

  /// Get daily log
  static Future<Map<String, dynamic>?> getDailyLog(String date) async {
    try {
      final box = Hive.box(_historicalBox);
      final data = box.get(date);
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get daily log', e, stackTrace);
      return null;
    }
  }

  /// Get all historical dates
  static Future<List<String>> getHistoricalDates() async {
    try {
      final box = Hive.box(_historicalBox);
      return box.keys.cast<String>().toList();
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get historical dates', e, stackTrace);
      return [];
    }
  }

  // ===== APP SETTINGS =====

  /// Save app setting
  static Future<void> saveSetting(String key, dynamic value) async {
    try {
      final box = Hive.box(_settingsBox);
      await box.put(key, value);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save setting', e, stackTrace);
    }
  }

  /// Get app setting
  static T? getSetting<T>(String key, {T? defaultValue}) {
    try {
      final box = Hive.box(_settingsBox);
      return box.get(key, defaultValue: defaultValue);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get setting', e, stackTrace);
      return defaultValue;
    }
  }

  // ===== UTILITY METHODS =====

  /// Clear all data
  static Future<void> clearAllData() async {
    try {
      await Future.wait([
        Hive.box(_onboardingBox).clear(),
        Hive.box(_trackingBox).clear(),
        Hive.box(_subscriptionBox).clear(),
        Hive.box(_productCacheBox).clear(),
        Hive.box(_historicalBox).clear(),
        Hive.box(_settingsBox).clear(),
      ]);
      AppLogger.logState('All Hive data cleared');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to clear all data', e, stackTrace);
    }
  }

  /// Get storage statistics
  static Map<String, int> getStorageStats() {
    try {
      return {
        'onboarding': Hive.box(_onboardingBox).length,
        'tracking': Hive.box(_trackingBox).length,
        'subscription': Hive.box(_subscriptionBox).length,
        'product_cache': Hive.box(_productCacheBox).length,
        'historical': Hive.box(_historicalBox).length,
        'settings': Hive.box(_settingsBox).length,
      };
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to get storage stats', e, stackTrace);
      return {};
    }
  }
}
