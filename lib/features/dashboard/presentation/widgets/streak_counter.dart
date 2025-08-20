import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class StreakCounter extends StatelessWidget {
  final DailySummary summary;

  const StreakCounter({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: summary.streak > 0 
            ? AppTheme.victoryColor.withValues(alpha: 0.1)
            : AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: summary.streak > 0 
              ? AppTheme.victoryColor.withValues(alpha: 0.3)
              : AppTheme.borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Streak',
                style: EmotionalTextStyles.supportive.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                summary.streak > 0 
                    ? '${summary.streak} day${summary.streak == 1 ? '' : 's'}'
                    : summary.isOverLimit 
                        ? 'Over limit today'
                        : 'Stay under ${summary.dailyLimit.toStringAsFixed(0)}g!',
                style: summary.streak > 0
                    ? EmotionalTextStyles.achievement.copyWith(fontSize: 18)
                    : summary.isOverLimit
                        ? EmotionalTextStyles.warning.copyWith(fontSize: 14)
                        : EmotionalTextStyles.supportive.copyWith(fontSize: 14),
              ),
            ],
          ),
          Icon(
            summary.streak > 0 
                ? CupertinoIcons.flame_fill
                : CupertinoIcons.flame,
            size: 32,
            color: summary.streak > 0 
                ? AppTheme.victoryColor
                : AppTheme.textSecondary,
          ),
        ],
      ),
    );
  }
}