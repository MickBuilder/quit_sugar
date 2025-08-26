import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary_history.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/historical_data_repository.dart';
import 'package:quit_suggar/features/tracking/data/repositories/historical_data_repository_impl.dart';
import 'package:quit_suggar/features/tracking/data/datasources/historical_data_service.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/daily_limit_sync_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'daily_transition_service.g.dart';

/// Service that handles the transition from one day to the next
class DailyTransitionService {
  final Ref _ref;
  final HistoricalDataRepository _historicalRepo;
  
  DailyTransitionService(this._ref, this._historicalRepo);
  
  /// Check if we need to transition to a new day and handle it
  Future<bool> checkAndHandleDayTransition() async {
    try {
      final today = DateTime.now();
      final todayDateString = _formatDate(today);
      
      // Get the last tracking date from the tracking system
      final trackingRepo = _ref.read(trackingRepositoryProvider);
      final lastTrackingDate = await trackingRepo.getLastTrackingDate();
      
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
      await _performDayTransition(lastTrackingDate, todayDateString);
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
  Future<void> _performDayTransition(String yesterdayDate, String todayDate) async {
    try {
      AppLogger.logState('Performing day transition: $yesterdayDate -> $todayDate');
      
      // Get yesterday's current state from tracking system
      final sugarTracking = await _ref.read(sugarTrackingProvider.future);
      final dailySummary = sugarTracking.getDailySummary();
      
      // Convert current daily summary to historical summary
      final yesterdayHistory = await _createHistoricalSummary(
        yesterdayDate,
        dailySummary,
      );
      
      // Save yesterday's data to history
      await _historicalRepo.saveDailySummary(yesterdayHistory);
      
      // Reset tracking system for today
      final sugarTrackingNotifier = _ref.read(sugarTrackingProvider.notifier);
      await sugarTrackingNotifier.resetToday();
      
      // Sync today's daily limit from onboarding progression
      final syncService = _ref.read(dailyLimitSyncServiceProvider);
      await syncService.syncDailyLimit();
      
      // Update the last tracking date to today
      final trackingRepo = _ref.read(trackingRepositoryProvider);
      await trackingRepo.saveLastTrackingDate(todayDate);
      
      AppLogger.logState(
        'Day transition complete: saved ${yesterdayHistory.totalSugar.toStringAsFixed(1)}g sugar from $yesterdayDate',
      );
      
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to perform day transition',
        e,
        stackTrace,
      );
    }
  }
  
  /// Create a historical summary from current daily summary
  Future<DailySummaryHistory> _createHistoricalSummary(
    String date,
    DailySummary currentSummary,
  ) async {
    // Determine if this was a streak day (didn't exceed limit)
    final streakDay = !currentSummary.status.name.contains('overLimit') && 
                     currentSummary.progressPercentage <= 100;
    
    // Get current streak count
    final currentStreak = currentSummary.streak;
    
    // Calculate streak count at end of day
    final streakCountAtEndOfDay = streakDay ? currentStreak : 0;
    
    // Get top foods from entries
    final topFoods = _getTopFoodsFromEntries(currentSummary.entries);
    
    return DailySummaryHistory(
      date: date,
      totalSugar: currentSummary.totalSugar,
      dailyLimit: currentSummary.dailyLimit,
      remainingSugar: currentSummary.remainingSugar,
      progressPercentage: currentSummary.progressPercentage,
      limitExceeded: currentSummary.progressPercentage > 100,
      streakDay: streakDay,
      streakCountAtEndOfDay: streakCountAtEndOfDay,
      entryCount: currentSummary.entries.length,
      topFoods: topFoods,
      timestamp: DateTime.now(),
    );
  }
  
  /// Extract top 3 food names from entries
  List<String> _getTopFoodsFromEntries(List<dynamic> entries) {
    try {
      if (entries.isEmpty) return [];
      
      // Group entries by food name and sum their sugar content
      final Map<String, double> foodSugarMap = {};
      
      for (final entry in entries) {
        final foodName = entry.foodName as String? ?? 'Unknown';
        final sugarAmount = (entry.sugarAmount as num?)?.toDouble() ?? 0.0;
        
        foodSugarMap[foodName] = (foodSugarMap[foodName] ?? 0.0) + sugarAmount;
      }
      
      // Sort by sugar amount (highest first) and take top 3
      final sortedFoods = foodSugarMap.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      return sortedFoods
          .take(3)
          .map((entry) => entry.key)
          .toList();
          
    } catch (e) {
      AppLogger.logSugarTrackingError('Failed to extract top foods from entries', e);
      return [];
    }
  }
  
  /// Format date as YYYY-MM-DD
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

// Providers
@riverpod
HistoricalDataService historicalDataService(Ref ref) {
  return HistoricalDataService();
}

@riverpod
HistoricalDataRepository historicalDataRepository(Ref ref) {
  final dataService = ref.watch(historicalDataServiceProvider);
  return HistoricalDataRepositoryImpl(dataService);
}

@riverpod
DailyTransitionService dailyTransitionService(Ref ref) {
  final historicalRepo = ref.watch(historicalDataRepositoryProvider);
  return DailyTransitionService(ref, historicalRepo);
}