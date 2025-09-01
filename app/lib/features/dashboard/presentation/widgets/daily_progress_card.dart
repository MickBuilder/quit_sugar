import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';

class DailyProgressCard extends HookConsumerWidget {
  final DailySummary summary;

  const DailyProgressCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingBudget = summary.remainingSugar;
    final budgetPercentage = remainingBudget / summary.dailyLimit;
    
    // Get onboarding data to show program progress
    final onboardingDataAsync = ref.watch(onboardingDataProvider);

    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sugar Budget', style: AppTextStyles.heading),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${remainingBudget.toStringAsFixed(1)}g',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _getBudgetColor(budgetPercentage),
                      ),
                    ),
                    Text(
                      remainingBudget > 0 
                          ? 'remaining of ${summary.dailyLimit.toStringAsFixed(0)}g budget'
                          : 'budget exceeded by ${(-remainingBudget).toStringAsFixed(1)}g',
                      style: AppTextStyles.body.copyWith(
                        color: remainingBudget > 0 ? null : AppTheme.accentRed,
                      ),
                    ),
                    // Show dynamic limit indicator
                    onboardingDataAsync.when(
                      data: (data) => _buildDynamicLimitIndicator(data),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _buildSugarCup(budgetPercentage),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSugarCup(double budgetPercentage) {
    final cupFillLevel = budgetPercentage.clamp(0.0, 1.0);
    final isOverBudget = budgetPercentage < 0;
    
    return SizedBox(
      width: 80, // Increased to accommodate handle
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cup outline
          Container(
            width: 50,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: isOverBudget ? AppTheme.accentRed : AppTheme.primaryBlack,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                // Empty space at top
                Expanded(
                  flex: (100 - (cupFillLevel * 100)).round(),
                  child: const SizedBox(),
                ),
                // Sugar fill
                if (cupFillLevel > 0)
                  Expanded(
                    flex: (cupFillLevel * 100).round(),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _getSugarFillColor(budgetPercentage),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Cup handle
          Positioned(
            right: 5,
            child: Container(
              width: 15,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isOverBudget ? AppTheme.accentRed : AppTheme.primaryBlack,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // Overflow indicator
          if (isOverBudget)
            Positioned(
              top: -8,
              child: Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: AppTheme.accentRed,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  Color _getBudgetColor(double budgetPercentage) {
    if (budgetPercentage < 0) return AppTheme.accentRed;
    if (budgetPercentage < 0.3) return AppTheme.accentOrange;
    if (budgetPercentage < 0.7) return AppTheme.textSecondary;
    return AppTheme.accentGreen;
  }

  Color _getSugarFillColor(double budgetPercentage) {
    if (budgetPercentage < 0) return AppTheme.accentRed;
    if (budgetPercentage < 0.3) return AppTheme.accentOrange;
    return AppTheme.primaryBlack.withValues(alpha: 0.6);
  }

  Widget _buildDynamicLimitIndicator(OnboardingData? data) {
    if (data == null) return const SizedBox.shrink();
    
    // Since we don't have startDate anymore, we'll show a simplified progress indicator
    return Text(
      'Target: ${data.targetDailySugar.toStringAsFixed(0)}g in ${data.targetDays} days',
      style: AppTextStyles.caption.copyWith(
        color: AppTheme.textMuted,
        fontSize: 12,
      ),
    );
  }
}
