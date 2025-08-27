import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';

part 'daily_log.freezed.dart';
part 'daily_log.g.dart';

@freezed
abstract class DailyLog with _$DailyLog {
  const factory DailyLog({
    required String date, // Format: YYYY-MM-DD
    required double totalSugar, // Total sugar consumed that day
    required double dailyLimit, // The limit for that specific day
    required double remainingSugar, // How much sugar was remaining
    required double progressPercentage, // Percentage of daily limit used
    required bool limitExceeded, // Whether the daily limit was exceeded
    required bool streakDay, // Whether this day contributed to streak
    required int streakCountAtEndOfDay, // Streak count at end of this day
    required int entryCount, // Number of food entries that day
    required List<String> topFoods, // Top 3 foods consumed (names only for storage efficiency)
    required DateTime timestamp, // When this summary was saved
  }) = _DailyLog;

  const DailyLog._();

  factory DailyLog.fromJson(Map<String, dynamic> json) => 
      _$DailyLogFromJson(json);

  // Helper methods
  String get displayDate {
    final parts = date.split('-');
    if (parts.length == 3) {
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);
      final monthNames = [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${monthNames[month]} $day';
    }
    return date;
  }

  SugarStatus get status {
    return SugarStatusCalculator.fromPercentage(progressPercentage / 100.0);
  }

  String get motivationalMessage {
    if (streakDay) {
      if (progressPercentage <= 70) {
        return "Excellent control! 🌟";
      } else {
        return "Great job staying under limit! 💪";
      }
    } else {
      return "Tomorrow is a new opportunity 🌅";
    }
  }

  // Additional helper methods for UI compatibility
  bool get goalAchieved => !limitExceeded;
  
  int get streakDayNumber => streakDay ? streakCountAtEndOfDay : 0;
  
  String get formattedDate => displayDate;
  
  String get dayName {
    final parts = date.split('-');
    if (parts.length == 3) {
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);
      final dateTime = DateTime(year, month, day);
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[dateTime.weekday - 1];
    }
    return 'Unknown';
  }

  String get statusMessage {
    if (goalAchieved) {
      return 'Goal achieved! 🎉';
    } else if (limitExceeded) {
      return 'Over limit by ${(totalSugar - dailyLimit).toStringAsFixed(1)}g';
    } else {
      return 'Within limit';
    }
  }
}