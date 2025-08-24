import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';

class DailyProgressCard extends StatelessWidget {
  final DailySummary summary;

  const DailyProgressCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final percentage = (summary.totalSugar / summary.dailyLimit) * 100;

    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Daily Progress', style: AppTextStyles.heading),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${summary.totalSugar.toStringAsFixed(1)}g',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'of ${summary.dailyLimit.toStringAsFixed(0)}g daily limit',
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
                  child: Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: AppTextStyles.heading.copyWith(
                      color: AppTheme.primaryWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
