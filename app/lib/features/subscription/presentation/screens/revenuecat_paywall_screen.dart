import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class RevenueCatPaywallScreen extends ConsumerWidget {
  final String? source;

  const RevenueCatPaywallScreen({super.key, this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Column(
          children: [
            // Header with close button and restore
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Restore',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => _restorePurchases(context, ref),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: AppTheme.textMuted,
                      size: 24,
                    ),
                    onPressed: () {
                      AppLogger.logUserAction('RevenueCat paywall closed', {
                        'source': source,
                      });
                      context.pop(false);
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Logo
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.2),
                              blurRadius: 0,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/icon/app-icon.png',
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Main title
                      Text(
                        'Break your sugar addiction and transform your life in 30 days.',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textPrimary,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Subtitle
                      Text(
                        'Get full access to Quit Sugar including unlimited product scanning, personalized meal plans, daily habit tracking + much more!',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16,
                          color: AppTheme.textMuted,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // App screenshot mockups placeholder
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.neutralLightGrey,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.2),
                              blurRadius: 0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.device_phone_portrait,
                              size: 48,
                              color: AppTheme.textMuted,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'App Preview Screenshots',
                              style: AppTextStyles.body.copyWith(
                                color: AppTheme.textMuted,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Sugar tracking • Meal plans • Progress charts',
                              style: AppTextStyles.caption.copyWith(
                                color: AppTheme.textMuted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Pricing cards
                      Row(
                        children: [
                          // Monthly option
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceBackground,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppTheme.primaryBlack,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlack.withValues(alpha: 0.1),
                                    blurRadius: 0,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'MONTHLY',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '€9.99',
                                    style: AppTextStyles.title.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    '€/mo',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Basic plan',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 12,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          const SizedBox(width: 16),
                          
                          // Yearly option (highlighted)
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppTheme.accentOrange,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppTheme.primaryBlack,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlack.withValues(alpha: 0.3),
                                    blurRadius: 0,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryBlack,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'SAVE 70%',
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryWhite,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'YEARLY',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.primaryWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '€35.99',
                                    style: AppTextStyles.title.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryWhite,
                                    ),
                                  ),
                                  Text(
                                    '€/yr',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14,
                                      color: AppTheme.primaryWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Just €2.99 per month!',
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.primaryWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // CTA Button
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlack,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
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
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(8),
                          child: Text(
                            'Start My Sugar-Free Journey',
                            style: AppTextStyles.heading.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primaryWhite,
                            ),
                          ),
                          onPressed: () => _showRevenueCatPaywall(context, ref),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Money back guarantee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.shield_fill,
                            size: 16,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '30-Day Money-Back Guarantee',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 14,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Terms and privacy
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terms of Use',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Text(
                            'Privacy Policy',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRevenueCatPaywall(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final purchased = await ref.read(subscriptionProvider.notifier).showPaywall();

      if (purchased && context.mounted) {
        context.go('/dashboard');

        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Welcome to Premium!'),
            content: const Text(
              'You now have unlimited access to all features. Thank you for supporting your sugar-free journey!',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Continue'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Purchase Error'),
            content: const Text(
              'There was an issue processing your purchase. Please try again.',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _restorePurchases(BuildContext context, WidgetRef ref) async {
    try {
      final restored = await ref.read(subscriptionProvider.notifier).restorePurchases();

      if (context.mounted) {
        if (restored) {
          context.go('/dashboard');

          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Purchases Restored'),
              content: const Text(
                'Your premium subscription has been restored.',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Continue'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        } else {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('No Purchases Found'),
              content: const Text(
                'No previous purchases were found to restore.',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Restore Error'),
            content: const Text(
              'There was an issue restoring your purchases. Please try again.',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }
}