import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class OnboardingProgressBar extends StatelessWidget {
  final int current;
  final int total;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const OnboardingProgressBar({
    super.key,
    required this.current,
    required this.total,
    this.height = 6.0,
    this.backgroundColor = AppTheme.neutralLightGrey,
    this.progressColor = AppTheme.accentOrange,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / total;
    
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}