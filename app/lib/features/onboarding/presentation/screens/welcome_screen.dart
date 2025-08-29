import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              const SizedBox(height: 40),
              
              // SugAddict app logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.primaryWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.primaryBlack,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlack.withValues(alpha: 0.8),
                      blurRadius: 0,
                      offset: const Offset(6, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    'assets/icon/app-icon.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Main title with proper SugAddict branding
              Text(
                'Welcome to\nSugAddict',
                style: AppTextStyles.display.copyWith(
                  fontSize: 32,
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Compelling subtitle focused on sugar addiction recovery
              Text(
                'Break Free from Sugar Addiction\nin 60 Days',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              
              // Social proof stats
              _buildSocialProof(),
              
              const Spacer(flex: 2),
              
              // Key benefits
              _buildBenefitsList(),
              
              const Spacer(flex: 3),
              
              // Start button
              _buildStartButton(context),
              
              const SizedBox(height: 16),
              
              // Skip onboarding option
              _buildSkipButton(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSocialProof() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppCardStyles.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('500K+', 'Users'),
          _buildStatItem('4.8★', 'Rating'),
          _buildStatItem('60', 'Days'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.heading.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.accentOrange,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitsList() {
    final benefits = [
      '🧠 Science-backed sugar addiction recovery',
      '📊 Personalized 60-day step-down program', 
      '💪 Withdrawal support & coping strategies',
      '🏆 Track progress with celebration milestones',
    ];

    return Column(
      children: benefits.map((benefit) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Text(
              benefit,
              style: AppTextStyles.body.copyWith(
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/onboarding/scientific-foundation');
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
            'Begin Recovery',
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

  Widget _buildSkipButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Skip to dashboard with default settings
        context.go('/dashboard');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'Skip for now',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.textMuted,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}