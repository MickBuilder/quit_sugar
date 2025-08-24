import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ProgressGrid extends ConsumerWidget {

  const ProgressGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: AppCardStyles.elevated,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  CupertinoIcons.calendar,
                  color: AppTheme.primaryBlack,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Progress',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 20,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your journey over the past weeks',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Month headers
          _buildMonthHeaders(),
          const SizedBox(height: 12),

          // Day labels
          _buildDayLabels(),
          const SizedBox(height: 8),

          // Progress grid
          _buildProgressGrid(),
          const SizedBox(height: 20),

          // Legend
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildMonthHeaders() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const SizedBox(width: 24), // Space for day labels
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Jan', style: AppTextStyles.caption),
                Text('Feb', style: AppTextStyles.caption),
                Text('Mar', style: AppTextStyles.caption),
                Text('Apr', style: AppTextStyles.caption),
                Text('May', style: AppTextStyles.caption),
                Text('Jun', style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayLabels() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          child: Column(
            children: [
              Text('', style: AppTextStyles.caption), // Mon
              const SizedBox(height: 12),
              Text('Wed', style: AppTextStyles.caption),
              const SizedBox(height: 12),
              Text('', style: AppTextStyles.caption), // Fri
              const SizedBox(height: 12),
              Text('', style: AppTextStyles.caption), // Sun
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(), // Grid will go here
        ),
      ],
    );
  }

  Widget _buildProgressGrid() {
    final today = DateTime.now();
    final startDate = DateTime(today.year, 1, 1); // Start from January 1st
    final weeks = _calculateWeeks(startDate, today);

    return Row(
      children: [
        const SizedBox(width: 32), // Space for day labels
        Expanded(
          child: SizedBox(
            height: 84, // 7 days * 12px
            child: Row(
              children: List.generate(weeks, (weekIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Column(
                    children: List.generate(7, (dayIndex) {
                      final date = startDate.add(
                        Duration(days: weekIndex * 7 + dayIndex),
                      );
                      if (date.isAfter(today)) {
                        return Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.borderSubtle,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }

                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          color: _getColorForDate(date),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        Text('Less', style: AppTextStyles.caption),
        const SizedBox(width: 8),
        _buildLegendSquare(AppTheme.surfaceBackground),
        const SizedBox(width: 2),
        _buildLegendSquare(AppTheme.progressGreen.withValues(alpha: 0.3)),
        const SizedBox(width: 2),
        _buildLegendSquare(AppTheme.progressGreen.withValues(alpha: 0.6)),
        const SizedBox(width: 2),
        _buildLegendSquare(AppTheme.accentOrange.withValues(alpha: 0.8)),
        const SizedBox(width: 2),
        _buildLegendSquare(AppTheme.accentRed),
        const SizedBox(width: 8),
        Text('More', style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildLegendSquare(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Color _getColorForDate(DateTime date) {
    // TODO: Replace with real data from sugar tracking provider
    // For now, using mock data for demonstration
    final mockSugarIntake = _getMockSugarData(date);
    const dailyLimit = 25.0;

    if (mockSugarIntake == 0) {
      return AppTheme.surfaceBackground; // No data
    } else if (mockSugarIntake <= dailyLimit * 0.5) {
      return AppTheme.progressGreen.withValues(alpha: 0.3); // Very good
    } else if (mockSugarIntake <= dailyLimit * 0.7) {
      return AppTheme.progressGreen.withValues(alpha: 0.6); // Good
    } else if (mockSugarIntake <= dailyLimit) {
      return AppTheme.accentBlue.withValues(alpha: 0.8); // Warning
    } else {
      return AppTheme.accentRed; // Over limit
    }
  }

  double _getMockSugarData(DateTime date) {
    // Mock data generation for demonstration
    final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
    final random = (dayOfYear * 137) % 100; // Pseudo-random based on day

    if (random < 10) return 0; // No data some days
    if (random < 30) return 10 + (random % 15); // Good days
    if (random < 60) return 20 + (random % 10); // Moderate days
    if (random < 85) return 25 + (random % 15); // Warning days
    return 35 + (random % 20); // Over limit days
  }

  int _calculateWeeks(DateTime start, DateTime end) {
    final difference = end.difference(start).inDays;
    return (difference / 7).ceil().clamp(1, 53); // Max 53 weeks in a year
  }
}
