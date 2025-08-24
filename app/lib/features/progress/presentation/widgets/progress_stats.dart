import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ProgressStats extends StatelessWidget {

  const ProgressStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weekly Overview
        Container(
          decoration: AppCardStyles.primary,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGreen.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      CupertinoIcons.chart_bar,
                      color: AppTheme.accentGreen,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Weekly Overview',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 18,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Stats Grid
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Avg Daily',
                      '18.2g',
                      'Below limit',
                      AppTheme.progressGreen,
                      CupertinoIcons.heart_fill,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Best Day',
                      '8.5g',
                      'Excellent!',
                      AppTheme.accentGreen,
                      CupertinoIcons.star_fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Success Rate',
                      '73%',
                      'Great progress',
                      AppTheme.primaryBlack,
                      CupertinoIcons.checkmark_seal_fill,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'This Week',
                      '5/7 days',
                      'Under limit',
                      AppTheme.accentYellow,
                      CupertinoIcons.calendar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Monthly Insights
        Container(
          decoration: AppCardStyles.success,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.accentYellow.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      CupertinoIcons.lightbulb,
                      color: AppTheme.accentYellow,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Monthly Insights',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 18,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Insights
              _buildInsightItem(
                'Your most successful days are Mondays and Tuesdays',
                CupertinoIcons.calendar,
                AppTheme.progressGreen,
              ),
              const SizedBox(height: 12),
              _buildInsightItem(
                'Afternoon snacks tend to be your biggest challenge',
                CupertinoIcons.clock,
                AppTheme.accentOrange,
              ),
              const SizedBox(height: 12),
              _buildInsightItem(
                'You\'ve improved by 35% compared to last month',
                CupertinoIcons.arrow_up_circle,
                AppTheme.accentGreen,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.25), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.caption.copyWith(
                    color: AppTheme.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.display.copyWith(
              fontSize: 20,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTextStyles.caption.copyWith(
              color: color.withValues(alpha: 0.8),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String text, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
