import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class WeeklySummaryCard extends ConsumerWidget {
  const WeeklySummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();

    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This Week', style: AppTextStyles.heading),
          const SizedBox(height: 16),

          // Current streak
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dailySummary.streak} days',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'current streak',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.flame_fill,
                    color: AppTheme.primaryWhite,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Weekly stats
          Row(
            children: [
              Expanded(child: _buildStatItem('5/7', 'days on track')),
              Container(
                width: 1,
                height: 30,
                color: AppTheme.borderDefault.withValues(alpha: 0.3),
              ),
              Expanded(child: _buildStatItem('18.2g', 'avg daily')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.title.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
