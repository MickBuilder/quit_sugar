import 'package:quit_suggar/features/tracking/data/models/food_entry_model.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/storage/hive_storage_service.dart';

class TrackingStorageService {
  
  /// Load daily limit from storage
  Future<double> loadDailyLimit(double defaultLimit) async {
    try {
      final trackingData = await HiveStorageService.getDailyTracking();
      return trackingData?['daily_limit']?.toDouble() ?? defaultLimit;
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
      final trackingData = await HiveStorageService.getDailyTracking() ?? {};
      trackingData['daily_limit'] = limit;
      await HiveStorageService.saveDailyTracking(trackingData);
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
      final trackingData = await HiveStorageService.getDailyTracking();
      return trackingData?['sugar_intake']?.toDouble() ?? 0.0;
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
      final trackingData = await HiveStorageService.getDailyTracking() ?? {};
      trackingData['sugar_intake'] = intake;
      await HiveStorageService.saveDailyTracking(trackingData);
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
      final entries = await HiveStorageService.getFoodEntries();
      return entries
          .map((entryMap) => FoodEntryModel.fromJson(entryMap).toDomain())
          .toList();
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
      final entriesJson = entries.map((e) => e.toModel().toJson()).toList();
      await HiveStorageService.saveFoodEntries(entriesJson);
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
      final streakData = await HiveStorageService.getStreakData();
      return streakData?['streak']?.toInt() ?? 0;
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
      final streakData = await HiveStorageService.getStreakData() ?? {};
      streakData['streak'] = streak;
      await HiveStorageService.saveStreakData(streakData);
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
      final streakData = await HiveStorageService.getStreakData();
      return streakData?['last_streak_date'];
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
      final streakData = await HiveStorageService.getStreakData() ?? {};
      streakData['last_streak_date'] = date;
      await HiveStorageService.saveStreakData(streakData);
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
      final streakData = await HiveStorageService.getStreakData() ?? {};
      streakData.remove('last_streak_date');
      await HiveStorageService.saveStreakData(streakData);
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
      final trackingData = await HiveStorageService.getDailyTracking();
      return trackingData?['last_date'];
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
      final trackingData = await HiveStorageService.getDailyTracking() ?? {};
      trackingData['last_date'] = date;
      await HiveStorageService.saveDailyTracking(trackingData);
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
      // Save tracking data
      final trackingData = {
        'last_date': date,
        'daily_limit': dailyLimit,
        'sugar_intake': sugarIntake,
      };
      await HiveStorageService.saveDailyTracking(trackingData);

      // Save entries
      final entriesJson = entries.map((e) => e.toModel().toJson()).toList();
      await HiveStorageService.saveFoodEntries(entriesJson);

      // Save streak data
      final streakData = {'streak': streak};
      await HiveStorageService.saveStreakData(streakData);

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
      await Future.wait([
        HiveStorageService.saveDailyTracking({}),
        HiveStorageService.saveFoodEntries([]),
        HiveStorageService.saveStreakData({}),
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
