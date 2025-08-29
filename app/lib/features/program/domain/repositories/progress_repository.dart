import 'package:quit_suggar/features/program/domain/entities/progress_overview.dart';

abstract class ProgressRepository {
  Future<ProgressOverview> getProgressOverview();
  Future<List<WeeklyProgress>> getWeeklyProgress({int weeks = 8});
  Future<Map<String, int>> getMonthlyStats();
  Future<double> getTotalSugarSaved();
  Future<void> calculateProgressMetrics();
}