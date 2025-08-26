import 'package:quit_suggar/features/dashboard/domain/entities/dashboard_stats.dart';

abstract class DashboardRepository {
  Future<DashboardStats> getDashboardStats();
  Future<String> getMotivationalMessage(double completionPercentage);
  Future<void> refreshDashboardData();
}