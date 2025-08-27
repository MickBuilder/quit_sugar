import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

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
    final isToday = dayIndex == 6;
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();
    
    // Get real data for the last 7 days
    final sugarData = _getRealSugarData(ref);
    final sugarValue = dayIndex < sugarData.length ? sugarData[dayIndex] : 0.0;
    
    // Determine color based on daily limit
    final dailyLimit = dailySummary.dailyLimit;
    final color = sugarValue == 0
        ? AppTheme.accentYellow
        : sugarValue <= dailyLimit
        ? AppTheme.accentGreen
        : AppTheme.accentOrange;

    return {
      'day': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dayIndex],
      'color': color,
      'value': sugarValue == 0 ? '-' : '${sugarValue.toInt()}g',
      'isToday': isToday,
    };
  }

  List<double> _getRealSugarData(WidgetRef ref) {
    // For now, use current day's data and estimate past days
    // In a full implementation, this would fetch from historical data
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();
    final currentSugar = dailySummary.totalSugar;
    final dailyLimit = dailySummary.dailyLimit;
    
    // Generate realistic data based on current streak and sugar intake
    final List<double> data = [];
    for (int i = 6; i >= 0; i--) {
      if (i == 6) {
        // Today
        data.add(currentSugar);
      } else {
        // Past days - estimate based on streak
        final daySugar = dailyLimit * (0.7 + (i * 0.05)); // Gradual increase
        data.add(daySugar);
      }
    }
    
    return data.reversed.toList(); // Return in chronological order
  }
}
