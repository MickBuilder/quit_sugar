import 'package:hive_ce_flutter/hive_flutter.dart';

/// Hive box names for different data types
class HiveBoxes {
  // User data
  static const String onboardingData = 'onboarding_data';
  static const String onboardingStatus = 'onboarding_status';
  
  // Tracking data
  static const String dailyTracking = 'daily_tracking';
  static const String foodEntries = 'food_entries';
  static const String dailyLimits = 'daily_limits';
  static const String streaks = 'streaks';
  
  // Historical data
  static const String dailyLogs = 'daily_logs';
  static const String historicalIndex = 'historical_index';
  
  // Subscription data
  static const String subscription = 'subscription';
  static const String subscriptionStatus = 'subscription_status';
  static const String trialData = 'trial_data';
  static const String scanCounts = 'scan_counts';
  
  // Product cache
  static const String productCache = 'product_cache';
  static const String productSearchCache = 'product_search_cache';
  
  // App settings
  static const String appSettings = 'app_settings';
  static const String userPreferences = 'user_preferences';
}

/// Initialize all Hive boxes
Future<void> initializeHiveBoxes() async {
  // Register adapters (will be generated)
  // Hive.registerAdapter(OnboardingDataAdapter());
  // Hive.registerAdapter(DailySummaryAdapter());
  // Hive.registerAdapter(FoodEntryAdapter());
  // Hive.registerAdapter(DailyLogAdapter());
  // Hive.registerAdapter(ProductInfoAdapter());
  // Hive.registerAdapter(SubscriptionStatusAdapter());
  // Hive.registerAdapter(SubscriptionTypeAdapter());
  
  // Open boxes
  await Future.wait([
    Hive.openBox(HiveBoxes.onboardingData),
    Hive.openBox(HiveBoxes.onboardingStatus),
    Hive.openBox(HiveBoxes.dailyTracking),
    Hive.openBox(HiveBoxes.foodEntries),
    Hive.openBox(HiveBoxes.dailyLimits),
    Hive.openBox(HiveBoxes.streaks),
    Hive.openBox(HiveBoxes.dailyLogs),
    Hive.openBox(HiveBoxes.historicalIndex),
    Hive.openBox(HiveBoxes.subscription),
    Hive.openBox(HiveBoxes.subscriptionStatus),
    Hive.openBox(HiveBoxes.trialData),
    Hive.openBox(HiveBoxes.scanCounts),
    Hive.openBox(HiveBoxes.productCache),
    Hive.openBox(HiveBoxes.productSearchCache),
    Hive.openBox(HiveBoxes.appSettings),
    Hive.openBox(HiveBoxes.userPreferences),
  ]);
}

/// Close all Hive boxes
Future<void> closeHiveBoxes() async {
  await Hive.close();
}
