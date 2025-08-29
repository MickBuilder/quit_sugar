import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/shared/widgets/onboarding_progress_bar.dart';

class AddictionIndicatorsScreen extends HookConsumerWidget {
  const AddictionIndicatorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestionIndex = useState<int>(0);
    final answers = useState<Map<int, int>>({});
    
    final questions = [
      {
        'title': 'How strong are your sugar cravings?',
        'options': [
          'Rarely think about sugar',
          'Occasional sweet tooth',
          'Daily sugar cravings',
          'Intense, hard to resist urges',
          'Can\'t function without sugar',
        ],
        'emoji': '🍭',
      },
      {
        'title': 'How does sugar affect your energy?',
        'options': [
          'Stable energy throughout day',
          'Slight energy dips after eating',
          'Energy crashes after sugar',
          'Severe ups and downs daily',
          'Constant fatigue without sugar',
        ],
        'emoji': '⚡',
      },
      {
        'title': 'How does sugar affect your mood?',
        'options': [
          'No noticeable impact',
          'Slight mood boost temporarily',
          'Mood swings related to sugar',
          'Anxiety when avoiding sugar',
          'Depression without sugar',
        ],
        'emoji': '😊',
      },
      {
        'title': 'What physical symptoms do you experience?',
        'options': [
          'None related to sugar',
          'Occasional weight concerns',
          'Weight gain & skin issues',
          'Multiple health problems',
          'Serious health complications',
        ],
        'emoji': '🏃‍♂️',
      },
      {
        'title': 'Do you eat sugar when stressed?',
        'options': [
          'Never use sugar for comfort',
          'Rarely turn to sweets',
          'Sometimes stress-eat sugar',
          'Often use sugar to cope',
          'Always my go-to for stress',
        ],
        'emoji': '😰',
      },
      {
        'title': 'Have you tried quitting sugar before?',
        'options': [
          'Never tried to quit',
          'Tried once, lasted a few days',
          'Multiple attempts, lasted weeks',
          'Many failed attempts',
          'Previously successful but relapsed',
        ],
        'emoji': '🔄',
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
        trailing: Text(
          '${currentQuestionIndex.value + 1}/${questions.length}',
          style: AppTextStyles.body.copyWith(
            color: AppTheme.textMuted,
            fontSize: 14,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: OnboardingProgressBar(
                current: 6 + currentQuestionIndex.value,
                total: 13,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Question emoji and title
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppTheme.accentOrange,
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
                      'Select the option that best describes your situation',
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
                                  ? AppTheme.accentBlue
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
                                          color: AppTheme.accentBlue,
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
                      // Store answers and navigate to lifestyle quiz
                      _storeAddictionAnswers(ref, answers.value);
                      context.push('/onboarding/lifestyle-motivation');
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
                  isLastQuestion ? 'Continue' : 'Next Question',
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

  void _storeAddictionAnswers(WidgetRef ref, Map<int, int> answers) {
    // Calculate addiction score based on answers (0-4 scale, 6 questions = max 24 points)
    final totalScore = answers.values.fold(0, (sum, answer) => sum + answer);
    
    // Store in onboarding provider
    ref.read(onboardingFlowProvider.notifier).updateAddictionIndicators(
      cravingIntensity: answers[0] ?? 0,
      energyImpact: answers[1] ?? 0,
      moodImpact: answers[2] ?? 0,
      physicalSymptoms: answers[3] ?? 0,
      stressEating: answers[4] ?? 0,
      previousAttempts: answers[5] ?? 0,
      totalScore: totalScore,
    );
  }
}