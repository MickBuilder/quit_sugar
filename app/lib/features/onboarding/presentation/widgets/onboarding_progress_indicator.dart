import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final int current;
  final int total;

  const OnboardingProgressIndicator({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (index) {
        final isActive = index < current;
        final isCurrent = index == current - 1;
        
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < total - 1 ? 8 : 0),
            decoration: BoxDecoration(
              color: isActive 
                  ? (isCurrent ? AppTheme.accentOrange : AppTheme.progressGreen)
                  : AppTheme.neutralLightGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}