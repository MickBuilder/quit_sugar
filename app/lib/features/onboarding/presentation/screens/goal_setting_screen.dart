import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/onboarding/presentation/widgets/onboarding_progress_indicator.dart';
import 'package:quit_suggar/features/onboarding/presentation/widgets/goal_option_card.dart';
import 'package:quit_suggar/features/onboarding/presentation/widgets/reduction_plan_preview.dart';
import 'package:quit_suggar/features/onboarding/presentation/widgets/onboarding_continue_button.dart';

class GoalSettingScreen extends HookConsumerWidget {
  final double currentDailySugar;

  const GoalSettingScreen({
    super.key,
    required this.currentDailySugar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = useState<SugarReductionGoal?>(null);
    final onboardingData = ref.watch(onboardingFlowProvider);
    final targetDays = onboardingData.targetDays;
    
    // Ensure the provider has the correct currentDailySugar from navigation parameter
    useEffect(() {
      if (onboardingData.currentDailySugar != currentDailySugar) {
        // Update the provider with the correct current daily sugar from navigation
        Future.microtask(() {
          ref.read(onboardingFlowProvider.notifier).updateSugarAssessment(
            sodaDrinks: onboardingData.sugarSources.sodaDrinks,
            sweetSnacks: onboardingData.sugarSources.sweetSnacks,
            desserts: onboardingData.sugarSources.desserts,
            addedSugar: onboardingData.sugarSources.addedSugar,
            juiceDrinks: onboardingData.sugarSources.juiceDrinks,
            currentDailySugar: currentDailySugar,
            commonFoods: onboardingData.sugarSources.commonFoods,
          );
        });
      }
      return null;
    }, [currentDailySugar]);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: Border(bottom: BorderSide.none),
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Progress indicator
                    OnboardingProgressIndicator(current: 4, total: 5),
                    
                    const SizedBox(height: 32),
                    
                    
                    Text(
                      'Based on your current intake of ${currentDailySugar.toStringAsFixed(1)}g per day',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Goal options
                    ...SugarReductionGoal.values.map((goal) => 
                      GoalOptionCard(
                        goal: goal,
                        isSelected: selectedGoal.value == goal,
                        currentDailySugar: currentDailySugar,
                        onTap: () => selectedGoal.value = goal,
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Reduction plan preview
                    if (selectedGoal.value != null) ...[
                      const SizedBox(height: 24),
                      ReductionPlanPreview(
                        currentSugar: currentDailySugar,
                        targetSugar: selectedGoal.value!.targetAmount,
                        days: targetDays,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: OnboardingContinueButton(
                text: 'Start My $targetDays-Day Journey',
                isEnabled: selectedGoal.value != null,
                onPressed: selectedGoal.value != null ? () {
                  ref.read(onboardingFlowProvider.notifier).updateGoalSetting(
                    reductionGoal: selectedGoal.value!,
                    targetDays: targetDays,
                  );
                  context.push('/onboarding/completion');
                } : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}