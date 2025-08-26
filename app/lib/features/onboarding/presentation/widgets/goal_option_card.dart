import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';

class GoalOptionCard extends StatelessWidget {
  final SugarReductionGoal goal;
  final bool isSelected;
  final double currentDailySugar;
  final VoidCallback onTap;

  const GoalOptionCard({
    super.key,
    required this.goal,
    required this.isSelected,
    required this.currentDailySugar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final reductionPercent = ((currentDailySugar - goal.targetAmount) / currentDailySugar * 100).clamp(0, 100);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.accentOrange.withValues(alpha: 0.1)
                : AppTheme.surfaceBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? AppTheme.accentOrange
                  : AppTheme.borderDefault,
              width: 2,
            ),
            boxShadow: isSelected ? [
              BoxShadow(
                color: AppTheme.accentOrange.withValues(alpha: 0.3),
                blurRadius: 0,
                offset: const Offset(3, 3),
              ),
            ] : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    goal.title,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: isSelected ? AppTheme.accentOrange : AppTheme.textPrimary,
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.accentOrange : AppTheme.progressGreen,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${goal.targetAmount.toStringAsFixed(0)}g/day',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryWhite,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              Text(
                goal.description,
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_down,
                    size: 16,
                    color: AppTheme.progressGreen,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${reductionPercent.toStringAsFixed(0)}% reduction',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.progressGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}