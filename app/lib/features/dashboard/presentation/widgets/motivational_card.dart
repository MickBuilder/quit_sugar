import 'package:flutter/material.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class MotivationalCard extends StatelessWidget {
  final DailySummary summary;

  const MotivationalCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    AppLogger.logUI(
      'Building motivational card with status: ${summary.status.name}',
    );

    return Container(
      decoration: CardStyles.support,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
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
                  Icons.psychology_rounded,
                  color: AppTheme.supportColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  summary.motivationalMessage,
                  style: EmotionalTextStyles.achievement.copyWith(
                    fontSize: 18,
                    color: AppTheme.textPrimary,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.elevatedSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.borderSubtle, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.track_changes_rounded,
                  color: AppTheme.textTertiary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  '${summary.entries.length} items tracked today',
                  style: EmotionalTextStyles.subtitle.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
