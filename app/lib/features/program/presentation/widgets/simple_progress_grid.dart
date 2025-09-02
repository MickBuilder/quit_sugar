import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/utils/date_utils.dart';

class SimpleProgressGrid extends ConsumerWidget {
  const SimpleProgressGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Last 7 Days', style: AppTextStyles.heading),
          const SizedBox(height: 16),

          // Simple 7-day grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final dayData = _getDayData(index, ref);
              return Column(
                children: [
                  Text(
                    dayData['day'],
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: dayData['color'],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.borderDefault,
                        width: 1,
                      ),
                    ),
                    child: dayData['isToday']
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryWhite,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dayData['value'],
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 10,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              );
            }),
          ),

          const SizedBox(height: 16),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Good', AppTheme.accentGreen),
              const SizedBox(width: 16),
              _buildLegendItem('Over', AppTheme.accentOrange),
              const SizedBox(width: 16),
              _buildLegendItem('No data', AppTheme.accentYellow),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.caption.copyWith(fontSize: 10)),
      ],
    );
  }

  Map<String, dynamic> _getDayData(int dayIndex, WidgetRef ref) {
    // Get the last 7 days
    final last7Days = DateUtils.getLastNDays(7);
    final today = DateUtils.getCurrentDate();
    
    // Check if this day index corresponds to today
    final isToday = last7Days[dayIndex] == today;
    
    // Get real data for the last 7 days
    final sugarData = _getRealSugarData(ref);
    final sugarValue = dayIndex < sugarData.length ? sugarData[dayIndex] : 0.0;
    
    // Get daily limit from current tracking data
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();
    final dailyLimit = dailySummary.dailyLimit;
    
    // Determine color based on daily limit
    final color = sugarValue == 0
        ? AppTheme.accentYellow
        : sugarValue <= dailyLimit
        ? AppTheme.accentGreen
        : AppTheme.accentOrange;

    return {
      'day': DateUtils.getShortDayName((DateTime.now().weekday + dayIndex - 7) % 7 + 1),
      'color': color,
      'value': sugarValue == 0 ? '-' : '${sugarValue.toInt()}g',
      'isToday': isToday,
    };
  }

  List<double> _getRealSugarData(WidgetRef ref) {
    // Get the last 7 days
    final last7Days = DateUtils.getLastNDays(7);
    
    // Watch historical data for the last 7 days
    final historicalDataAsync = ref.watch(dailySummariesInRangeProvider(
      last7Days.first,
      last7Days.last,
    ));
    
    // Return loading state with zeros for now
    if (historicalDataAsync.isLoading) {
      return List.filled(7, 0.0);
    }
    
    // Return error state with zeros for now
    if (historicalDataAsync.hasError) {
      return List.filled(7, 0.0);
    }
    
    // Get the data
    final historicalData = historicalDataAsync.value ?? [];
    
    // Create a map of date to sugar amount
    final Map<String, double> dateToSugar = {};
    for (final log in historicalData) {
      dateToSugar[log.date] = log.totalSugar;
    }
    
    // Build the list for the last 7 days
    final List<double> data = [];
    for (final date in last7Days) {
      data.add(dateToSugar[date] ?? 0.0);
    }
    
    return data;
  }
}
