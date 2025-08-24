// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/today_entries_list.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/daily_progress_card.dart';

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
        AppLogger.logUI(
          'Dashboard screen built - Daily summary: ${dailySummary.totalSugar.toStringAsFixed(1)}g/${dailySummary.dailyLimit.toStringAsFixed(0)}g',
        );

        // Check daily streak evaluation when dashboard loads
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(sugarTrackingProvider.notifier).checkDailyStreakEvaluation();
        });

        return _buildDashboard(context, ref, dailySummary);
      },
      loading: () => _buildLoadingScreen(),
      error: (error, stackTrace) {
        AppLogger.logUI('Dashboard error: $error');
        return _buildErrorScreen(error);
      },
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    WidgetRef ref,
    DailySummary dailySummary,
  ) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Today\'s Progress',
          style: AppTextStyles.heading,
        ),
      ),
      child: SafeArea(
        child: Container(
          color: AppTheme.background,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                // Daily progress card
                DailyProgressCard(summary: dailySummary),

                const SizedBox(height: 24),

                // Food log card
                TodayEntriesList(entries: dailySummary.entries),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Today\'s Progress',
          style: AppTextStyles.heading,
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
                'Loading your progress...',
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorScreen(Object error) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Today\'s Progress',
          style: AppTextStyles.heading,
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
                color: AppTheme.accentOrange,
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
