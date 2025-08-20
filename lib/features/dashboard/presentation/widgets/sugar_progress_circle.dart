import 'package:flutter/material.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class SugarProgressCircle extends StatelessWidget {
  final DailySummary summary;

  const SugarProgressCircle({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = summary.progressPercentage;
    
    AppLogger.logUI('Building sugar progress with ${summary.totalSugar.toStringAsFixed(1)}g/${summary.dailyLimit.toStringAsFixed(0)}g (${(percentage * 100).toStringAsFixed(0)}%) - Status: ${summary.status.name}');
    
    // Determine emotional state based on sugar intake
    late Color progressColor;
    late String motivationalText;
    late String subtitleText;
    
    switch (summary.status) {
      case SugarStatus.green:
        progressColor = AppTheme.victoryColor;
        motivationalText = 'Great job!';
        subtitleText = 'You\'re under your limit';
        break;
      case SugarStatus.yellow:
        progressColor = AppTheme.cravingColor;
        motivationalText = 'Be careful!';
        subtitleText = 'You\'re close to your limit';
        break;
      case SugarStatus.red:
        progressColor = AppTheme.warningRed;
        motivationalText = 'Stay strong!';
        subtitleText = 'You\'re very close to your limit';
        break;
      case SugarStatus.overLimit:
        progressColor = AppTheme.relapseColor;
        motivationalText = 'Tomorrow is a new day!';
        subtitleText = 'You\'ve exceeded your limit';
        break;
    }
    
    return Container(
      decoration: CardStyles.progress,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            motivationalText,
            style: EmotionalTextStyles.achievement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 12,
                  backgroundColor: AppTheme.cardBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${summary.totalSugar.toStringAsFixed(0)}g',
                        style: EmotionalTextStyles.progress,
                      ),
                      Text(
                        'of ${summary.dailyLimit.toStringAsFixed(0)}g',
                        style: EmotionalTextStyles.supportive,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitleText,
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
          if (summary.remainingSugar > 0) ...[
            const SizedBox(height: 8),
            Text(
              '${summary.remainingSugar.toStringAsFixed(0)}g remaining',
              style: EmotionalTextStyles.supportive.copyWith(
                color: AppTheme.victoryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}