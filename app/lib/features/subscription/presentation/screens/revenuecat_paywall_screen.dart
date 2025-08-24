import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/subscription_provider.dart';

import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class RevenueCatPaywallScreen extends ConsumerWidget {
  final String? source;

  const RevenueCatPaywallScreen({super.key, this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            AppLogger.logUserAction('RevenueCat paywall closed', {
              'source': source,
            });
            Navigator.of(context).pop(false);
          },
        ),
        middle: Text(
          'Go Premium',
          style: AppTextStyles.heading.copyWith(fontSize: 18),
        ),
      ),
      child: SafeArea(
        child: Container(
          color: AppTheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header
              Container(
                width: 80,
                height: 80,
                decoration: AppCardStyles.primary,
                child: Icon(
                  CupertinoIcons.heart_fill,
                  size: 40,
                  color: AppTheme.accentOrange,
                ),
              ),

              const SizedBox(height: 24),

              Text(
                _getTitle(),
                style: AppTextStyles.heading.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                _getSubtitle(),
                style: AppTextStyles.body.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Show RevenueCat Paywall Button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: AppCardStyles.button,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.star_fill,
                          color: AppTheme.primaryWhite,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'View Premium Options',
                          style: AppTextStyles.heading.copyWith(
                            color: AppTheme.primaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => _showRevenueCatPaywall(context, ref),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Features list
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: AppCardStyles.primary,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Features',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem('Unlimited product scans'),
                    _buildFeatureItem('Advanced gamification'),
                    _buildFeatureItem('Weekly target automation'),
                    _buildFeatureItem('Data export & reports'),
                    _buildFeatureItem('Priority customer support'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Restore purchases button
              CupertinoButton(
                child: Text(
                  'Restore Purchases',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => _restorePurchases(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: AppTheme.accentOrange,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            feature,
            style: AppTextStyles.body.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (source) {
      case 'scan_limit':
        return 'Unlimited Scans';
      case 'dashboard':
        return 'Go Premium';
      default:
        return 'Break Your Sugar Habit';
    }
  }

  String _getSubtitle() {
    switch (source) {
      case 'scan_limit':
        return 'You\'ve reached your daily limit.\nUpgrade for unlimited scanning.';
      case 'dashboard':
        return 'Unlock all features and track\nunlimited products.';
      default:
        return 'Track unlimited products with\nadvanced gamification features.';
    }
  }

  Future<void> _showRevenueCatPaywall(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      // Show RevenueCat's native paywall
      final purchased = await ref.read(subscriptionProvider.notifier).showPaywall();

      if (purchased && context.mounted) {
        // Success - close this screen and return success
        Navigator.of(context).pop(true);

        // Show success message
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Welcome to Premium!'),
            content: const Text(
              'You now have unlimited access to all features. Thank you for supporting your health journey!',
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
          // Success - close this screen
          Navigator.of(context).pop(true);

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
