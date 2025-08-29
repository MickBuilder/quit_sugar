import 'package:quit_suggar/features/program/domain/entities/progress_overview.dart';
import 'package:quit_suggar/features/program/domain/repositories/progress_repository.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/historical_data_repository.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final TrackingRepository _trackingRepository;
  final HistoricalDataRepository _historicalDataRepository;

  const ProgressRepositoryImpl(
    this._trackingRepository,
    this._historicalDataRepository,
  );

  @override
  Future<ProgressOverview> getProgressOverview() async {
    final [
      currentStreak,
      dailyLimit,
      currentSugar,
    ] = await Future.wait([
      _trackingRepository.getCurrentStreak(),
      _trackingRepository.getDailyLimit(),
      _trackingRepository.getCurrentSugarIntake(),
    ]);

    final currentStreakInt = currentStreak as int;
    final dailyLimitDouble = dailyLimit as double;
    final currentSugarDouble = currentSugar as double;

    // Get real historical data for accurate calculations
    final historicalData = await _getHistoricalDataForCalculations();
    
    // Calculate real metrics using historical data
    final totalDaysTracked = await _calculateTotalDaysTracked(historicalData);
    final longestStreak = await _calculateLongestStreak(historicalData, currentStreakInt);
    final averageDailySugar = await _calculateAverageDailySugar(historicalData, currentSugarDouble);
    final totalSugarSaved = await _calculateTotalSugarSaved(historicalData, dailyLimitDouble, currentSugarDouble);

    return ProgressOverview(
      totalDaysTracked: totalDaysTracked,
      currentStreak: currentStreakInt,
      longestStreak: longestStreak,
      averageDailySugar: averageDailySugar,
      totalSugarSaved: totalSugarSaved,
      weeklyProgress: await getWeeklyProgress(),
      monthlyStats: await getMonthlyStats(),
    );
  }

  @override
  Future<List<WeeklyProgress>> getWeeklyProgress({int weeks = 8}) async {
    final List<WeeklyProgress> weeklyData = [];
    final now = DateTime.now();
    
    // Get historical data for the requested period
    final endDate = now;
    final startDate = now.subtract(Duration(days: weeks * 7));
    final historicalData = await _historicalDataRepository.getDailySummariesInRange(
      startDate: startDate.toIso8601String().split('T')[0],
      endDate: endDate.toIso8601String().split('T')[0],
    );
    
    for (int i = weeks - 1; i >= 0; i--) {
      final weekStart = now.subtract(Duration(days: (i * 7) + now.weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 6));
      
      // Get real data for this week from historical data
      final weekData = _getDataForWeek(historicalData, weekStart, weekEnd);
      
      weeklyData.add(WeeklyProgress(
        weekStart: weekStart,
        weekEnd: weekEnd,
        averageDailySugar: weekData['averageSugar']!,
        successfulDays: weekData['successfulDays']!.toInt(),
        totalDays: 7,
      ));
    }
    
    return weeklyData;
  }

  @override
  Future<Map<String, int>> getMonthlyStats() async {
    final now = DateTime.now();
    
    // Get historical data for the last 4 months
    final endDate = now;
    final startDate = DateTime(now.year, now.month - 3, 1);
    final historicalData = await _historicalDataRepository.getDailySummariesInRange(
      startDate: startDate.toIso8601String().split('T')[0],
      endDate: endDate.toIso8601String().split('T')[0],
    );
    
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    final Map<String, int> stats = {};
    
    // Show last 4 months including current
    for (int i = 3; i >= 0; i--) {
      final month = DateTime(now.year, now.month - i, 1);
      final monthName = monthNames[month.month - 1];
      
      // Get real data for this month from historical data
      final monthData = _getDataForMonth(historicalData, month);
      stats[monthName] = monthData;
    }
    
    return stats;
  }

  @override
  Future<double> getTotalSugarSaved() async {
    final dailyLimit = await _trackingRepository.getDailyLimit();
    final currentSugar = await _trackingRepository.getCurrentSugarIntake();
    final historicalData = await _getHistoricalDataForCalculations();
    
    return await _calculateTotalSugarSaved(historicalData, dailyLimit, currentSugar);
  }

  @override
  Future<void> calculateProgressMetrics() async {
    // This would recalculate all progress metrics
    // For now, it's a placeholder
  }

  // Helper method to get historical data for calculations
  Future<List<DailyLog>> _getHistoricalDataForCalculations() async {
    try {
      // Get data for the last 90 days to ensure we have enough history
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(days: 90));
      
      return await _historicalDataRepository.getDailySummariesInRange(
        startDate: startDate.toIso8601String().split('T')[0],
        endDate: endDate.toIso8601String().split('T')[0],
      );
    } catch (e) {
      // Return empty list if historical data is not available
      return [];
    }
  }

  // Private calculation methods
  Future<int> _calculateTotalDaysTracked(List<DailyLog> historicalData) async {
    // Count all days that have been tracked (have entries)
    return historicalData.length;
  }

  Future<int> _calculateLongestStreak(List<DailyLog> historicalData, int currentStreak) async {
    if (historicalData.isEmpty) return currentStreak;
    
    // Calculate the longest streak from historical data
    int longestStreak = 0;
    int currentRunningStreak = 0;
    
    // Sort by date to process chronologically
    final sortedData = List<DailyLog>.from(historicalData)
      ..sort((a, b) => a.date.compareTo(b.date));
    
    for (final log in sortedData) {
      if (log.streakDay) {
        currentRunningStreak++;
        longestStreak = currentRunningStreak > longestStreak ? currentRunningStreak : longestStreak;
      } else {
        currentRunningStreak = 0;
      }
    }
    
    // Return the maximum of historical longest streak and current streak
    return longestStreak > currentStreak ? longestStreak : currentStreak;
  }

  Future<double> _calculateAverageDailySugar(List<DailyLog> historicalData, double currentSugar) async {
    if (historicalData.isEmpty) return currentSugar;
    
    // Calculate average from historical data
    final totalSugar = historicalData.fold<double>(0.0, (sum, log) => sum + log.totalSugar);
    
    // Include today's sugar in the calculation if we have historical data
    return (totalSugar + currentSugar) / (historicalData.length + 1);
  }

  Future<double> _calculateTotalSugarSaved(List<DailyLog> historicalData, double dailyLimit, double currentSugar) async {
    // Calculate sugar saved today
    final todaySaved = (dailyLimit - currentSugar).clamp(0.0, dailyLimit);
    
    // Calculate total sugar saved from historical data
    double totalSaved = 0.0;
    for (final log in historicalData) {
      final daySaved = (log.dailyLimit - log.totalSugar).clamp(0.0, log.dailyLimit);
      totalSaved += daySaved;
    }
    
    // Add today's savings
    return totalSaved + todaySaved;
  }

  // Helper method to get data for a specific week
  Map<String, double> _getDataForWeek(List<DailyLog> historicalData, DateTime weekStart, DateTime weekEnd) {
    // Filter data for the specific week
    final weekData = historicalData.where((log) {
      final logDate = DateTime.parse(log.date);
      return logDate.isAfter(weekStart.subtract(const Duration(days: 1))) && 
             logDate.isBefore(weekEnd.add(const Duration(days: 1)));
    }).toList();
    
    if (weekData.isEmpty) {
      return {
        'averageSugar': 0.0,
        'successfulDays': 0.0,
      };
    }
    
    // Calculate average sugar for the week
    final totalSugar = weekData.fold<double>(0.0, (sum, log) => sum + log.totalSugar);
    final averageSugar = totalSugar / weekData.length;
    
    // Count successful days (days under limit)
    final successfulDays = weekData.where((log) => !log.limitExceeded).length.toDouble();
    
    return {
      'averageSugar': averageSugar,
      'successfulDays': successfulDays,
    };
  }

  // Helper method to get data for a specific month
  int _getDataForMonth(List<DailyLog> historicalData, DateTime month) {
    // Filter data for the specific month
    final monthData = historicalData.where((log) {
      final logDate = DateTime.parse(log.date);
      return logDate.year == month.year && logDate.month == month.month;
    }).toList();
    
    // Count successful days (days under limit) for the month
    return monthData.where((log) => !log.limitExceeded).length;
  }
}