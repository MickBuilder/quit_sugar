import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';

abstract class SubscriptionRepository {
  // Storage operations
  Future<SubscriptionStatus> getSubscriptionStatus();
  Future<void> saveSubscriptionStatus(SubscriptionStatus status);

  Future<SubscriptionType?> getSubscriptionType();
  Future<void> saveSubscriptionType(SubscriptionType? type);

  Future<DateTime?> getTrialStartDate();
  Future<void> saveTrialStartDate(DateTime? date);

  Future<DateTime?> getSubscriptionExpiry();
  Future<void> saveSubscriptionExpiry(DateTime? expiry);

  Future<int> getDailyScanCount();
  Future<void> saveScanCount(int count);

  Future<void> saveAllSubscriptionData({
    required SubscriptionStatus status,
    SubscriptionType? subscriptionType,
    DateTime? trialStartDate,
    DateTime? subscriptionExpiry,
  });

  Future<void> clearAllData();

  // API operations
  Future<bool> initializeRevenueCat();
  Future<PaywallResult> showPaywall();
  Future<bool> hasPremiumAccess();
  Future<bool> restorePurchases();
  Future<SubscriptionType?> getActiveSubscriptionType();
  Future<DateTime?> getRemoteSubscriptionExpiry();
}
