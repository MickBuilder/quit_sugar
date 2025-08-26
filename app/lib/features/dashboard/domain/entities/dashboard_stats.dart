import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';

@freezed
abstract class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required double totalSugar,
    required double dailyLimit,
    required int currentStreak,
    required int totalEntries,
    required DateTime lastEntryTime,
    required String motivationalMessage,
  }) = _DashboardStats;

  const DashboardStats._();

  double get completionPercentage => 
      dailyLimit > 0 ? (totalSugar / dailyLimit * 100).clamp(0, 200) : 0;

  bool get isOverLimit => totalSugar > dailyLimit;

  bool get isNearLimit => completionPercentage >= 80 && completionPercentage < 100;

  String get progressStatus {
    if (isOverLimit) return 'Over Limit';
    if (isNearLimit) return 'Near Limit';
    if (completionPercentage >= 50) return 'Moderate';
    return 'Good Progress';
  }
}