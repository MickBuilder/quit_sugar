import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';

part 'daily_log.freezed.dart';

@freezed
abstract class DailyLog with _$DailyLog {
  const factory DailyLog({
    required DateTime date,
    required double totalSugar,
    required double dailyLimit,
    required List<FoodEntry> entries,
    required SugarStatus status,
    required bool goalAchieved,
    required int streakDayNumber, // 0 if streak was broken that day
  }) = _DailyLog;

  const DailyLog._();

  double get progressPercentage => dailyLimit > 0 ? (totalSugar / dailyLimit).clamp(0.0, 2.0) : 0.0;
  
  double get remainingSugar => (dailyLimit - totalSugar).clamp(0.0, double.infinity);
  
  bool get isOverLimit => totalSugar > dailyLimit;
  
  String get formattedDate => '${date.day}/${date.month}/${date.year}';
  
  String get dayName {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }

  String get statusMessage {
    if (goalAchieved) {
      return 'Goal achieved! 🎉';
    } else if (isOverLimit) {
      return 'Over limit by ${(totalSugar - dailyLimit).toStringAsFixed(1)}g';
    } else {
      return 'Within limit';
    }
  }
}