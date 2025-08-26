import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary_history.dart';

part 'daily_summary_history_model.freezed.dart';
part 'daily_summary_history_model.g.dart';

@freezed
abstract class DailySummaryHistoryModel with _$DailySummaryHistoryModel {
  const factory DailySummaryHistoryModel({
    required String date,
    required double totalSugar,
    required double dailyLimit,
    required double remainingSugar,
    required double progressPercentage,
    required bool limitExceeded,
    required bool streakDay,
    required int streakCountAtEndOfDay,
    required int entryCount,
    required List<String> topFoods,
    required String timestamp, // ISO string for JSON serialization
  }) = _DailySummaryHistoryModel;

  const DailySummaryHistoryModel._();

  factory DailySummaryHistoryModel.fromJson(Map<String, dynamic> json) => 
      _$DailySummaryHistoryModelFromJson(json);

  // Convert from domain entity
  factory DailySummaryHistoryModel.fromDomain(DailySummaryHistory summary) {
    return DailySummaryHistoryModel(
      date: summary.date,
      totalSugar: summary.totalSugar,
      dailyLimit: summary.dailyLimit,
      remainingSugar: summary.remainingSugar,
      progressPercentage: summary.progressPercentage,
      limitExceeded: summary.limitExceeded,
      streakDay: summary.streakDay,
      streakCountAtEndOfDay: summary.streakCountAtEndOfDay,
      entryCount: summary.entryCount,
      topFoods: summary.topFoods,
      timestamp: summary.timestamp.toIso8601String(),
    );
  }

  // Convert to domain entity
  DailySummaryHistory toDomain() {
    return DailySummaryHistory(
      date: date,
      totalSugar: totalSugar,
      dailyLimit: dailyLimit,
      remainingSugar: remainingSugar,
      progressPercentage: progressPercentage,
      limitExceeded: limitExceeded,
      streakDay: streakDay,
      streakCountAtEndOfDay: streakCountAtEndOfDay,
      entryCount: entryCount,
      topFoods: topFoods,
      timestamp: DateTime.parse(timestamp),
    );
  }
}