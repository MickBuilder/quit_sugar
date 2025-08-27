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
              
              // App logo/icon area
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.accentOrange,
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
                  child: Text(
                    '🍭',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Welcome title
              Text(
                'Welcome to\nQuit Suggar',
                style: AppTextStyles.display.copyWith(
                  fontSize: 36,
                  color: AppTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle
              Text(
                'Break free from sugar addiction with our proven 60-day gradual reduction program',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              
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

  Widget _buildBenefitsList() {
    final benefits = [
      '🎯 Scientifically-designed 60-day program',
      '📊 Track daily sugar with smart limits',  
      '🏆 Gamified journey with achievements',
      '📱 Instant product scanning & analysis',
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
        context.push('/onboarding/personal-info');
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
            'Start Your Journey',
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