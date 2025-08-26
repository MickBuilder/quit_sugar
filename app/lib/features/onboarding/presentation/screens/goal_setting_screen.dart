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
import 'package:quit_suggar/features/onboarding/presentation/widgets/program_info_card.dart';

class GoalSettingScreen extends HookConsumerWidget {
  final double currentDailySugar;

  const GoalSettingScreen({
    super.key,
    required this.currentDailySugar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = useState<SugarReductionGoal?>(null);
    const targetDays = 60; // Fixed 60-day program

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            CupertinoIcons.back,
            color: AppTheme.textPrimary,
          ),
        ),
        middle: Text(
          'Set Your Goal',
          style: AppTextStyles.heading,
        ),
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
                    
                    // Title
                    Text(
                      'Choose Your Target',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
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
                    
                    // Reduction plan preview (60-day program)
                    if (selectedGoal.value != null) ...[
                      const ProgramInfoCard(),
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
                text: 'Start My 60-Day Journey',
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