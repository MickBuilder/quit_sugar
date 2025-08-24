import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/subscription_provider.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_info.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/subscription/presentation/screens/revenuecat_paywall_screen.dart';

class SubscriptionStatusCard extends ConsumerWidget {
  const SubscriptionStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptionAsync = ref.watch(subscriptionProvider);

    return subscriptionAsync.when(
      data: (subscription) {
        final info = subscription.getSubscriptionInfo();
        return _buildSubscriptionCard(context, ref, info);
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }

  Widget _buildSubscriptionCard(
    BuildContext context,
    WidgetRef ref,
    SubscriptionInfo info,
  ) {
    // Don't show card if user is premium (no need to promote)
    if (info.status == SubscriptionStatus.premium) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => _showPaywall(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryBlack.withValues(alpha: 0.08),
              AppTheme.accentGreen.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryBlack.withValues(alpha: 0.25),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlack.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                CupertinoIcons.star_fill,
                color: AppTheme.primaryBlack,
                size: 20,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getTitle(info),
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _getSubtitle(info),
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              CupertinoIcons.chevron_right,
              color: AppTheme.primaryBlack,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  String _getTitle(SubscriptionInfo info) {
    switch (info.status) {
      case SubscriptionStatus.free:
        if (info.remainingScans == 0) {
          return 'Upgrade for Unlimited Scans';
        } else {
          return 'Try Premium Free for 7 Days';
        }
      case SubscriptionStatus.trial:
        return 'Trial ends in ${info.trialDaysRemaining} days';
      case SubscriptionStatus.premium:
        return 'Premium Active';
    }
  }

  String _getSubtitle(SubscriptionInfo info) {
    switch (info.status) {
      case SubscriptionStatus.free:
        if (info.remainingScans == 0) {
          return 'You\'ve used all daily scans. Get unlimited access.';
        } else {
          return 'Unlimited scans + advanced features. Cancel anytime.';
        }
      case SubscriptionStatus.trial:
        return 'Continue with unlimited access to all features';
      case SubscriptionStatus.premium:
        return 'Thank you for supporting your health journey!';
    }
  }

  void _showPaywall(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) =>
            const RevenueCatPaywallScreen(source: 'dashboard'),
      ),
    );
  }
}
