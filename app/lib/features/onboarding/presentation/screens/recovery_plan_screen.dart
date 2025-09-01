import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class RecoveryPlanScreen extends HookConsumerWidget {
  const RecoveryPlanScreen({super.key});

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Your 60-Day\nSugar Recovery Plan',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'A personalized journey to break free from sugar addiction',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Plan overview
                    _buildPlanOverview(),
                    
                    const SizedBox(height: 32),
                    
                    // Phase details
                    _buildPhaseDetails(),
                    
                    const SizedBox(height: 32),
                    
                    // Key features
                    _buildKeyFeatures(),
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


  Widget _buildPlanOverview() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        children: [
          Text(
            '60 Days with Sugaddict',
            style: AppTextStyles.heading.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppTheme.accentOrange,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOverviewItem('4', 'Phases'),
              _buildOverviewItem('9', 'Weeks'),
              _buildOverviewItem('60', 'Days'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.heading.copyWith(
            fontSize: 24,
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

  Widget _buildPhaseDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Program Phases',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          _buildPhaseItem(
            'Phase 1',
            'Foundation & Assessment',
            'Days 1-20',
            'Understanding your baseline',
            AppTheme.progressGreen,
          ),
          
          const SizedBox(height: 12),
          
          _buildPhaseItem(
            'Phase 2',
            'Active Reduction',
            'Days 22-42',
            'Gradual sugar reduction',
            AppTheme.progressYellow,
          ),
          
          const SizedBox(height: 12),
          
          _buildPhaseItem(
            'Phase 3',
            'Deep Reset',
            'Days 43-52',
            'Breaking dependencies',
            AppTheme.progressRed,
          ),
          
          const SizedBox(height: 12),
          
          _buildPhaseItem(
            'Phase 4',
            'Freedom & Integration',
            'Days 57-60',
            'Lifestyle mastery',
            AppTheme.accentOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseItem(
    String phase,
    String title,
    String duration,
    String description,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              phase.split(' ')[1],
              style: AppTextStyles.body.copyWith(
                color: AppTheme.primaryWhite,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 12),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              
              const SizedBox(height: 2),
              
              Text(
                duration,
                style: AppTextStyles.body.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 2),
              
              Text(
                description,
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeyFeatures() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What You\'ll Get',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem('🎯', 'Daily personalized limits'),
          _buildFeatureItem('📊', 'Progress tracking & analytics'),
          _buildFeatureItem('🏆', 'Achievement badges & streaks'),
          _buildFeatureItem('📱', 'Product scanning & analysis'),
          _buildFeatureItem('💪', 'Motivation & support'),
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
        context.push('/onboarding/sugar-vow');
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
            'Start My Plan',
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
