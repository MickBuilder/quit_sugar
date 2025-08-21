import 'dart:io';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/services/subscription_service.dart';

class RevenueCatService {
  // TODO: Replace with your actual RevenueCat API keys from the dashboard
  static const String _androidAPIKey = 'rc_android_YOUR_KEY_HERE';
  static const String _iosAPIKey = 'rc_ios_YOUR_KEY_HERE';

  static bool _isConfigured = false;

  /// Initialize RevenueCat SDK
  static Future<bool> initialize() async {
    if (_isConfigured) return true;

    try {
      // Set log level for debugging
      await Purchases.setLogLevel(LogLevel.debug);

      // Configure RevenueCat
      late PurchasesConfiguration configuration;
      if (Platform.isAndroid) {
        configuration = PurchasesConfiguration(_androidAPIKey);
      } else if (Platform.isIOS) {
        configuration = PurchasesConfiguration(_iosAPIKey);
      } else {
        AppLogger.logSugarTrackingError('Unsupported platform for RevenueCat');
        return false;
      }

      await Purchases.configure(configuration);

      // Set user ID for analytics (optional)
      await Purchases.logIn('user_${DateTime.now().millisecondsSinceEpoch}');

      _isConfigured = true;
      AppLogger.logState('RevenueCat initialized successfully');
      return true;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to initialize RevenueCat',
        e,
        stackTrace,
      );
      return false;
    }
  }

  /// Show RevenueCat paywall
  static Future<bool> showPaywall({String? displayCloseButton}) async {
    try {
      if (!_isConfigured) {
        final initialized = await initialize();
        if (!initialized) return false;
      }

      AppLogger.logUserAction('Showing RevenueCat paywall');

      // Show the RevenueCat paywall UI
      final paywallResult = await RevenueCatUI.presentPaywallIfNeeded(
        "premium",
      );

      if (paywallResult == PaywallResult.purchased) {
        AppLogger.logUserAction('Purchase completed via RevenueCat paywall');
        return true;
      } else if (paywallResult == PaywallResult.cancelled) {
        AppLogger.logUserAction('Paywall cancelled by user');
        return false;
      } else if (paywallResult == PaywallResult.error) {
        AppLogger.logSugarTrackingError('Paywall error');
        return false;
      }

      return false;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to show paywall', e, stackTrace);
      return false;
    }
  }

  /// Check if user has premium entitlement
  static Future<bool> hasPremiumAccess() async {
    try {
      if (!_isConfigured) {
        final initialized = await initialize();
        if (!initialized) return false;
      }

      final customerInfo = await Purchases.getCustomerInfo();
      final hasPremium =
          customerInfo.entitlements.all['premium']?.isActive == true;

      AppLogger.logState('Premium access check: $hasPremium');
      return hasPremium;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to check premium access',
        e,
        stackTrace,
      );
      return false;
    }
  }

  /// Restore purchases
  static Future<bool> restorePurchases() async {
    try {
      if (!_isConfigured) {
        final initialized = await initialize();
        if (!initialized) return false;
      }

      AppLogger.logUserAction('Attempting to restore purchases');

      final customerInfo = await Purchases.restorePurchases();
      final hasPremium =
          customerInfo.entitlements.all['premium']?.isActive == true;

      if (hasPremium) {
        AppLogger.logUserAction('Purchases restored successfully');
        return true;
      } else {
        AppLogger.logState(
          'No active premium entitlement found during restore',
        );
        return false;
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to restore purchases',
        e,
        stackTrace,
      );
      return false;
    }
  }

  /// Get customer info
  static Future<CustomerInfo?> getCustomerInfo() async {
    try {
      if (!_isConfigured) {
        final initialized = await initialize();
        if (!initialized) return null;
      }

      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to get customer info',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Convert active entitlement to subscription type
  static SubscriptionType? getActiveSubscriptionType() {
    // This would need to be implemented based on your product setup
    // For now, return monthly as default
    return SubscriptionType.monthly;
  }
}
