import 'package:quit_suggar/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:quit_suggar/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardUsecase {
  final DashboardRepository _repository;

  const DashboardUsecase(this._repository);

  Future<DashboardStats> getDashboardStats() async {
    return await _repository.getDashboardStats();
  }

  Future<void> refreshDashboard() async {
    await _repository.refreshDashboardData();
  }

  String getProgressMessage(DashboardStats stats) {
    if (stats.isOverLimit) {
      return 'You\'ve exceeded your daily sugar limit. Consider some sugar-free alternatives for the rest of the day.';
    }
    
    if (stats.isNearLimit) {
      return 'You\'re close to your daily limit. Choose your next foods carefully!';
    }
    
    if (stats.completionPercentage >= 50) {
      return 'You\'re halfway through your daily limit. Keep making mindful choices!';
    }
    
    return 'Great start! You\'re well within your daily sugar limit.';
  }
}