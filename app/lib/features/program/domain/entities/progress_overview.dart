import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_overview.freezed.dart';

@freezed
abstract class ProgressOverview with _$ProgressOverview {
  const factory ProgressOverview({
    required int totalDaysTracked,
    required int currentStreak,
    required int longestStreak,
    required double averageDailySugar,
    required double totalSugarSaved,
    required List<WeeklyProgress> weeklyProgress,
    required Map<String, int> monthlyStats,
  }) = _ProgressOverview;

  const ProgressOverview._();

  double get streakSuccessRate => totalDaysTracked > 0 
      ? (currentStreak / totalDaysTracked * 100).clamp(0, 100) 
      : 0;

  bool get isOnTrack => currentStreak >= 7;

  String get progressTrend {
    if (weeklyProgress.isEmpty) return 'No data';
    
    if (weeklyProgress.length < 2) return 'Building momentum';
    
    final lastWeek = weeklyProgress.last.averageDailySugar;
    final previousWeek = weeklyProgress[weeklyProgress.length - 2].averageDailySugar;
    
    if (lastWeek < previousWeek) return 'Improving';
    if (lastWeek > previousWeek) return 'Needs attention';
    return 'Consistent';
  }
}

@freezed
abstract class WeeklyProgress with _$WeeklyProgress {
  const factory WeeklyProgress({
    required DateTime weekStart,
    required DateTime weekEnd,
    required double averageDailySugar,
    required int successfulDays,
    required int totalDays,
  }) = _WeeklyProgress;

  const WeeklyProgress._();

  double get successRate => totalDays > 0 
      ? (successfulDays / totalDays * 100).clamp(0, 100) 
      : 0;
}