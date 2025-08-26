import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';

part 'daily_summary_history.freezed.dart';
part 'daily_summary_history.g.dart';

@freezed
abstract class DailySummaryHistory with _$DailySummaryHistory {
  const factory DailySummaryHistory({
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
  }) = _DailySummaryHistory;

  const DailySummaryHistory._();

  factory DailySummaryHistory.fromJson(Map<String, dynamic> json) => 
      _$DailySummaryHistoryFromJson(json);

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
    if (limitExceeded) {
      return SugarStatus.overLimit;
    } else if (progressPercentage >= 90) {
      return SugarStatus.red;
    } else if (progressPercentage >= 70) {
      return SugarStatus.yellow;
    } else {
      return SugarStatus.green;
    }
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
}

