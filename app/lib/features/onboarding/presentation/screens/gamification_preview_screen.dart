import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class GamificationPreviewScreen extends HookConsumerWidget {
  const GamificationPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      'Meet Your\nSugaddict Buddy',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Your companion will track your progress and celebrate your wins',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Sugaddict buddy mascot
                    _buildSugarBuddy(),
                    
                    const SizedBox(height: 32),
                    
                    // Streak preview
                    _buildStreakPreview(),
                    
                    const SizedBox(height: 32),
                    
                    // Features
                    _buildFeatures(),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(context, ref),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSugarBuddy() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppTheme.accentOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentOrange,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.accentOrange,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: AppTheme.borderDefault,
                width: 3,
              ),
            ),
            child: const Icon(
              CupertinoIcons.flame_fill,
              color: AppTheme.primaryWhite,
              size: 40,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Sugaddict Buddy',
            style: AppTextStyles.heading.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.accentOrange,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'Your motivation companion',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakPreview() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Track Your Streaks',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Icon(
                CupertinoIcons.flame_fill,
                color: AppTheme.accentOrange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Days without sugar: 0',
                style: AppTextStyles.body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Icon(
                CupertinoIcons.calendar,
                color: AppTheme.progressGreen,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Weekly goal: 7 days',
                style: AppTextStyles.body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Icon(
                CupertinoIcons.star_fill,
                color: AppTheme.progressYellow,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Achievements: 0 unlocked',
                style: AppTextStyles.body.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What Your Buddy Does',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem('🎯', 'Tracks your daily progress'),
          _buildFeatureItem('🏆', 'Celebrates your achievements'),
          _buildFeatureItem('💪', 'Motivates you to keep going'),
          _buildFeatureItem('📊', 'Shows your streak count'),
          _buildFeatureItem('🎉', 'Unlocks special rewards'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push('/onboarding/premium-features');
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
}
