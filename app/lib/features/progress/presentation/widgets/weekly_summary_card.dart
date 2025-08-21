import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';

class WeeklySummaryCard extends StatelessWidget {
  final SugarTrackingService service;

  const WeeklySummaryCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final dailySummary = service.getDailySummary();
    
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This Week',
            style: EmotionalTextStyles.motivational,
          ),
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
                      style: EmotionalTextStyles.achievement.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'current streak',
                      style: EmotionalTextStyles.supportive,
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
              Expanded(
                child: _buildStatItem('5/7', 'days on track'),
              ),
              Container(
                width: 1,
                height: 30,
                color: AppTheme.borderDefault.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _buildStatItem('18.2g', 'avg daily'),
              ),
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
            style: EmotionalTextStyles.achievement.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
