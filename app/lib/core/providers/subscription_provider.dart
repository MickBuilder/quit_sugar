import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/core/services/subscription_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'subscription_provider.g.dart';

@riverpod
class Subscription extends _$Subscription {
  late SubscriptionService _service;

  @override
  Future<SubscriptionService> build() async {
    _service = SubscriptionService();
    await _service.initialize();
    AppLogger.logState('Subscription provider initialized');
    return _service;
  }

  /// Start the 7-day free trial
  Future<bool> startTrial() async {
    final serviceState = await future;
    final success = await serviceState.startTrial();
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after starting trial');
    }
    return success;
  }

  /// Sync premium status with RevenueCat
  Future<bool> syncPremiumStatus() async {
    final serviceState = await future;
    final hasChanged = await serviceState.syncPremiumStatus();
    if (hasChanged) {
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after RevenueCat sync');
    }
    return hasChanged;
  }

  /// Check if user can scan (respects daily limits)
  Future<bool> canScan() async {
    final serviceState = await future;
    return serviceState.canScan();
  }

  /// Record a scan attempt (increments counter for free users)
  Future<bool> recordScan() async {
    final serviceState = await future;
    final success = await serviceState.recordScan();
    if (!success) {
      // Scan limit reached, notify UI
      ref.invalidateSelf();
      AppLogger.logState('Subscription state updated after scan limit reached');
    }
    return success;
  }

  /// Get current subscription info
  SubscriptionInfo getSubscriptionInfo() {
    if (_service.isInitialized) {
      return _service.getSubscriptionInfo();
    } else {
      // Return default info if not initialized yet
      return SubscriptionInfo(
        status: SubscriptionStatus.free,
        trialDaysRemaining: 0,
        remainingScans: 3,
        hasUnlimitedScans: false,
      );
    }
  }

  /// Reset subscription (for testing/development)
  Future<void> resetSubscription() async {
    final serviceState = await future;
    await serviceState.resetSubscription();
    ref.invalidateSelf();
    AppLogger.logState('Subscription reset to free tier');
  }
}
