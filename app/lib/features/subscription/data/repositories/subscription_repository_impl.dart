import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';
import 'package:quit_suggar/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:quit_suggar/features/subscription/data/datasources/subscription_storage_service.dart';
import 'package:quit_suggar/features/subscription/data/datasources/revenuecat_api_service.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionStorageService _storageService;
  final RevenueCatApiService _apiService;

  SubscriptionRepositoryImpl(this._storageService, this._apiService);

  // Storage operations
  @override
  Future<SubscriptionStatus> getSubscriptionStatus() async {
    return await _storageService.loadSubscriptionStatus();
  }

  @override
  Future<void> saveSubscriptionStatus(SubscriptionStatus status) async {
    await _storageService.saveSubscriptionStatus(status);
  }

  @override
  Future<SubscriptionType?> getSubscriptionType() async {
    return await _storageService.loadSubscriptionType();
  }

  @override
  Future<void> saveSubscriptionType(SubscriptionType? type) async {
    await _storageService.saveSubscriptionType(type);
  }

  @override
  Future<DateTime?> getTrialStartDate() async {
    return await _storageService.loadTrialStartDate();
  }

  @override
  Future<void> saveTrialStartDate(DateTime? date) async {
    await _storageService.saveTrialStartDate(date);
  }

  @override
  Future<DateTime?> getSubscriptionExpiry() async {
    return await _storageService.loadSubscriptionExpiry();
  }

  @override
  Future<void> saveSubscriptionExpiry(DateTime? expiry) async {
    await _storageService.saveSubscriptionExpiry(expiry);
  }

  @override
  Future<int> getDailyScanCount() async {
    return await _storageService.loadDailyScanCount();
  }

  @override
  Future<void> saveScanCount(int count) async {
    await _storageService.saveScanCount(count);
  }

  @override
  Future<void> saveAllSubscriptionData({
    required SubscriptionStatus status,
    SubscriptionType? subscriptionType,
    DateTime? trialStartDate,
    DateTime? subscriptionExpiry,
  }) async {
    await _storageService.saveAllSubscriptionData(
      status: status,
      subscriptionType: subscriptionType,
      trialStartDate: trialStartDate,
      subscriptionExpiry: subscriptionExpiry,
    );
  }

  @override
  Future<void> clearAllData() async {
    await _storageService.clearAllData();
  }

  // API operations
  @override
  Future<bool> initializeRevenueCat() async {
    return await _apiService.initialize();
  }

  @override
  Future<PaywallResult> showPaywall() async {
    return await _apiService.showPaywall();
  }

  @override
  Future<bool> hasPremiumAccess() async {
    return await _apiService.hasPremiumAccess();
  }

  @override
  Future<bool> restorePurchases() async {
    return await _apiService.restorePurchases();
  }

  @override
  Future<SubscriptionType?> getActiveSubscriptionType() async {
    return await _apiService.getActiveSubscriptionType();
  }

  @override
  Future<DateTime?> getRemoteSubscriptionExpiry() async {
    return await _apiService.getSubscriptionExpiry();
  }
}
