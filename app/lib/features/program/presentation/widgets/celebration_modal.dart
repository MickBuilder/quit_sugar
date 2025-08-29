import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/program/domain/entities/celebration.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/program_phase.dart';

class CelebrationModal extends HookConsumerWidget {
  final Celebration celebration;

  const CelebrationModal({
    required this.celebration,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );
    
    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    final bounceAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background.withValues(alpha: 0.9),
      child: SafeArea(
        child: Stack(
          children: [
            // Background decoration
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    colors: [
                      _getCelebrationColor().withValues(alpha: 0.1),
                      AppTheme.background,
                    ],
                  ),
                ),
              ),
            ),

            // Close button
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceBackground,
                    border: Border.all(color: AppTheme.primaryBlack, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: AppTheme.textMuted,
                    size: 20,
                  ),
                ),
              ),
            ),

            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: AnimatedBuilder(
                  animation: bounceAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: bounceAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceBackground,
                          border: Border.all(color: AppTheme.primaryBlack, width: 3),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.8),
                              blurRadius: 0,
                              offset: const Offset(8, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Badge/Emoji
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: _getCelebrationColor(),
                                border: Border.all(color: AppTheme.primaryBlack, width: 3),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                                    blurRadius: 0,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  celebration.badge,
                                  style: const TextStyle(fontSize: 32),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Title
                            Text(
                              celebration.title,
                              style: AppTextStyles.heading.copyWith(
                                fontSize: 28,
                                color: _getCelebrationColor(),
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            // Message
                            Text(
                              celebration.message,
                              style: AppTextStyles.body.copyWith(
                                fontSize: 16,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 24),

                            // Progress info
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _getCelebrationColor().withValues(alpha: 0.1),
                                border: Border.all(color: _getCelebrationColor(), width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Day ${celebration.day} • Week ${celebration.week}',
                                    style: AppTextStyles.title.copyWith(
                                      color: _getCelebrationColor(),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    celebration.phase.title,
                                    style: AppTextStyles.body.copyWith(
                                      color: AppTheme.textMuted,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Achievements
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppTheme.background,
                                border: Border.all(color: AppTheme.primaryBlack, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Achievements Unlocked:',
                                    style: AppTextStyles.title,
                                  ),
                                  const SizedBox(height: 12),
                                  ...celebration.achievements.map((achievement) => 
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: _getCelebrationColor(),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              achievement,
                                              style: AppTextStyles.body.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Continue button
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _getCelebrationColor(),
                                border: Border.all(color: AppTheme.primaryBlack, width: 3),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                                    blurRadius: 0,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: CupertinoButton(
                                onPressed: () => Navigator.of(context).pop(),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  _getContinueButtonText(),
                                  style: AppTextStyles.button.copyWith(
                                    color: AppTheme.primaryWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCelebrationColor() {
    switch (celebration.type) {
      case CelebrationType.weeklyCompletion:
        return AppTheme.accentBlue;
      case CelebrationType.majorMilestone:
        return AppTheme.starFilled;
    }
  }

  String _getContinueButtonText() {
    if (celebration.day == 60) {
      return 'Complete Program! 🎊';
    }
    
    switch (celebration.type) {
      case CelebrationType.weeklyCompletion:
        return 'Keep Going! 💪';
      case CelebrationType.majorMilestone:
        return 'Continue Journey! ✨';
    }
  }
}

// Helper function to show celebration modal
void showCelebrationModal(BuildContext context, Celebration celebration) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CelebrationModal(celebration: celebration),
  );
}