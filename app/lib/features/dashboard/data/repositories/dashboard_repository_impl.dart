import 'package:quit_suggar/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:quit_suggar/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final TrackingRepository _trackingRepository;

  const DashboardRepositoryImpl(this._trackingRepository);

  @override
  Future<DashboardStats> getDashboardStats() async {
    final [
      dailyLimit,
      currentSugar,
      currentStreak,
      entries,
    ] = await Future.wait([
      _trackingRepository.getDailyLimit(),
      _trackingRepository.getCurrentSugarIntake(),
      _trackingRepository.getCurrentStreak(),
      _trackingRepository.getTodayEntries(),
    ]);

    final entriesList = entries as List;
    final totalEntries = entriesList.length;
    final lastEntryTime = entriesList.isNotEmpty 
        ? entriesList.last.timestamp 
        : DateTime.now().subtract(const Duration(days: 1));

    final currentSugarDouble = currentSugar as double;
    final dailyLimitDouble = dailyLimit as double;
    final completionPercentage = dailyLimitDouble > 0 
        ? currentSugarDouble / dailyLimitDouble * 100 
        : 0.0;

    final motivationalMessage = await getMotivationalMessage(completionPercentage);

    return DashboardStats(
      totalSugar: currentSugarDouble,
      dailyLimit: dailyLimitDouble,
      currentStreak: currentStreak as int,
      totalEntries: totalEntries,
      lastEntryTime: lastEntryTime,
      motivationalMessage: motivationalMessage,
    );
  }

  @override
  Future<String> getMotivationalMessage(double completionPercentage) async {
    if (completionPercentage > 100) {
      return 'Tomorrow is a fresh start! 💪';
    } else if (completionPercentage >= 80) {
      return 'Almost there! Stay strong! 🎯';
    } else if (completionPercentage >= 50) {
      return 'You\'re doing great! Keep it up! ⭐';
    } else {
      return 'Excellent progress today! 🌟';
    }
  }

  @override
  Future<void> refreshDashboardData() async {
    // This could trigger data refresh from external sources
    // For now, it's a placeholder as tracking repository handles the data
  }
}