import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_info.dart';
import 'package:quit_suggar/features/subscription/domain/usecases/subscription_usecase.dart';
import 'package:quit_suggar/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:quit_suggar/features/subscription/data/repositories/subscription_repository_impl.dart';
import 'package:quit_suggar/features/subscription/data/datasources/subscription_storage_service.dart';
import 'package:quit_suggar/features/subscription/data/datasources/revenuecat_api_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'subscription_provider.g.dart';

// Data sources providers
@riverpod
SubscriptionStorageService subscriptionStorageService(Ref ref) {
  return SubscriptionStorageService();
}

@riverpod
RevenueCatApiService revenueCatApiService(Ref ref) {
  return RevenueCatApiService();
}

// Repository provider
@riverpod
SubscriptionRepository subscriptionRepository(Ref ref) {
  final storageService = ref.watch(subscriptionStorageServiceProvider);
  final apiService = ref.watch(revenueCatApiServiceProvider);
  return SubscriptionRepositoryImpl(storageService, apiService);
}

// Usecase provider
@riverpod
SubscriptionUsecase subscriptionUsecase(Ref ref) {
  final repository = ref.watch(subscriptionRepositoryProvider);
  return SubscriptionUsecase(repository);
}

@riverpod
class Subscription extends _$Subscription {
  late SubscriptionUsecase _usecase;

  @override
  Future<SubscriptionUsecase> build() async {
    _usecase = ref.watch(subscriptionUsecaseProvider);
    await _usecase.initialize();
    AppLogger.logState(
      'Subscription provider initialized with Clean Architecture',
    );
    return _usecase;
  }

  /// Start the 7-day free trial
  Future<bool> startTrial() async {
    final usecaseState = await future;
    final success = await usecaseState.startTrial();
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after starting trial');
    }
    return success;
  }

  /// Show paywall
  Future<bool> showPaywall() async {
    final usecaseState = await future;
    final success = await usecaseState.showPaywall();
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after paywall purchase');
    }
    return success;
  }

  /// Restore purchases
  Future<bool> restorePurchases() async {
    final usecaseState = await future;
    final success = await usecaseState.restorePurchases();
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after restore purchases');
    }
    return success;
  }

  /// Sync premium status with RevenueCat
  Future<bool> syncPremiumStatus() async {
    final usecaseState = await future;
    final hasChanged = await usecaseState.syncPremiumStatus();
    if (hasChanged) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after RevenueCat sync');
    }
    return hasChanged;
  }

  /// Check if user can scan (respects daily limits)
  Future<bool> canScan() async {
    final usecaseState = await future;
    return usecaseState.canScan();
  }

  /// Record a scan attempt (increments counter for free users)
  Future<bool> recordScan() async {
    final usecaseState = await future;
    final success = await usecaseState.recordScan();
    if (!success) {
      // Scan limit reached, notify UI
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after scan limit reached');
    }
    return success;
  }

  /// Get current subscription info
  SubscriptionInfo getSubscriptionInfo() {
    if (_usecase.isInitialized) {
      return _usecase.getSubscriptionInfo();
    } else {
      // Return default info if not initialized yet
      return SubscriptionInfo(
        status: SubscriptionStatus.free,
        trialDaysRemaining: 0,
        remainingScans: 10,
        hasUnlimitedScans: false,
      );
    }
  }

  /// Reset subscription (for testing/development)
  Future<void> resetSubscription() async {
    final usecaseState = await future;
    await usecaseState.resetSubscription();
    ref.invalidateSelf();
    AppLogger.logState('Subscription reset to free tier');
  }
}
