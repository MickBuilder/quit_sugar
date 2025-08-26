import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'daily_limit_sync_service.g.dart';

/// Service to sync daily limit from onboarding progression to tracking system
class DailyLimitSyncService {
  final Ref _ref;
  
  DailyLimitSyncService(this._ref);
  
  /// Sync the current daily limit from onboarding data to tracking system
  Future<void> syncDailyLimit() async {
    try {
      // Get current daily limit from onboarding progression
      final currentLimit = await _ref.read(currentDailyLimitProvider.future);
      
      // Update tracking system with this limit
      final sugarTrackingNotifier = _ref.read(sugarTrackingProvider.notifier);
      await sugarTrackingNotifier.setDailyLimit(currentLimit);
      
      AppLogger.logState(
        'Daily limit synced: ${currentLimit.toStringAsFixed(1)}g',
        {'source': 'onboarding_progression', 'limit': currentLimit},
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to sync daily limit from onboarding',
        e,
        stackTrace,
      );
    }
  }
  
  /// Check if onboarding is completed and sync limit if needed
  Future<void> syncLimitIfOnboardingCompleted() async {
    try {
      final isCompleted = await _ref.read(onboardingStatusProvider.future);
      
      if (isCompleted) {
        await syncDailyLimit();
      } else {
        AppLogger.logState(
          'Skipping daily limit sync - onboarding not completed',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to check onboarding status for limit sync',
        e,
        stackTrace,
      );
    }
  }
}

@riverpod
DailyLimitSyncService dailyLimitSyncService(Ref ref) {
  return DailyLimitSyncService(ref);
}