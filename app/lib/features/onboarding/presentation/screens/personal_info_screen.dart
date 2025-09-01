import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/shared/widgets/onboarding_progress_bar.dart';

class PersonalInfoScreen extends HookConsumerWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final ageController = useTextEditingController();

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
            // Fixed header with progress
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress indicator
                  OnboardingProgressBar(
                    current: 1,
                    total: 8,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Title
                  Text(
                    'Let\'s get to know you',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    'This helps us create a personalized plan for you',
                    style: AppTextStyles.body.copyWith(
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    
                    // Name input
                    _buildInputSection(
                      'What\'s your name?',
                      'Enter your first name',
                      nameController,
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Age input
                    _buildInputSection(
                      'How old are you?',
                      'Enter your age',
                      ageController,
                      keyboardType: TextInputType.number,
                    ),
                    
                    const SizedBox(height: 40), // Extra space before button
                  ],
                ),
              ),
            ),
            
            // Fixed continue button at bottom
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(
                context,
                ref,
                nameController,
                ageController,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildInputSection(
    String title,
    String placeholder,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 12),
        
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppTheme.borderDefault,
              width: 2,
            ),
          ),
          child: CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            keyboardType: keyboardType,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(),
            style: AppTextStyles.body,
            placeholderStyle: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildContinueButton(
    BuildContext context,
    WidgetRef ref,
    TextEditingController nameController,
    TextEditingController ageController,
  ) {
    return GestureDetector(
      onTap: () {
        // Validate inputs
        if (nameController.text.trim().isEmpty) {
          _showAlert(context, 'Please enter your name');
          return;
        }
        
        if (ageController.text.trim().isEmpty) {
          _showAlert(context, 'Please enter your age');
          return;
        }
        
        final age = int.tryParse(ageController.text);
        if (age == null || age < 13 || age > 120) {
          _showAlert(context, 'Please enter a valid age (13-120)');
          return;
        }
        
        // Store data and navigate to next step
        ref.read(onboardingFlowProvider.notifier).updatePersonalInfo(
          name: nameController.text.trim(),
          age: age,
          gender: 'not_specified', // Default value since gender is no longer collected
        );
        context.push('/onboarding/sugar-assessment');
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

  void _showAlert(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Required Field'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}