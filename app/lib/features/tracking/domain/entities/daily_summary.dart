import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';

part 'daily_summary.freezed.dart';
part 'daily_summary.g.dart';

@freezed
abstract class DailySummary with _$DailySummary {
  const factory DailySummary({
    required double totalSugar,
    required double dailyLimit,
    required double remainingSugar,
    required double progressPercentage,
    required SugarStatus status,
    required List<FoodEntry> entries,
    required String motivationalMessage,
    required int streak,
  }) = _DailySummary;

  const DailySummary._();

  factory DailySummary.fromJson(Map<String, dynamic> json) => 
      _$DailySummaryFromJson(json);

  bool get isUnderLimit => totalSugar <= dailyLimit;
  bool get isOverLimit => totalSugar > dailyLimit;
  bool get isCloseToLimit => progressPercentage > 0.8;
}
