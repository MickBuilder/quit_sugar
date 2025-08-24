import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/features/tracking/data/models/food_entry_model.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class TrackingStorageService {
  static const String _prefsKeyDailyLimit = 'daily_limit';
  static const String _prefsKeySugarIntake = 'current_sugar_intake';
  static const String _prefsKeyEntries = 'today_entries';
  static const String _prefsKeyLastDate = 'last_date';
  static const String _prefsKeyStreak = 'daily_streak';
  static const String _prefsKeyLastStreakDate = 'last_streak_date';

  /// Load daily limit from storage
  Future<double> loadDailyLimit(double defaultLimit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(_prefsKeyDailyLimit) ?? defaultLimit;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load daily limit from storage',
        e,
        stackTrace,
      );
      return defaultLimit;
    }
  }

  /// Save daily limit to storage
  Future<void> saveDailyLimit(double limit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_prefsKeyDailyLimit, limit);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save daily limit to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load current sugar intake from storage
  Future<double> loadSugarIntake() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(_prefsKeySugarIntake) ?? 0.0;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load sugar intake from storage',
        e,
        stackTrace,
      );
      return 0.0;
    }
  }

  /// Save current sugar intake to storage
  Future<void> saveSugarIntake(double intake) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_prefsKeySugarIntake, intake);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save sugar intake to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load today's entries from storage
  Future<List<FoodEntry>> loadTodayEntries() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final entriesJson = prefs.getString(_prefsKeyEntries);

      if (entriesJson != null) {
        final entriesList = json.decode(entriesJson) as List;
        return entriesList
            .map((entryMap) => FoodEntryModel.fromJson(entryMap).toDomain())
            .toList();
      }

      return [];
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load entries from storage',
        e,
        stackTrace,
      );
      return [];
    }
  }

  /// Save today's entries to storage
  Future<void> saveTodayEntries(List<FoodEntry> entries) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final entriesJson = json.encode(
        entries.map((e) => e.toModel().toJson()).toList(),
      );
      await prefs.setString(_prefsKeyEntries, entriesJson);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save entries to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load current streak from storage
  Future<int> loadStreak() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_prefsKeyStreak) ?? 0;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load streak from storage',
        e,
        stackTrace,
      );
      return 0;
    }
  }

  /// Save streak to storage
  Future<void> saveStreak(int streak) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_prefsKeyStreak, streak);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save streak to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load last streak evaluation date
  Future<String?> loadLastStreakDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_prefsKeyLastStreakDate);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load last streak date from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save last streak evaluation date
  Future<void> saveLastStreakDate(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKeyLastStreakDate, date);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save last streak date to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Remove last streak date (when streak is reset)
  Future<void> removeLastStreakDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_prefsKeyLastStreakDate);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to remove last streak date from storage',
        e,
        stackTrace,
      );
    }
  }

  /// Load last tracking date
  Future<String?> loadLastDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_prefsKeyLastDate);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to load last date from storage',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Save last tracking date
  Future<void> saveLastDate(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKeyLastDate, date);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save last date to storage',
        e,
        stackTrace,
      );
    }
  }

  /// Save all tracking data in batch
  Future<void> saveAllTrackingData({
    required String date,
    required double dailyLimit,
    required double sugarIntake,
    required List<FoodEntry> entries,
    required int streak,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await Future.wait([
        prefs.setString(_prefsKeyLastDate, date),
        prefs.setDouble(_prefsKeyDailyLimit, dailyLimit),
        prefs.setDouble(_prefsKeySugarIntake, sugarIntake),
        prefs.setString(
          _prefsKeyEntries,
          json.encode(entries.map((e) => e.toModel().toJson()).toList()),
        ),
        prefs.setInt(_prefsKeyStreak, streak),
      ]);

      AppLogger.logState(
        'Saved tracking data: ${sugarIntake.toStringAsFixed(1)}g sugar, ${entries.length} entries',
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to save tracking data in batch',
        e,
        stackTrace,
      );
    }
  }

  /// Clear all tracking data (for reset/testing)
  Future<void> clearAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await Future.wait([
        prefs.remove(_prefsKeyDailyLimit),
        prefs.remove(_prefsKeySugarIntake),
        prefs.remove(_prefsKeyEntries),
        prefs.remove(_prefsKeyLastDate),
        prefs.remove(_prefsKeyStreak),
        prefs.remove(_prefsKeyLastStreakDate),
      ]);

      AppLogger.logState('Cleared all tracking data from storage');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to clear tracking data',
        e,
        stackTrace,
      );
    }
  }
}
