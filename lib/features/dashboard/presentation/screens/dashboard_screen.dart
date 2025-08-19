// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/router/navigation_helper.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// We now use HookConsumerWidget to use hooks with Riverpod
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useState is a hook that manages a simple piece of state
    final lastScannedCode = useState<String?>(null);

    // Placeholder data
    final double currentSugar = 14.0;
    final double dailyGoal = 25.0;

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.darkBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.darkBackground,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Today\'s Sugar',
          style: EmotionalTextStyles.motivational,
        ),
      ),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: EmotionalGradients.support,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSugarProgress(context, currentSugar, dailyGoal),
                const SizedBox(height: 24),
                _buildMotivationalCard(context),
                const SizedBox(height: 16),
                ShadButton(
                  onPressed: () async {
                    // Navigate to the scanner using NavigationHelper
                    final String? barcode = await NavigationHelper.goToScanner(context);
                    // When the scanner screen pops, update our state
                    if (barcode != null) {
                      lastScannedCode.value = barcode;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: EmotionalGradients.motivation,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.qrcode_viewfinder,
                          size: 20,
                          color: AppTheme.textPrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Scan a Product',
                          style: EmotionalTextStyles.motivational.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildLastScannedCard(context, lastScannedCode.value),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationalCard(BuildContext context) {
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'You\'re doing great!',
            style: EmotionalTextStyles.achievement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Every day without sugar is a victory. Keep going!',
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLastScannedCard(BuildContext context, String? lastCode) {
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last Scanned Product:',
            style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            lastCode ?? 'No products scanned yet. Start your journey!',
            style: EmotionalTextStyles.supportive,
          ),
        ],
      ),
    );
  }

  // Helper widget for the progress circle with emotional design
  Widget _buildSugarProgress(BuildContext context, double current, double goal) {
    final double percentage = (current / goal).clamp(0.0, 1.0);
    final theme = ShadTheme.of(context);
    
    // Determine emotional state based on sugar intake
    final bool isOverLimit = current > goal;
    final bool isCloseToLimit = current > goal * 0.8;
    
    Color progressColor = AppTheme.victoryColor;
    String motivationalText = 'Great job!';
    String subtitleText = 'You\'re under your limit';
    
    if (isOverLimit) {
      progressColor = AppTheme.warningRed;
      motivationalText = 'Stay strong!';
      subtitleText = 'You\'re over your limit - tomorrow is a new day';
    } else if (isCloseToLimit) {
      progressColor = AppTheme.cravingColor;
      motivationalText = 'Be careful!';
      subtitleText = 'You\'re close to your limit';
    }
    
    return Container(
      decoration: CardStyles.progress,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            motivationalText,
            style: EmotionalTextStyles.achievement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 12,
                  backgroundColor: AppTheme.cardBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${current.toStringAsFixed(0)}g',
                        style: EmotionalTextStyles.progress,
                      ),
                      Text(
                        'of ${goal.toStringAsFixed(0)}g',
                        style: EmotionalTextStyles.supportive,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitleText,
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}