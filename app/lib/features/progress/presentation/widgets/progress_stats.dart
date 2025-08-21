import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ProgressStats extends StatelessWidget {
  final SugarTrackingService service;

  const ProgressStats({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weekly Overview
        Container(
          decoration: CardStyles.primary,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryTeal.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      CupertinoIcons.chart_bar,
                      color: AppTheme.secondaryTeal,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Weekly Overview',
                    style: EmotionalTextStyles.achievement.copyWith(
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
                      AppTheme.progressColor,
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
                      AppTheme.supportColor,
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
          decoration: CardStyles.support,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.supportColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      CupertinoIcons.lightbulb,
                      color: AppTheme.supportColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Monthly Insights',
                    style: EmotionalTextStyles.achievement.copyWith(
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
                AppTheme.progressColor,
              ),
              const SizedBox(height: 12),
              _buildInsightItem(
                'Afternoon snacks tend to be your biggest challenge',
                CupertinoIcons.clock,
                AppTheme.cautionColor,
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
                  style: EmotionalTextStyles.caption.copyWith(
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
            style: EmotionalTextStyles.progress.copyWith(
              fontSize: 20,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: EmotionalTextStyles.caption.copyWith(
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
            style: EmotionalTextStyles.supportive.copyWith(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
