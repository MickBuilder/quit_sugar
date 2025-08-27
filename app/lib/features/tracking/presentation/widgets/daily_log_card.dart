import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';

class DailyLogCard extends StatelessWidget {
  final DailyLog log;

  const DailyLogCard({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: _getCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date and status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log.formattedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    log.dayName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              ),
              
              // Status indicator
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppTheme.borderDefault,
                    width: 1,
                  ),
                ),
                child: Text(
                  _getStatusText(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Sugar consumption progress
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${log.totalSugar.toStringAsFixed(1)}g',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        Text(
                          'of ${log.dailyLimit.toStringAsFixed(0)}g',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Progress bar
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppTheme.neutralLightGrey,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppTheme.borderDefault,
                          width: 1,
                        ),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: (log.progressPercentage).clamp(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _getStatusColor(),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Streak indicator
              if (log.streakDayNumber > 0)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.progressGreen,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppTheme.borderDefault,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${log.streakDayNumber}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primaryWhite,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Status message
          Text(
            log.statusMessage,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _getStatusColor(),
            ),
          ),
          
          // Entries count
          if (log.entryCount > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${log.entryCount} food entries',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textMuted,
                ),
              ),
            ),
        ],
      ),
    );
  }

  BoxDecoration _getCardDecoration() {
    if (log.goalAchieved) {
      return AppCardStyles.success;
    } else if (log.limitExceeded) {
      return AppCardStyles.error;
    } else {
      return AppCardStyles.warning;
    }
  }

  Color _getStatusColor() {
    switch (log.status) {
      case SugarStatus.green:
        return AppTheme.progressGreen;
      case SugarStatus.yellow:
        return AppTheme.progressYellow;
      case SugarStatus.red:
        return AppTheme.progressRed;
      case SugarStatus.overLimit:
        return AppTheme.errorRed;
    }
  }

  String _getStatusText() {
    if (log.goalAchieved) {
      return 'SUCCESS';
    } else if (log.limitExceeded) {
      return 'OVER LIMIT';
    } else {
      return 'PARTIAL';
    }
  }
}