import 'package:flutter/material.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class SugarProgressCircle extends StatelessWidget {
  final DailySummary summary;

  const SugarProgressCircle({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final double percentage = summary.progressPercentage;

    AppLogger.logUI(
      'Building sugar progress with ${summary.totalSugar.toStringAsFixed(1)}g/${summary.dailyLimit.toStringAsFixed(0)}g (${(percentage * 100).toStringAsFixed(0)}%) - Status: ${summary.status.name}',
    );

    // Determine emotional state based on sugar intake
    late Color progressColor;
    late String motivationalText;
    late String subtitleText;

    switch (summary.status) {
      case SugarStatus.green:
        progressColor = AppTheme.progressGreen;
        motivationalText = 'Excellent progress!';
        subtitleText = 'You\'re doing great today';
        break;
      case SugarStatus.yellow:
        progressColor = AppTheme.accentOrange;
        motivationalText = 'Stay mindful';
        subtitleText = 'You\'re approaching your limit';
        break;
      case SugarStatus.red:
        progressColor = AppTheme.warningAmber;
        motivationalText = 'You\'ve got this!';
        subtitleText = 'Consider healthier choices';
        break;
      case SugarStatus.overLimit:
        progressColor = AppTheme.accentRed;
        motivationalText = 'Fresh start tomorrow!';
        subtitleText = 'Every step forward counts';
        break;
    }

    return Container(
      decoration: AppCardStyles.elevated,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      child: Column(
        children: [
          Text(
            motivationalText,
            style: AppTextStyles.title.copyWith(
              color: progressColor,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            width: 180,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 8,
                  backgroundColor: AppTheme.surfaceBackground.withValues(
                    alpha: 0.6,
                  ),
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  strokeCap: StrokeCap.round,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${summary.totalSugar.toStringAsFixed(0)}g',
                        style: AppTextStyles.display.copyWith(
                          fontSize: 32,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'of ${summary.dailyLimit.toStringAsFixed(0)}g',
                        style: AppTextStyles.subtitle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitleText,
            style: AppTextStyles.body.copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          if (summary.remainingSugar > 0) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.progressGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.progressGreen.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                '${summary.remainingSugar.toStringAsFixed(0)}g remaining today',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.progressGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
