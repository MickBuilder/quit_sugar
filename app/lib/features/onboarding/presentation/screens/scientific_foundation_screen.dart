import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ScientificFoundationScreen extends HookConsumerWidget {
  const ScientificFoundationScreen({super.key});

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
                      'Backed by\nScience',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Sugar addiction is real. Here\'s what the research says.',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // WHO Official Statement
                    _buildResearchQuote(
                      quote: '"Reduce daily sugar intake to less than 25 grams for additional health benefits."',
                      source: 'World Health Organization',
                      logoPath: 'assets/image/who-logo.png',
                      isWHO: true,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Princeton Research
                    _buildResearchQuote(
                      quote: '"Sugar provokes dopamine surges in the brain similar to addictive drugs."',
                      source: 'Princeton University Psychology',
                      logoPath: 'assets/image/princeton-uni-logo.png',
                      isWHO: false,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Neuroscience Research
                    _buildResearchQuote(
                      quote: '"Sugar affects brain chemistry like psychostimulants and opiates."',
                      source: 'Neuroscience Research',
                      logoPath: null,
                      isWHO: false,
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(context),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildResearchQuote({
    required String quote,
    required String source,
    required String? logoPath,
    required bool isWHO,
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
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.primaryWhite,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryBlack, width: 1),
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
              width: 60,
              height: 60,
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
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
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
        context.push('/onboarding/assessment-intro');
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
            'Start Assessment',
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
