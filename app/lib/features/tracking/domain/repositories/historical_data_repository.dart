import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';

abstract class HistoricalDataRepository {
  /// Save a daily summary for historical tracking
  Future<void> saveDailySummary(DailyLog summary);
  
  /// Get daily summary for a specific date (YYYY-MM-DD format)
  Future<DailyLog?> getDailySummary(String date);
  
  /// Get daily summaries within a date range (inclusive)
  Future<List<DailyLog>> getDailySummariesInRange({
    required String startDate,
    required String endDate,
  });
  
  /// Get the most recent N daily summaries
  Future<List<DailyLog>> getRecentDailySummaries(int count);
  
  /// Get all available dates that have data
  Future<List<String>> getAvailableDates();
  
  /// Delete daily summary for specific date
  Future<void> deleteDailySummary(String date);
  
  /// Clear all historical data
  Future<void> clearAllHistory();
  
  /// Get statistical information about historical data
  Future<Map<String, dynamic>> getHistoricalStats();
}