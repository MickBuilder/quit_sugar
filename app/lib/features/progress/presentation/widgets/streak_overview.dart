import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class StreakOverview extends ConsumerWidget {
  const StreakOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();

    return Container(
      decoration: AppCardStyles.success,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Main streak display
          Row(
            children: [
              // Streak icon and number
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.progressGreen.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.flame_fill,
                      color: AppTheme.progressGreen,
                      size: 32,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${dailySummary.streak}',
                      style: AppTextStyles.display.copyWith(
                        fontSize: 24,
                        color: AppTheme.progressGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Streak info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dailySummary.streak == 0
                          ? 'Start Your Streak!'
                          : dailySummary.streak == 1
                          ? 'Day Streak'
                          : 'Days Streak',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 20,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getStreakMessage(dailySummary.streak),
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Achievement milestones
          _buildMilestones(dailySummary.streak),
        ],
      ),
    );
  }

  Widget _buildMilestones(int currentStreak) {
    final milestones = [
      {'days': 3, 'title': '3 Days', 'description': 'Building momentum'},
      {'days': 7, 'title': '1 Week', 'description': 'Forming habits'},
      {'days': 14, 'title': '2 Weeks', 'description': 'Real progress'},
      {'days': 30, 'title': '1 Month', 'description': 'Lifestyle change'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievement Milestones',
          style: AppTextStyles.body.copyWith(
            color: AppTheme.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: milestones.map((milestone) {
            final days = milestone['days'] as int;
            final isCompleted = currentStreak >= days;
            final isCurrent =
                currentStreak < days &&
                (milestones.indexOf(milestone) == 0 ||
                    currentStreak >=
                        (milestones[milestones.indexOf(milestone) - 1]['days']
                            as int));

            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppTheme.progressGreen
                            : isCurrent
                            ? AppTheme.primaryBlack.withValues(alpha: 0.3)
                            : AppTheme.borderSubtle,
                        borderRadius: BorderRadius.circular(20),
                        border: isCurrent && !isCompleted
                            ? Border.all(color: AppTheme.primaryBlack, width: 2)
                            : null,
                      ),
                      child: Icon(
                        isCompleted
                            ? CupertinoIcons.checkmark
                            : isCurrent
                            ? CupertinoIcons.clock
                            : CupertinoIcons.circle,
                        color: isCompleted
                            ? AppTheme.textPrimary
                            : isCurrent
                            ? AppTheme.primaryBlack
                            : AppTheme.textMuted,
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      milestone['title'] as String,
                      style: AppTextStyles.caption.copyWith(
                        color: isCompleted
                            ? AppTheme.progressGreen
                            : isCurrent
                            ? AppTheme.primaryBlack
                            : AppTheme.textMuted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      milestone['description'] as String,
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getStreakMessage(int streak) {
    if (streak == 0) {
      return 'Stay under your daily limit to start building a healthy streak';
    } else if (streak == 1) {
      return 'Great start! Keep going to build momentum';
    } else if (streak < 7) {
      return 'You\'re building healthy habits. Keep it up!';
    } else if (streak < 14) {
      return 'Excellent consistency! Your body is adapting';
    } else if (streak < 30) {
      return 'Amazing progress! You\'re creating lasting change';
    } else {
      return 'Incredible dedication! You\'ve transformed your lifestyle';
    }
  }
}
