import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/data/models/daily_log_model.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class HistoricalDataService {
  static const String _prefixKey = 'daily_history_';
  static const String _historyIndexKey = 'history_date_index';

  /// Save a daily summary to historical storage
  Future<void> saveDailySummary(DailyLog summary) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final model = DailyLogModel.fromDomain(summary);
      final jsonString = json.encode(model.toJson());
      
      // Save the summary with date as key
      final key = '$_prefixKey${summary.date}';
      await prefs.setString(key, jsonString);
      
      // Update the index of available dates
      await _addToDateIndex(summary.date);
      
      AppLogger.logSugarTracking(
        'Saved daily summary for ${summary.date}: ${summary.totalSugar.toStringAsFixed(1)}g sugar',
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save daily summary for ${summary.date}',
        e,
        stackTrace,
      );
    }
  }

  /// Get a specific daily summary by date (YYYY-MM-DD format)
  Future<DailyLog?> getDailySummary(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_prefixKey$date';
      final jsonString = prefs.getString(key);
      
      if (jsonString == null) return null;
      
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      final model = DailyLogModel.fromJson(jsonMap);
      return model.toDomain();
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to get daily summary for $date',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Get all daily summaries in date range (inclusive)
  Future<List<DailyLog>> getDailySummariesInRange({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final dates = await _getDateIndex();
      final filteredDates = dates.where((date) {
        return date.compareTo(startDate) >= 0 && date.compareTo(endDate) <= 0;
      }).toList();
      
      final summaries = <DailyLog>[];
      for (final date in filteredDates) {
        final summary = await getDailySummary(date);
        if (summary != null) {
          summaries.add(summary);
        }
      }
      
      // Sort by date (oldest first)
      summaries.sort((a, b) => a.date.compareTo(b.date));
      
      AppLogger.logSugarTracking(
        'Retrieved ${summaries.length} daily summaries from $startDate to $endDate',
      );
      
      return summaries;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to get daily summaries in range $startDate to $endDate',
        e,
        stackTrace,
      );
      return [];
    }
  }

  /// Get the most recent N daily summaries
  Future<List<DailyLog>> getRecentDailySummaries(int count) async {
    try {
      final dates = await _getDateIndex();
      dates.sort((a, b) => b.compareTo(a)); // Sort newest first
      final recentDates = dates.take(count);
      
      final summaries = <DailyLog>[];
      for (final date in recentDates) {
        final summary = await getDailySummary(date);
        if (summary != null) {
          summaries.add(summary);
        }
      }
      
      return summaries;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to get recent daily summaries (count: $count)',
        e,
        stackTrace,
      );
      return [];
    }
  }

  /// Get all available dates with data
  Future<List<String>> getAvailableDates() async {
    try {
      return await _getDateIndex();
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to get available dates',
        e,
        stackTrace,
      );
      return [];
    }
  }

  /// Delete daily summary for a specific date
  Future<void> deleteDailySummary(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '$_prefixKey$date';
      await prefs.remove(key);
      await _removeFromDateIndex(date);
      
      AppLogger.logSugarTracking('Deleted daily summary for $date');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to delete daily summary for $date',
        e,
        stackTrace,
      );
    }
  }

  /// Clear all historical data
  Future<void> clearAllHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dates = await _getDateIndex();
      
      // Remove all daily summary entries
      for (final date in dates) {
        final key = '$_prefixKey$date';
        await prefs.remove(key);
      }
      
      // Clear the index
      await prefs.remove(_historyIndexKey);
      
      AppLogger.logSugarTracking('Cleared all historical data (${dates.length} entries)');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to clear all historical data',
        e,
        stackTrace,
      );
    }
  }

  /// Get statistics for historical data
  Future<Map<String, dynamic>> getHistoricalStats() async {
    try {
      final dates = await _getDateIndex();
      if (dates.isEmpty) {
        return {
          'totalDays': 0,
          'streakDays': 0,
          'averageSugar': 0.0,
          'bestDay': null,
          'worstDay': null,
        };
      }

      double totalSugar = 0.0;
      int streakDays = 0;
      DailyLog? bestDay;
      DailyLog? worstDay;

      for (final date in dates) {
        final summary = await getDailySummary(date);
        if (summary != null) {
          totalSugar += summary.totalSugar;
          if (summary.streakDay) streakDays++;
          
          if (bestDay == null || summary.progressPercentage < bestDay.progressPercentage) {
            bestDay = summary;
          }
          if (worstDay == null || summary.progressPercentage > worstDay.progressPercentage) {
            worstDay = summary;
          }
        }
      }

      return {
        'totalDays': dates.length,
        'streakDays': streakDays,
        'averageSugar': totalSugar / dates.length,
        'bestDay': bestDay,
        'worstDay': worstDay,
      };
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to calculate historical stats',
        e,
        stackTrace,
      );
      return {
        'totalDays': 0,
        'streakDays': 0,
        'averageSugar': 0.0,
        'bestDay': null,
        'worstDay': null,
      };
    }
  }

  /// Private method to maintain index of available dates
  Future<void> _addToDateIndex(String date) async {
    try {
      final dates = await _getDateIndex();
      if (!dates.contains(date)) {
        dates.add(date);
        await _saveDateIndex(dates);
      }
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to add date $date to index',
        e,
        stackTrace,
      );
    }
  }

  Future<void> _removeFromDateIndex(String date) async {
    try {
      final dates = await _getDateIndex();
      dates.remove(date);
      await _saveDateIndex(dates);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to remove date $date from index',
        e,
        stackTrace,
      );
    }
  }

  Future<List<String>> _getDateIndex() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_historyIndexKey);
      
      if (jsonString == null) return [];
      
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.cast<String>();
    } catch (e) {
      return [];
    }
  }

  Future<void> _saveDateIndex(List<String> dates) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = json.encode(dates);
      await prefs.setString(_historyIndexKey, jsonString);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save date index',
        e,
        stackTrace,
      );
    }
  }
}