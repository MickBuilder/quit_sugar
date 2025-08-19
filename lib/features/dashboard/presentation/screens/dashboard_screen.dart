// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/router/navigation_helper.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// We now use HookConsumerWidget to use hooks with Riverpod
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get sugar tracking data from provider
    final sugarTracking = ref.watch(sugarTrackingProvider);
    final dailySummary = sugarTracking.getDailySummary();

    AppLogger.logUI('Dashboard screen built - Daily summary: ${dailySummary.totalSugar.toStringAsFixed(1)}g/${dailySummary.dailyLimit.toStringAsFixed(0)}g');

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
                _buildSugarProgress(context, dailySummary),
                const SizedBox(height: 24),
                _buildMotivationalCard(context, dailySummary),
                const SizedBox(height: 16),
                ShadButton(
                  onPressed: () async {
                    AppLogger.logUserAction('Pressed scan product button');
                    // Navigate to the scanner using NavigationHelper
                    await NavigationHelper.goToScanner(context);
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
                _buildTodayEntries(context, dailySummary.entries),
                const SizedBox(height: 16),
                _buildXPCard(context, dailySummary.xpPoints),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationalCard(BuildContext context, DailySummary summary) {
    AppLogger.logUI('Building motivational card with status: ${summary.status.name}');
    
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            summary.motivationalMessage,
            style: EmotionalTextStyles.achievement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '${summary.entries.length} items tracked today',
            style: EmotionalTextStyles.supportive,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTodayEntries(BuildContext context, List<FoodEntry> entries) {
    AppLogger.logUI('Building today entries section with ${entries.length} entries');
    
    if (entries.isEmpty) {
      return Container(
        decoration: CardStyles.primary,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Food Log:',
              style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'No items tracked yet. Start by scanning a product!',
              style: EmotionalTextStyles.supportive,
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Food Log:',
            style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...entries.map((entry) => _buildEntryItem(context, entry)),
        ],
      ),
    );
  }

  Widget _buildEntryItem(BuildContext context, FoodEntry entry) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.displayName,
                  style: EmotionalTextStyles.supportive.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${entry.portionGrams.toStringAsFixed(0)}g portion',
                  style: EmotionalTextStyles.supportive.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.warningRed.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${entry.sugarAmount.toStringAsFixed(1)}g',
              style: EmotionalTextStyles.warning.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildXPCard(BuildContext context, int xpPoints) {
    AppLogger.logUI('Building XP card with $xpPoints points');
    
    return Container(
      decoration: CardStyles.achievement,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.star_fill,
            color: AppTheme.victoryColor,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            '$xpPoints XP earned today',
            style: EmotionalTextStyles.achievement,
          ),
        ],
      ),
    );
  }

  // Helper widget for the progress circle with emotional design
  Widget _buildSugarProgress(BuildContext context, DailySummary summary) {
    final double percentage = summary.progressPercentage;
    
    AppLogger.logUI('Building sugar progress with ${summary.totalSugar.toStringAsFixed(1)}g/${summary.dailyLimit.toStringAsFixed(0)}g (${(percentage * 100).toStringAsFixed(0)}%) - Status: ${summary.status.name}');
    
    // Determine emotional state based on sugar intake
    late Color progressColor;
    late String motivationalText;
    late String subtitleText;
    
    switch (summary.status) {
      case SugarStatus.green:
        progressColor = AppTheme.victoryColor;
        motivationalText = 'Great job!';
        subtitleText = 'You\'re under your limit';
        break;
      case SugarStatus.yellow:
        progressColor = AppTheme.cravingColor;
        motivationalText = 'Be careful!';
        subtitleText = 'You\'re close to your limit';
        break;
      case SugarStatus.red:
        progressColor = AppTheme.warningRed;
        motivationalText = 'Stay strong!';
        subtitleText = 'You\'re very close to your limit';
        break;
      case SugarStatus.overLimit:
        progressColor = AppTheme.relapseColor;
        motivationalText = 'Tomorrow is a new day!';
        subtitleText = 'You\'ve exceeded your limit';
        break;
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
                        '${summary.totalSugar.toStringAsFixed(0)}g',
                        style: EmotionalTextStyles.progress,
                      ),
                      Text(
                        'of ${summary.dailyLimit.toStringAsFixed(0)}g',
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
          if (summary.remainingSugar > 0) ...[
            const SizedBox(height: 8),
            Text(
              '${summary.remainingSugar.toStringAsFixed(0)}g remaining',
              style: EmotionalTextStyles.supportive.copyWith(
                color: AppTheme.victoryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}