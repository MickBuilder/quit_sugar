import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';

class CompletionScreen extends HookConsumerWidget {
  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    
                    // Success animation/icon
                    Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.progressGreen,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: AppTheme.borderDefault,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlack.withValues(alpha: 0.3),
                      blurRadius: 0,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.check_mark,
                    size: 48,
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Completion title
              Text(
                'You\'re All Set!',
                style: AppTextStyles.display.copyWith(
                  fontSize: 32,
                  color: AppTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
                    // Success message
                    Text(
                      'Your personalized 60-day sugar reduction plan is ready',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Plan summary
                    _buildPlanSummary(),
                    
                    const SizedBox(height: 32),
                    
                    // Quick tips
                    _buildQuickTips(),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            
            // Fixed bottom section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Start tracking button
                  _buildStartButton(context, ref),
                  
                  const SizedBox(height: 16),
                  
                  // Setup notifications option
                  _buildNotificationSetup(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanSummary() {
    // Mock data - replace with actual onboarding data
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.success,
      child: Column(
        children: [
          Text(
            'Your Plan Summary',
            style: AppTextStyles.title.copyWith(
              color: AppTheme.progressGreen,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem(
                'Current',
                '45.2g',
                'per day',
              ),
              
              Container(
                width: 2,
                height: 40,
                color: AppTheme.progressGreen.withValues(alpha: 0.3),
              ),
              
              _buildSummaryItem(
                'Target',
                '25.0g',
                'in 60 days',
              ),
              
              Container(
                width: 2,
                height: 40,
                color: AppTheme.progressGreen.withValues(alpha: 0.3),
              ),
              
              _buildSummaryItem(
                'Reduction',
                '45%',
                'total',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppTheme.progressGreen,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickTips() {
    final tips = [
      '📱 Log everything - even small treats add up',
      '🔍 Scan product barcodes for instant sugar info',
      '🏆 Build your daily streak by staying under limit',
      '📊 Check progress screen to see your improvement',
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Tips to Get Started',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          
          const SizedBox(height: 16),
          
          ...tips.map((tip) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              tip,
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        // Save onboarding data and mark as complete
        await ref.read(onboardingFlowProvider.notifier).saveOnboardingData();
        
        // Navigate to dashboard
        if (context.mounted) {
          context.go('/dashboard');
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.accentOrange,
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
            'Start Tracking Today!',
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

  Widget _buildNotificationSetup(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Request notification permissions
        _requestNotificationPermissions(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.bell,
              size: 16,
              color: AppTheme.accentBlue,
            ),
            const SizedBox(width: 8),
            Text(
              'Enable reminders to stay on track',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentBlue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _requestNotificationPermissions(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Stay on Track'),
        content: const Text(
          'Get reminders when you\'re approaching your daily sugar limit and encouragement to maintain your streak.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Not Now'),
            onPressed: () => context.pop(),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Enable'),
            onPressed: () {
              // TODO: Request actual notification permissions
              context.pop();
              _showNotificationSuccess(context);
            },
          ),
        ],
      ),
    );
  }

  void _showNotificationSuccess(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Perfect!'),
        content: const Text(
          'You\'ll get helpful reminders at 50%, 75%, and 90% of your daily sugar limit.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Got it'),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}