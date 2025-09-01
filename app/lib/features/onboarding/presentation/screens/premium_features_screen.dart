import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class PremiumFeaturesScreen extends AppScreen {
  const PremiumFeaturesScreen({super.key});

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
                    const SizedBox(height: 40),
                    
                    // Title
                    Text(
                      'Unlock Your Full\nSugaddict Potential',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Get access to advanced features that will accelerate your journey',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Premium features
                    _buildPremiumFeatures(),
                    
                    const SizedBox(height: 32),
                    
                    // Social proof
                    _buildSocialProof(),
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


  Widget _buildPremiumFeatures() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Premium Features',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem(
            '📊',
            'Advanced Analytics & Trends',
            'Detailed insights into your sugar patterns and progress over time',
            CupertinoIcons.chart_bar,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem(
            '🎯',
            'Personalized Coaching',
            'AI-powered recommendations tailored to your specific goals',
            CupertinoIcons.lightbulb,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem(
            '🏆',
            'Exclusive Challenges',
            'Special 60-day challenges with unique rewards and achievements',
            CupertinoIcons.star_fill,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem(
            '📱',
            'Unlimited Product Scans',
            'No daily limits on product scanning and analysis',
            CupertinoIcons.camera,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureItem(
            '🚫',
            'Ad-Free Experience',
                          'Enjoy a clean, distraction-free journey with Sugaddict',
            CupertinoIcons.xmark_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    String emoji,
    String title,
    String description,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppTheme.accentOrange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryWhite,
            size: 24,
          ),
        ),
        
        const SizedBox(width: 16),
        
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
              
              const SizedBox(height: 4),
              
              Text(
                description,
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialProof() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.accentOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.accentOrange,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Join 500K+ Premium Users',
            style: AppTextStyles.heading.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.accentOrange,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('4.8★', 'App Store Rating'),
              _buildStatItem('98%', 'Success Rate'),
              _buildStatItem('60', 'Day Guarantee'),
            ],
          ),
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

  Widget _buildContinueButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push('/onboarding/limited-offer');
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
            'Go Premium',
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
