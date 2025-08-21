import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<CustomDialogAction> actions;
  final bool showLoading;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: CardStyles.primary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack,
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.borderDefault,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  title,
                  style: EmotionalTextStyles.achievement.copyWith(
                    color: AppTheme.primaryWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (showLoading) ...[
                      const CupertinoActivityIndicator(radius: 20),
                      const SizedBox(height: 16),
                    ],
                    Text(
                      content,
                      style: EmotionalTextStyles.supportive.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Actions
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.borderDefault,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  children: actions.map((action) {
                    final isLast = action == actions.last;
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: isLast
                              ? null
                              : Border(
                                  right: BorderSide(
                                    color: AppTheme.borderDefault,
                                    width: 2,
                                  ),
                                ),
                        ),
                        child: CupertinoButton(
                          onPressed: action.onPressed,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            action.text,
                            style: EmotionalTextStyles.achievement.copyWith(
                                                           color: action.isDestructive
                                 ? AppTheme.accentOrange
                                 : AppTheme.primaryBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialogAction {
  final String text;
  final VoidCallback onPressed;
  final bool isDestructive;

  const CustomDialogAction({
    required this.text,
    required this.onPressed,
    this.isDestructive = false,
  });
}
