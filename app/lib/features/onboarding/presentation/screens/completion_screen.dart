import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/subscription/presentation/providers/subscription_provider.dart';

class CompletionScreen extends HookConsumerWidget {
  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingFlowProvider);
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
                      'Your personalized ${onboardingData.targetDays}-day sugar reduction plan is ready',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Plan summary
                    _buildPlanSummary(ref),
                    
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

  Widget _buildPlanSummary(WidgetRef ref) {
    final onboardingData = ref.watch(onboardingFlowProvider);
    
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
                '${onboardingData.currentDailySugar.toStringAsFixed(1)}g',
                'per day',
              ),
              
              Container(
                width: 2,
                height: 40,
                color: AppTheme.progressGreen.withValues(alpha: 0.3),
              ),
              
              _buildSummaryItem(
                'Target',
                '${onboardingData.targetDailySugar.toStringAsFixed(1)}g',
                'in ${onboardingData.targetDays} days',
              ),
              
              Container(
                width: 2,
                height: 40,
                color: AppTheme.progressGreen.withValues(alpha: 0.3),
              ),
              
              _buildSummaryItem(
                'Reduction',
                '${onboardingData.reductionPercentage.toStringAsFixed(0)}%',
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
        
        // Show hard paywall before proceeding
        if (context.mounted) {
          _showHardPaywall(context);
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
            'Continue to Premium',
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

  void _showHardPaywall(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => _HardPaywallModal(
        onPurchaseComplete: () {
          context.go('/dashboard');
        },
      ),
    );
  }
}

class _HardPaywallModal extends HookConsumerWidget {
  final VoidCallback onPurchaseComplete;

  const _HardPaywallModal({
    required this.onPurchaseComplete,
  });

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
                    
                    // Premium icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.accentOrange, AppTheme.accentBlue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
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
                        child: Text('💎', style: TextStyle(fontSize: 48)),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Title
                    Text(
                      'Complete Your\nSugAddict Journey',
                      style: AppTextStyles.display.copyWith(
                        fontSize: 32,
                        color: AppTheme.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Unlock the full SugAddict experience and complete your personalized recovery program',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Premium features
                    _buildPremiumFeatures(),
                    
                    const SizedBox(height: 32),
                    
                    // Success stats
                    _buildSuccessStats(),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            
            // Bottom action section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Subscription plans (will be populated from RevenueCat)
                  _buildSubscriptionPlans(context, ref),
                  
                  const SizedBox(height: 24),
                  
                  // Terms
                  _buildTermsText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumFeatures() {
    final features = [
      {'icon': '📱', 'title': 'Unlimited Scanning', 'desc': 'Scan any product, anytime'},
      {'icon': '🎯', 'title': 'Smart Recommendations', 'desc': 'AI-powered sugar alternatives'},
      {'icon': '📊', 'title': 'Advanced Analytics', 'desc': 'Detailed progress insights'},
      {'icon': '🏆', 'title': 'Achievement System', 'desc': 'Unlock exclusive badges'},
      {'icon': '💪', 'title': 'Addiction Support', 'desc': 'Expert tips & guidance'},
      {'icon': '🔄', 'title': 'Data Export', 'desc': 'Export your journey data'},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What You Get',
            style: AppTextStyles.title.copyWith(
              color: AppTheme.textPrimary,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(feature['icon']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature['title']!,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Text(
                        feature['desc']!,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildSuccessStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.success,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('94%', 'Success Rate'),
          Container(width: 1, height: 40, color: AppTheme.progressGreen.withValues(alpha: 0.3)),
          _buildStatItem('60', 'Days to Freedom'),
          Container(width: 1, height: 40, color: AppTheme.progressGreen.withValues(alpha: 0.3)),
          _buildStatItem('10k+', 'Users Helped'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppTheme.progressGreen,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSubscriptionPlans(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Yearly plan (most popular)
        _buildPlanButton(
          context,
          ref,
          title: '💎 Yearly Premium',
          price: '\$29.99/year',
          savings: 'BEST VALUE - Save 64%',
          isPopular: true,
          packageId: 'annual',
          onTap: () => _handlePurchase(context, ref, 'annual'),
        ),
        const SizedBox(height: 12),
        
        // Monthly plan
        _buildPlanButton(
          context,
          ref,
          title: '💎 Monthly Premium',
          price: '\$6.99/month',
          savings: null,
          isPopular: false,
          packageId: 'monthly',
          onTap: () => _handlePurchase(context, ref, 'monthly'),
        ),
        const SizedBox(height: 12),
        
        // Weekly plan
        _buildPlanButton(
          context,
          ref,
          title: '💎 Weekly Premium',
          price: '\$1.99/week',
          savings: null,
          isPopular: false,
          packageId: 'weekly',
          onTap: () => _handlePurchase(context, ref, 'weekly'),
        ),
      ],
    );
  }

  Widget _buildPlanButton(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String price,
    String? savings,
    required bool isPopular,
    required String packageId,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPopular ? AppTheme.accentOrange : AppTheme.surfaceBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPopular ? AppTheme.accentOrange : AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: [
            if (isPopular)
              BoxShadow(
                color: AppTheme.accentOrange.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          children: [
            if (savings != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.progressGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  savings,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ),
            if (savings != null) const SizedBox(height: 8),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isPopular ? AppTheme.primaryWhite : AppTheme.textPrimary,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isPopular ? AppTheme.primaryWhite : AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTermsText() {
    return Text(
      'Terms & Conditions apply. Cancel anytime.\nPayment will be charged to your account.',
      style: TextStyle(
        fontSize: 12,
        color: AppTheme.textMuted,
      ),
      textAlign: TextAlign.center,
    );
  }

  Future<void> _handlePurchase(BuildContext context, WidgetRef ref, String packageId) async {
    try {
      // Show loading indicator
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CupertinoActivityIndicator(radius: 20),
        ),
      );

      // Attempt purchase through RevenueCat
      final purchased = await ref.read(subscriptionProvider.notifier).showPaywall();

      if (context.mounted) {
        Navigator.of(context).pop(); // Dismiss loading
        
        if (purchased) {
          onPurchaseComplete();
          _showSuccessMessage(context);
        } else {
          _showPurchaseFailedMessage(context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop(); // Dismiss loading
        _showPurchaseErrorMessage(context, e.toString());
      }
    }
  }


  void _showSuccessMessage(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Welcome to Premium! 🎉'),
        content: const Text(
          'You now have full access to all premium features. Your 60-day sugar-free journey starts now!',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Let\'s Go!'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }


  void _showPurchaseFailedMessage(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Purchase Cancelled'),
        content: const Text(
          'You need a premium subscription to continue. The app requires premium access to provide your personalized recovery program.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Try Again'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }


  void _showPurchaseErrorMessage(BuildContext context, String error) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Purchase Error'),
        content: Text(
          'There was an issue processing your purchase: $error\n\nPlease try again or contact support.',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Try Again'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}