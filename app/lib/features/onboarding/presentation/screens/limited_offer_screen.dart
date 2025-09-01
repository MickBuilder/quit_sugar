import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/subscription/presentation/screens/revenuecat_paywall_screen.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class LimitedOfferScreen extends AppScreen {
  const LimitedOfferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = useState<Duration>(const Duration(minutes: 27, seconds: 12));
    
    // Countdown timer effect
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown.value.inSeconds > 0) {
          countdown.value = Duration(seconds: countdown.value.inSeconds - 1);
        } else {
          timer.cancel();
        }
      });
      
      return timer.cancel;
    }, []);

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
                      'Special Launch Offer\n87% Off',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.accentOrange,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Limited time offer - don\'t miss out on this exclusive deal',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Countdown timer
                    _buildCountdownTimer(countdown.value),
                    
                    const SizedBox(height: 32),
                    
                    // Offer card
                    _buildOfferCard(),
                    
                    const SizedBox(height: 32),
                    
                    // Benefits
                    _buildBenefits(),
                    
                    const SizedBox(height: 32),
                    
                    // Guarantee
                    _buildGuarantee(),
                  ],
                ),
              ),
            ),
            
            // Claim button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildClaimButton(context, ref),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCountdownTimer(Duration countdown) {
    final hours = countdown.inHours;
    final minutes = countdown.inMinutes % 60;
    final seconds = countdown.inSeconds % 60;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.progressRed.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.progressRed,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Special offer expires in:',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.progressRed,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeUnit(hours.toString().padLeft(2, '0'), 'Hours'),
              _buildTimeUnit(minutes.toString().padLeft(2, '0'), 'Minutes'),
              _buildTimeUnit(seconds.toString().padLeft(2, '0'), 'Seconds'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnit(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.progressRed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: AppTheme.primaryWhite,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppTheme.progressRed,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentOrange,
            AppTheme.accentOrange.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
      child: Column(
        children: [
          Text(
            '87% OFF',
            style: AppTextStyles.heading.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppTheme.primaryWhite,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlack,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Only €2.50 per month',
              style: AppTextStyles.body.copyWith(
                color: AppTheme.primaryWhite,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            '€19.99 €2.50/month',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.primaryWhite,
              fontSize: 14,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            '€29.99 €/yr - lowest ever',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.primaryWhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefits() {
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
          
          _buildBenefitItem('As low as €0.08 per day'),
          _buildBenefitItem('60 days life reset program'),
          _buildBenefitItem('Change your life forever'),
          _buildBenefitItem('Unlimited access'),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: AppTheme.progressGreen,
            size: 20,
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

  Widget _buildGuarantee() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.progressGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.progressGreen,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.checkmark_shield,
            color: AppTheme.progressGreen,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '60-Day Money-Back Guarantee',
              style: AppTextStyles.body.copyWith(
                color: AppTheme.progressGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClaimButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // Navigate to existing RevenueCat paywall
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => const RevenueCatPaywallScreen(source: 'onboarding'),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.progressRed,
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
            'Claim Your Limited Offer Now!',
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
