import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'daily_limit_sync_service.g.dart';

/// Service to sync daily limit from onboarding progression to tracking system
class DailyLimitSyncService {
  /// Sync the current daily limit from onboarding data to tracking system
  Future<void> syncDailyLimit({
    required double currentLimit,
    required Future<void> Function(double) setDailyLimit,
  }) async {
    try {
      // Update tracking system with the provided limit
      await setDailyLimit(currentLimit);
      
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
  Future<void> syncLimitIfOnboardingCompleted({
    required bool isOnboardingCompleted,
    required double currentDailyLimit,
    required Future<void> Function(double) setDailyLimit,
  }) async {
    try {
      if (isOnboardingCompleted) {
        await syncDailyLimit(
          currentLimit: currentDailyLimit,
          setDailyLimit: setDailyLimit,
        );
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
  return DailyLimitSyncService();
}