import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import 'package:quit_suggar/core/services/logger_service.dart';

part 'daily_transition_service.g.dart';

/// Service that handles the transition from one day to the next
class DailyTransitionService {

  
  DailyTransitionService();
  
  /// Check if we need to transition to a new day and handle it
  Future<bool> checkAndHandleDayTransition({
    required String? lastTrackingDate,
    required Future<void> Function() resetToday,
    required Future<void> Function() syncDailyLimit,
    required Future<void> Function(String) saveLastTrackingDate,
  }) async {
    try {
      final today = DateTime.now();
      final todayDateString = _formatDate(today);
      
      AppLogger.logState(
        'Checking day transition: last=$lastTrackingDate, today=$todayDateString',
      );
      
      // If this is the first time using the app, no transition needed
      if (lastTrackingDate == null) {
        AppLogger.logState('First time using app - no day transition needed');
        return false;
      }
      
      // If we're still on the same day, no transition needed
      if (lastTrackingDate == todayDateString) {
        AppLogger.logState('Still same day - no transition needed');
        return false;
      }
      
      // We need to transition! Save yesterday's data and reset for today
      await _performDayTransition(
        yesterdayDate: lastTrackingDate,
        todayDate: todayDateString,
        resetToday: resetToday,
        syncDailyLimit: syncDailyLimit,
        saveLastTrackingDate: saveLastTrackingDate,
      );
      return true;
      
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to check/handle day transition',
        e,
        stackTrace,
      );
      return false;
    }
  }
  
  /// Perform the actual day transition
  Future<void> _performDayTransition({
    required String yesterdayDate,
    required String todayDate,
    required Future<void> Function() resetToday,
    required Future<void> Function() syncDailyLimit,
    required Future<void> Function(String) saveLastTrackingDate,
  }) async {
    try {
      AppLogger.logState('Performing day transition: $yesterdayDate -> $todayDate');
      
      // Reset tracking system for today
      await resetToday();
      
      // Sync today's daily limit from onboarding progression
      await syncDailyLimit();
      
      // Update the last tracking date to today
      await saveLastTrackingDate(todayDate);
      
      AppLogger.logState(
        'Day transition complete for $yesterdayDate -> $todayDate',
      );
      
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to perform day transition',
        e,
        stackTrace,
      );
    }
  }
  
  /// Format date as YYYY-MM-DD
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}



@riverpod
DailyTransitionService dailyTransitionService(Ref ref) {
  return DailyTransitionService();
}