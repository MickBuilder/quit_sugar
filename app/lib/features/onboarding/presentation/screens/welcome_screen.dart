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
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: Border(bottom: BorderSide.none),
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // SugAddict app logo - smaller and at top
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.primaryBlack, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlack.withValues(alpha: 0.8),
                      blurRadius: 0,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/icon/app-icon.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Main title on one line
              Text(
                'Welcome to SugAddict',
                style: AppTextStyles.display.copyWith(
                  fontSize: 28,
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

              const Spacer(),

              // Key benefits
              _buildBenefitsList(),

              const SizedBox(height: 24),

              // Social proof stats
              _buildSocialProof(),

              const SizedBox(height: 24),

              // Start button
              _buildStartButton(context),
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
          _buildStatItem('10K+', 'Users'),
          _buildStatItem('95%', 'Success'),
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
          style: AppTextStyles.caption.copyWith(color: AppTheme.textSecondary),
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
      children: benefits
          .map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      benefit,
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/onboarding/assessment-intro');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.accentOrange,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.borderDefault, width: 2),
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
}
