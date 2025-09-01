import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/shared/widgets/onboarding_progress_bar.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class LifestyleMotivationScreen extends AppScreen {
  const LifestyleMotivationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestionIndex = useState<int>(0);
    final answers = useState<Map<int, int>>({});
    
    final questions = [
      {
        'title': 'How is your sleep quality?',
        'options': [
          'Excellent, 7-8 hours consistently',
          'Good, occasional disruptions',
          'Fair, some restless nights',
          'Poor, frequent wake-ups',
          'Terrible, insomnia or oversleeping',
        ],
        'emoji': '😴',
      },
      {
        'title': 'What\'s your primary motivation for quitting sugar?',
        'options': [
          'Weight loss goals',
          'Better health & prevent disease',
          'More stable energy levels',
          'Improved mental clarity',
          'Break the addiction cycle',
        ],
        'emoji': '🎯',
      },
      {
        'title': 'How does your social environment affect sugar consumption?',
        'options': [
          'Very supportive environment',
          'Mostly neutral environment',
          'Some social pressure to consume',
          'High pressure (work/family events)',
          'Surrounded by sugar constantly',
        ],
        'emoji': '👥',
      },
      {
        'title': 'How would you describe your stress levels?',
        'options': [
          'Very low stress, good coping',
          'Manageable stress levels',
          'Moderate stress, some challenges',
          'High stress, difficult to manage',
          'Overwhelming stress daily',
        ],
        'emoji': '😤',
      },
    ];

    final currentQuestion = questions[currentQuestionIndex.value];

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: currentQuestionIndex.value > 0
            ? GestureDetector(
                onTap: () {
                  currentQuestionIndex.value--;
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    CupertinoIcons.chevron_left,
                    color: AppTheme.textPrimary,
                    size: 20,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    CupertinoIcons.chevron_left,
                    color: AppTheme.textPrimary,
                    size: 20,
                  ),
                ),
              ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: OnboardingProgressBar(
                current: 1 + currentQuestionIndex.value,
                total: 4,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question emoji and title
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppTheme.accentGreen,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.8),
                              blurRadius: 0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            currentQuestion['emoji'] as String,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text(
                      currentQuestion['title'] as String,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'This helps us personalize your recovery plan',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // Answer options
                    ...(currentQuestion['options'] as List<String>)
                        .asMap()
                        .entries
                        .map((entry) {
                      final index = entry.key;
                      final option = entry.value;
                      final isSelected = answers.value[currentQuestionIndex.value] == index;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            final newAnswers = Map<int, int>.from(answers.value);
                            newAnswers[currentQuestionIndex.value] = index;
                            answers.value = newAnswers;
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.accentGreen
                                  : AppTheme.surfaceBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.primaryBlack,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryBlack.withValues(alpha: 0.8),
                                  blurRadius: 0,
                                  offset: const Offset(3, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppTheme.primaryWhite
                                        : AppTheme.background,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppTheme.primaryWhite
                                          : AppTheme.primaryBlack,
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          CupertinoIcons.check_mark,
                                          size: 14,
                                          color: AppTheme.accentGreen,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: AppTextStyles.body.copyWith(
                                      color: isSelected
                                          ? AppTheme.primaryWhite
                                          : AppTheme.textPrimary,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24),
              child: _buildNavigationButtons(
                context,
                ref,
                currentQuestionIndex,
                answers,
                questions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildNavigationButtons(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<int> currentQuestionIndex,
    ValueNotifier<Map<int, int>> answers,
    int totalQuestions,
  ) {
    final canContinue = answers.value.containsKey(currentQuestionIndex.value);
    final isLastQuestion = currentQuestionIndex.value == totalQuestions - 1;

    return Row(
      children: [
        // Continue/Next button
        Expanded(
          child: GestureDetector(
            onTap: canContinue
                ? () {
                    if (isLastQuestion) {
                      // Store answers and navigate to analysis results
                      _storeLifestyleAnswers(ref, answers.value);
                      context.push('/onboarding/analysis-results');
                    } else {
                      currentQuestionIndex.value++;
                    }
                  }
                : null,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: canContinue ? AppTheme.primaryBlack : AppTheme.neutralLightGrey,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.primaryBlack,
                  width: 2,
                ),
                boxShadow: canContinue
                    ? [
                        BoxShadow(
                          color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                          blurRadius: 0,
                          offset: const Offset(4, 4),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  isLastQuestion ? 'Analyze My Profile' : 'Next Question',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: canContinue ? AppTheme.primaryWhite : AppTheme.textMuted,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _storeLifestyleAnswers(WidgetRef ref, Map<int, int> answers) {
    // Store lifestyle and motivation answers
    final analysisResults = Map<String, dynamic>.from(
      ref.read(onboardingFlowProvider).analysisResults
    );
    
    analysisResults.addAll({
      'sleepQuality': answers[0] ?? 0,
      'primaryMotivation': answers[1] ?? 0,
      'socialEnvironment': answers[2] ?? 0,
      'stressLevels': answers[3] ?? 0,
    });
    
    ref.read(onboardingFlowProvider.notifier).updateLifestyleFactors(
      sleepQuality: answers[0] ?? 0,
      primaryMotivation: answers[1] ?? 0,
      socialEnvironment: answers[2] ?? 0,
      stressLevels: answers[3] ?? 0,
    );
  }
}