import 'package:quit_suggar/features/program/domain/entities/progress_overview.dart';
import 'package:quit_suggar/features/program/domain/repositories/progress_repository.dart';

class ProgressUsecase {
  final ProgressRepository _repository;

  const ProgressUsecase(this._repository);

  Future<ProgressOverview> getProgressOverview() async {
    return await _repository.getProgressOverview();
  }

  Future<List<WeeklyProgress>> getRecentWeeklyProgress() async {
    return await _repository.getWeeklyProgress(weeks: 8);
  }

  Future<void> refreshProgressData() async {
    await _repository.calculateProgressMetrics();
  }

  String getMotivationalMessage(ProgressOverview overview) {
    if (overview.currentStreak >= 30) {
      return 'Amazing! You\'re on a 30+ day streak! 🏆';
    } else if (overview.currentStreak >= 14) {
      return 'Fantastic! Two weeks strong! 🌟';
    } else if (overview.currentStreak >= 7) {
      return 'Great job! One week milestone reached! 📅';
    } else if (overview.currentStreak >= 3) {
      return 'Keep going! You\'re building momentum! 💪';
    } else {
      return 'Every day is a new opportunity! 🌱';
    }
  }

  String getProgressInsight(ProgressOverview overview) {
    final trend = overview.progressTrend;
    
    switch (trend) {
      case 'Improving':
        return 'Your sugar intake is trending downward - excellent work!';
      case 'Needs attention':
        return 'Consider reviewing your food choices to get back on track.';
      case 'Consistent':
        return 'You\'re maintaining steady progress - well done!';
      default:
        return 'Start tracking to see your progress insights.';
    }
  }
}