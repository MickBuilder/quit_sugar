import 'package:flutter/material.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class MotivationalCard extends StatelessWidget {
  final DailySummary summary;

  const MotivationalCard({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    AppLogger.logUI('Building motivational card with status: ${summary.status.name}');
    
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            summary.motivationalMessage,
            style: EmotionalTextStyles.achievement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '${summary.entries.length} items tracked today',
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}