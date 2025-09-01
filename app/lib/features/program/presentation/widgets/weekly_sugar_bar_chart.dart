import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/domain/usecases/sugar_tracking_usecase.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';

class WeeklySugarBarChart extends HookConsumerWidget {
  const WeeklySugarBarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get current daily summary for today's data
    final currentSummaryAsync = ref.watch(sugarTrackingProvider);
    
    return currentSummaryAsync.when(
      data: (currentSummary) {
        // Get historical data for the current week
        final historicalDataAsync = _getWeeklyData(ref);
        
        return historicalDataAsync.when(
          data: (historicalData) {
            // Combine historical data with today's current data
            final combinedData = _combineDataWithToday(historicalData, currentSummary);
            
            return Container(
              padding: const EdgeInsets.all(20.0),
              decoration: AppCardStyles.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Weekly Sugar Consumption',
                    style: AppTextStyles.title,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Stats for the week
                  _buildWeeklyStats(combinedData, ref),
                  
                  const SizedBox(height: 24),
                  
                  // Bar Chart with proper margins
                  Container(
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: _buildBarChart(combinedData, ref),
                  ),
                  
                  // Day labels
                  _buildDayLabels(),
                ],
              ),
            );
          },
          loading: () => _buildLoadingContainer(),
          error: (error, _) => _buildErrorContainer(),
        );
      },
      loading: () => _buildLoadingContainer(),
      error: (error, _) => _buildErrorContainer(),
    );
  }

  Widget _buildLoadingContainer() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20.0),
      decoration: AppCardStyles.primary,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading your progress...',
              style: TextStyle(color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContainer() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20.0),
      decoration: AppCardStyles.primary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.exclamationmark_triangle,
              color: AppTheme.accentOrange,
              size: 32,
            ),
            const SizedBox(height: 16),
            Text(
              'Unable to load progress data',
              style: AppTextStyles.body.copyWith(color: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyStats(List<DailyLog> data, WidgetRef ref) {
    final stats = _getStatsFromData(data, ref);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          'Average',
          '${(stats['average'] ?? 0.0).toStringAsFixed(1)}g',
          AppTheme.textPrimary,
        ),
        _buildStatItem(
          'Best Day',
          '${(stats['best'] ?? 0.0).toStringAsFixed(1)}g',
          AppTheme.progressGreen,
        ),
        _buildStatItem(
          'Daily Limit',
          '${(stats['limit'] ?? 25.0).toStringAsFixed(0)}g',
          AppTheme.accentOrange,
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildBarChart(List<DailyLog> data, WidgetRef ref) {
    final barGroups = _getBarGroups(data, ref);
    final stats = _getStatsFromData(data, ref);
    final dailyLimit = stats['limit'] ?? 25.0;
    
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: (dailyLimit * 1.5).clamp(15.0, 100.0), // 50% above limit for better visibility
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.toStringAsFixed(1)}g',
                const TextStyle(
                  color: AppTheme.primaryWhite,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    '${value.toInt()}g',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: barGroups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: dailyLimit / 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppTheme.borderDefault.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildDayLabels() {
    final labels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: labels.map((label) => Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: AppTheme.textMuted,
          ),
        )).toList(),
      ),
    );
  }

  // Helper method to get weekly data
  AsyncValue<List<DailyLog>> _getWeeklyData(WidgetRef ref) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final startDate = _formatDate(weekStart);
    final endDate = _formatDate(now);
    
    return ref.watch(dailySummariesInRangeProvider(startDate, endDate));
  }

  // Combine historical data with today's current data
  List<DailyLog> _combineDataWithToday(List<DailyLog> historicalData, SugarTrackingUsecase currentSummary) {
    final today = _formatDate(DateTime.now());
    
    // Check if today's data already exists in historical data
    final todayExists = historicalData.any((log) => log.date == today);
    
    if (todayExists) {
      return historicalData;
    }
    
    // Get today's summary from the usecase
    final todaySummary = currentSummary.getDailySummary();
    
    // Create today's log entry from current summary
    final todayLog = DailyLog(
      date: today,
      totalSugar: todaySummary.totalSugar,
      dailyLimit: todaySummary.dailyLimit,
      remainingSugar: todaySummary.remainingSugar,
      progressPercentage: todaySummary.progressPercentage * 100,
      limitExceeded: todaySummary.isOverLimit,
      streakDay: todaySummary.streak > 0,
      streakCountAtEndOfDay: todaySummary.streak,
      entryCount: todaySummary.entries.length,
      topFoods: todaySummary.entries.take(3).map((e) => e.product.name).toList(),
      timestamp: DateTime.now(),
    );
    
    // Add today's data to historical data
    final combinedData = List<DailyLog>.from(historicalData);
    combinedData.add(todayLog);
    
    // Sort by date
    combinedData.sort((a, b) => a.date.compareTo(b.date));
    
    return combinedData;
  }
  
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Get statistics from data
  Map<String, double> _getStatsFromData(List<DailyLog> data, WidgetRef ref) {
    if (data.isEmpty) {
      final sugarTrackingAsync = ref.read(sugarTrackingProvider);
      final currentLimit = sugarTrackingAsync.when(
        data: (tracking) => tracking.dailyLimit,
        loading: () => 25.0,
        error: (_, __) => 25.0,
      );
      
      return {
        'average': 0.0,
        'best': 0.0,
        'limit': currentLimit,
      };
    }

    final totalSugar = data.map((d) => d.totalSugar).fold(0.0, (a, b) => a + b);
    final average = totalSugar / data.length;
    final best = data.map((d) => d.totalSugar).reduce((a, b) => a < b ? a : b);
    final limit = data.first.dailyLimit;

    return {
      'average': average,
      'best': best,
      'limit': limit,
    };
  }

  // Convert data to bar groups for fl_chart
  List<BarChartGroupData> _getBarGroups(List<DailyLog> data, WidgetRef ref) {
    final stats = _getStatsFromData(data, ref);
    final dailyLimit = stats['limit'] ?? 25.0;
    
    // Create data points for each day of the week (Monday to Sunday)
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1)); // Monday
    final weekData = <double>[];
    
    for (int i = 0; i < 7; i++) {
      final targetDate = weekStart.add(Duration(days: i));
      final targetDateString = _formatDate(targetDate);
      
      final dayData = data.where((d) => d.date == targetDateString).firstOrNull;
      weekData.add(dayData?.totalSugar ?? 0.0);
    }
    
    return weekData.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;
      
      // Determine bar color based on value vs limit
      Color barColor;
      if (value == 0) {
        barColor = AppTheme.textMuted.withValues(alpha: 0.3);
      } else if (value <= dailyLimit * 0.7) {
        barColor = AppTheme.progressGreen;
      } else if (value <= dailyLimit) {
        barColor = AppTheme.accentOrange;
      } else {
        barColor = AppTheme.accentRed;
      }
      
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: barColor,
            width: 20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }
}
