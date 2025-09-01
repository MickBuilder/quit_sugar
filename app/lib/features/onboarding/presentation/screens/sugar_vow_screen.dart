import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class SugarVowScreen extends AppScreen {
  const SugarVowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSigned = useState<bool>(false);

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
                      'Make Your\nSugaddict Vow',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Commit to breaking free from sugar addiction over the next 60 days',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Vow text
                    _buildVowText(),
                    
                    const SizedBox(height: 32),
                    
                    // Date
                    _buildDate(),
                    
                    const SizedBox(height: 40),
                    
                    // Signature instruction
                    Text(
                      'Read the Sugaddict vow and tap to commit',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Signature area
                    _buildSignatureArea(ref, hasSigned),
                    
                    const SizedBox(height: 16),
                    
                    // Disclaimer
                    Text(
                      '*Your commitment will be saved to help keep you motivated',
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textMuted,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(context, ref, hasSigned),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildVowText() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"I commit to breaking free from sugar addiction over the next 60 days."',
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'This Sugaddict program is my promise and commitment to take back control and move forward.',
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Text(
            'Even if I stumble, I will rise again and keep going.',
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Text(
            '"The next 60 days are not done for anyone else. They are a gift to myself--a step toward growth and transformation."',
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDate() {
    final now = DateTime.now();
    final formattedDate = '${_getMonthName(now.month)} ${now.day}, ${now.year}';
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.accentOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.accentOrange,
          width: 2,
        ),
      ),
      child: Text(
        formattedDate,
        style: AppTextStyles.body.copyWith(
          color: AppTheme.accentOrange,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  Widget _buildSignatureArea(WidgetRef ref, ValueNotifier<bool> hasSigned) {
    final onboardingData = ref.watch(onboardingFlowProvider);
    final displayName = onboardingData.name.isNotEmpty ? onboardingData.name : "Future Sugar-Free You";
    
    return GestureDetector(
      onTap: () {
        if (!hasSigned.value) {
          hasSigned.value = true;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: hasSigned.value ? AppTheme.progressGreen.withValues(alpha: 0.1) : AppTheme.surfaceBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasSigned.value ? AppTheme.progressGreen : AppTheme.borderDefault,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: hasSigned.value ? 0.6 : 0.3),
              blurRadius: 0,
              offset: Offset(hasSigned.value ? 6 : 2, hasSigned.value ? 6 : 2),
            ),
          ],
        ),
        child: hasSigned.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: AppTheme.progressGreen,
                    size: 36,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Digital Signature:',
                    style: AppTextStyles.caption.copyWith(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    displayName,
                    style: AppTextStyles.body.copyWith(
                      color: AppTheme.progressGreen,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.signature,
                    color: AppTheme.accentOrange,
                    size: 36,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to Sign Digitally',
                    style: AppTextStyles.body.copyWith(
                      color: AppTheme.accentOrange,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'as "$displayName"',
                    style: AppTextStyles.caption.copyWith(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> hasSigned,
  ) {
    final isEnabled = hasSigned.value;
    
    return GestureDetector(
      onTap: isEnabled ? () {
        // Save vow signature and navigate to next screen
        ref.read(onboardingFlowProvider.notifier).signVow();
        context.push('/onboarding/completion');
      } : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isEnabled ? AppTheme.primaryBlack : AppTheme.neutralLightGrey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: isEnabled ? [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: 0.7),
              blurRadius: 0,
              offset: const Offset(4, 4),
            ),
          ] : null,
        ),
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isEnabled ? AppTheme.primaryWhite : AppTheme.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
