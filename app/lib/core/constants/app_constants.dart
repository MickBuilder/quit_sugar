class AppConstants {
  // App information
  static const String appName = 'Quit Sugar';
  static const String appVersion = '1.0.0';
  
  // Default values
  static const double defaultDailySugarLimit = 25.0; // grams
  static const double defaultPortionSize = 100.0; // grams
  
  // UI constants
  static const double defaultBorderRadius = 8.0;
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultIconSize = 24.0;
  
  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // API constants
  static const String openFoodFactsBaseUrl = 'https://world.openfoodfacts.org';
  static const int apiTimeoutSeconds = 30;
  
  // Storage keys
  static const String dailySugarLimitKey = 'daily_sugar_limit';
  static const String userPreferencesKey = 'user_preferences';
  static const String subscriptionStatusKey = 'subscription_status';
  
  // Feature flags
  static const bool enablePremiumFeatures = true;
  static const bool enableAnalytics = true;
  
  // Validation constants
  static const int maxBarcodeLength = 13;
  static const int maxProductNameLength = 100;
  static const double maxSugarAmount = 1000.0; // grams
  
  // Progress tracking
  static const int maxStreakDays = 365;
  static const int weeklyGoalDays = 7;
  
  // Subscription
  static const String premiumEntitlementId = 'premium';
  static const String monthlyProductId = 'monthly_premium';
  static const String yearlyProductId = 'yearly_premium';
  
  // Error messages
  static const String networkErrorMessage = 'Please check your internet connection and try again.';
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String productNotFoundMessage = 'Product not found. Please try scanning again.';
  
  // Success messages
  static const String productAddedMessage = 'Product added successfully!';
  static const String purchaseSuccessfulMessage = 'Purchase completed successfully!';
  static const String dataSavedMessage = 'Data saved successfully!';
}
