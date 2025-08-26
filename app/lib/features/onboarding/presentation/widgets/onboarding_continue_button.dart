import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class OnboardingContinueButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const OnboardingContinueButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isEnabled ? AppTheme.primaryBlack : AppTheme.neutralGrey,
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
            text,
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