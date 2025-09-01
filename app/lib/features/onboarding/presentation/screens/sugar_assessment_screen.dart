import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/shared/widgets/onboarding_progress_bar.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class SugarAssessmentScreen extends AppScreen {
  const SugarAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sodaPerWeek = useState<int>(0);
    final sweetSnacksPerWeek = useState<int>(0);
    final dessertsPerWeek = useState<int>(0);
    final addedSugarTeaspoons = useState<int>(0);
    final juicePerWeek = useState<int>(0);

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
                    // Progress indicator
                    OnboardingProgressBar(
                      current: 2,
                      total: 7,
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Title
                    Text(
                      'Current Sugar Habits',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      'Help us understand your current sugar consumption patterns',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Sugar sources assessment
                    _buildSugarSourceItem(
                      '🥤 Soda & Soft Drinks',
                      'How many per week?',
                      sodaPerWeek,
                      '~39g sugar per can',
                    ),
                    
                    const SizedBox(height: 24),
                    
                    _buildSugarSourceItem(
                      '🍪 Sweet Snacks & Cookies',
                      'How many servings per week?',
                      sweetSnacksPerWeek,
                      '~15g sugar per serving',
                    ),
                    
                    const SizedBox(height: 24),
                    
                    _buildSugarSourceItem(
                      '🍰 Desserts & Cakes',
                      'How many servings per week?',
                      dessertsPerWeek,
                      '~25g sugar per serving',
                    ),
                    
                    const SizedBox(height: 24),
                    
                    _buildSugarSourceItem(
                      '🥄 Added Sugar (tea, coffee, etc.)',
                      'Teaspoons per day?',
                      addedSugarTeaspoons,
                      '4g sugar per teaspoon',
                    ),
                    
                    const SizedBox(height: 24),
                    
                    _buildSugarSourceItem(
                      '🧃 Fruit Juices & Smoothies',
                      'How many per week?',
                      juicePerWeek,
                      '~20g sugar per glass',
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Daily estimate
                    _buildDailyEstimate(
                      sodaPerWeek.value,
                      sweetSnacksPerWeek.value,
                      dessertsPerWeek.value,
                      addedSugarTeaspoons.value,
                      juicePerWeek.value,
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(
                context,
                ref,
                sodaPerWeek.value,
                sweetSnacksPerWeek.value,
                dessertsPerWeek.value,
                addedSugarTeaspoons.value,
                juicePerWeek.value,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSugarSourceItem(
    String title,
    String question,
    ValueNotifier<int> value,
    String sugarInfo,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            question,
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          
          const SizedBox(height: 4),
          
          Text(
            sugarInfo,
            style: AppTextStyles.caption.copyWith(
              color: AppTheme.accentOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Counter widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCounterButton(
                CupertinoIcons.minus,
                () {
                  if (value.value > 0) {
                    value.value--;
                  }
                },
              ),
              
              const SizedBox(width: 24),
              
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.surfaceBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppTheme.borderDefault,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${value.value}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 24),
              
              _buildCounterButton(
                CupertinoIcons.plus,
                () {
                  if (value.value < 50) { // Reasonable max limit
                    value.value++;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppTheme.primaryBlack,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: 0.3),
              blurRadius: 0,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: AppTheme.primaryWhite,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildDailyEstimate(
    int soda,
    int sweetSnacks,
    int desserts,
    int addedSugar,
    int juice,
  ) {
    // Calculate estimated daily sugar intake
    final dailySugar = _calculateDailySugar(soda, sweetSnacks, desserts, addedSugar, juice);
    
    Color statusColor;
    String statusText;
    
    if (dailySugar <= 25) {
      statusColor = AppTheme.progressGreen;
      statusText = 'Within WHO recommendation';
    } else if (dailySugar <= 50) {
      statusColor = AppTheme.progressYellow;
      statusText = 'Above recommended limit';
    } else {
      statusColor = AppTheme.progressRed;
      statusText = 'Significantly above limit';
    }
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: statusColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Estimated Daily Sugar Intake',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                dailySugar.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: statusColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'grams per day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            statusText,
            style: AppTextStyles.body.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'WHO recommends max 25g per day',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }

  double _calculateDailySugar(int soda, int sweetSnacks, int desserts, int addedSugar, int juice) {
    // Convert weekly to daily and calculate total
    final daily = (soda * 39.0 + sweetSnacks * 15.0 + desserts * 25.0 + juice * 20.0) / 7.0;
    final dailyAdded = addedSugar * 4.0; // 4g per teaspoon
    return daily + dailyAdded;
  }

  Widget _buildContinueButton(
    BuildContext context,
    WidgetRef ref,
    int soda,
    int sweetSnacks,
    int desserts,
    int addedSugar,
    int juice,
  ) {
    final dailySugar = _calculateDailySugar(soda, sweetSnacks, desserts, addedSugar, juice);
    
    return GestureDetector(
      onTap: () {
        // Store assessment data and navigate to health questionnaire
        ref.read(onboardingFlowProvider.notifier).updateSugarAssessment(
          sodaDrinks: soda,
          sweetSnacks: sweetSnacks,
          desserts: desserts,
          addedSugar: addedSugar,
          juiceDrinks: juice,
          currentDailySugar: dailySugar,
        );
        context.push('/onboarding/addiction-indicators');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.primaryBlack,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: 0.7),
              blurRadius: 0,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}