// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/router/navigation_helper.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/motivational_card.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/sugar_progress_circle.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/today_entries_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// We now use HookConsumerWidget to use hooks with Riverpod
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get sugar tracking data from provider (now async)
    final sugarTrackingAsync = ref.watch(sugarTrackingProvider);
    
    return sugarTrackingAsync.when(
      data: (sugarTracking) {
        final dailySummary = sugarTracking.getDailySummary();
        AppLogger.logUI('Dashboard screen built - Daily summary: ${dailySummary.totalSugar.toStringAsFixed(1)}g/${dailySummary.dailyLimit.toStringAsFixed(0)}g');
        
        return _buildDashboard(context, ref, dailySummary);
      },
      loading: () => _buildLoadingScreen(),
      error: (error, stackTrace) {
        AppLogger.logUI('Dashboard error: $error');
        return _buildErrorScreen(error);
      },
    );
  }

  Widget _buildDashboard(BuildContext context, WidgetRef ref, DailySummary dailySummary) {
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SugarProgressCircle(summary: dailySummary),
                const SizedBox(height: 24),
                MotivationalCard(summary: dailySummary),
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
                TodayEntriesList(entries: dailySummary.entries),
                const SizedBox(height: 40), // Add bottom padding for safety
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
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
      child: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 20),
              SizedBox(height: 16),
              Text(
                'Loading your daily progress...',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorScreen(Object error) {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle,
                size: 48,
                color: AppTheme.warningRed,
              ),
              const SizedBox(height: 16),
              const Text(
                'Failed to load your data',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Error: $error',
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}