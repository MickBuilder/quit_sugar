import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';

part 'daily_log_model.freezed.dart';
part 'daily_log_model.g.dart';

@freezed
abstract class DailyLogModel with _$DailyLogModel {
  const factory DailyLogModel({
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
  }) = _DailyLogModel;

  const DailyLogModel._();

  factory DailyLogModel.fromJson(Map<String, dynamic> json) => 
      _$DailyLogModelFromJson(json);

  // Convert from domain entity
  factory DailyLogModel.fromDomain(DailyLog summary) {
    return DailyLogModel(
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
  DailyLog toDomain() {
    return DailyLog(
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