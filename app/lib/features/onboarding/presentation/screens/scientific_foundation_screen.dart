import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class ScientificFoundationScreen extends AppScreen {
  const ScientificFoundationScreen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // App icon at the top
              Container(
                width: 50,
                height: 50,
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
              
              const SizedBox(height: 16),
              
              // Title
              Text(
                'SugAddict\'s\nScience-Backed Plan',
                style: AppTextStyles.display.copyWith(
                  fontSize: 24,
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // WHO Official Statement
              _buildResearchQuote(
                quote: 'Reduce daily sugar intake to less than 25 grams for additional health benefits.',
                source: 'World Health Organization',
                logoPath: 'assets/image/who-logo.png'
              ),
              
              const SizedBox(height: 16),
              
              // Princeton Research
              _buildResearchQuote(
                quote: 'Sugar provokes dopamine surges in the brain similar to addictive drugs.',
                source: 'Princeton University Psychology',
                logoPath: 'assets/image/princeton-uni-logo.png'
              ),
              
              const SizedBox(height: 16),
              
              // Neuroscience Research
              _buildResearchQuote(
                quote: 'Sugar affects brain chemistry like psychostimulants and opiates.',
                source: 'Neuroscience Research',
                logoPath: null
              ),
              
              const Spacer(),
              
              // Next button
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildResearchQuote({
    required String quote,
    required String source,
    required String? logoPath,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.primaryBlack,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlack.withValues(alpha: 0.8),
            blurRadius: 0,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side - Logo or badge
          if (logoPath != null) ...[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.primaryWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ] else ...[
            // For neuroscience research without logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.accentBlue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryBlack, width: 1),
              ),
              child: const Icon(
                CupertinoIcons.lab_flask_solid,
                color: AppTheme.primaryWhite,
                size: 24,
              ),
            ),
          ],
          
          const SizedBox(width: 16),
          
          // Right side - Quote and source
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quote
                Text(
                  quote,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 16,
                    height: 1.3,
                    color: AppTheme.textPrimary,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Source
                Text(
                  source,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/onboarding/lifestyle-motivation');
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.chevron_right,
                color: AppTheme.primaryWhite,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
