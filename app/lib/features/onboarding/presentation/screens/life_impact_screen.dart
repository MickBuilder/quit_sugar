import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';

class LifeImpactScreen extends HookConsumerWidget {
  const LifeImpactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImpacts = useState<List<String>>([]);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
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
                    const SizedBox(height: 40),
                    
                    // Title
                    Text(
                      'How does sugar affect\nyour daily life?',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Select all that apply (you can choose multiple)',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Impact options
                    _buildImpactOption(
                      'Energy crashes',
                      'Feel tired and sluggish after eating',
                      CupertinoIcons.battery_25,
                      selectedImpacts,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildImpactOption(
                      'Weight struggles',
                      'Difficulty maintaining healthy weight',
                      CupertinoIcons.chart_bar,
                      selectedImpacts,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildImpactOption(
                      'Mood swings',
                      'Irritable and moody throughout the day',
                      CupertinoIcons.smiley,
                      selectedImpacts,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildImpactOption(
                      'Cravings',
                      'Constant desire for sweet foods',
                      CupertinoIcons.heart_fill,
                      selectedImpacts,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildImpactOption(
                      'Health concerns',
                      'Worried about long-term health effects',
                      CupertinoIcons.heart_circle,
                      selectedImpacts,
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(context, ref, selectedImpacts),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildImpactOption(
    String title,
    String description,
    IconData icon,
    ValueNotifier<List<String>> selectedImpacts,
  ) {
    final isSelected = selectedImpacts.value.contains(title);
    
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          selectedImpacts.value = selectedImpacts.value.where((impact) => impact != title).toList();
        } else {
          selectedImpacts.value = [...selectedImpacts.value, title];
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentOrange.withValues(alpha: 0.1) : AppTheme.surfaceBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppTheme.accentOrange : AppTheme.borderDefault,
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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.accentOrange : AppTheme.primaryBlack,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryWhite,
                size: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isSelected ? AppTheme.accentOrange : AppTheme.textPrimary,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Text(
                    description,
                    style: AppTextStyles.body.copyWith(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            if (isSelected)
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: AppTheme.accentOrange,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<List<String>> selectedImpacts,
  ) {
    final isEnabled = selectedImpacts.value.isNotEmpty;
    
    return GestureDetector(
      onTap: isEnabled ? () {
        // Save life impacts and navigate to next screen
        ref.read(onboardingFlowProvider.notifier).updateLifeImpacts(selectedImpacts.value);
        context.push('/onboarding/analysis-results');
      } : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isEnabled ? AppTheme.primaryBlack : AppTheme.neutralLightGrey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: isEnabled ? [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: 0.7),
              blurRadius: 0,
              offset: const Offset(4, 4),
            ),
          ] : null,
        ),
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isEnabled ? AppTheme.primaryWhite : AppTheme.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
