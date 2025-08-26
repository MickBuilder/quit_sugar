import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/progress/presentation/widgets/weekly_summary_card.dart';
import 'package:quit_suggar/features/progress/presentation/widgets/simple_progress_grid.dart';
import 'package:quit_suggar/features/progress/presentation/widgets/sugar_consumption_graph.dart';
import 'package:quit_suggar/features/progress/presentation/widgets/current_month_calendar.dart';

class ProgressScreen extends HookConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sugarTrackingAsync = ref.watch(sugarTrackingProvider);

    return sugarTrackingAsync.when(
      data: (sugarTracking) {
        AppLogger.logUI('Progress screen built');
        return _buildProgressScreen(context, ref, sugarTracking);
      },
      loading: () => _buildLoadingScreen(),
      error: (error, stackTrace) {
        AppLogger.logUI('Progress screen error: $error');
        return _buildErrorScreen(error);
      },
    );
  }

  Widget _buildProgressScreen(
    BuildContext context,
    WidgetRef ref,
    sugarTracking,
  ) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text('Progress', style: AppTextStyles.heading),
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

                // Sugar Consumption Graph (main feature)
                const SugarConsumptionGraph(),

                const SizedBox(height: 24),

                // Weekly summary
                WeeklySummaryCard(),

                const SizedBox(height: 24),

                // Current Month Calendar (like the running app example)
                const CurrentMonthCalendar(),

                const SizedBox(height: 24),

                // Simple progress grid
                SimpleProgressGrid(),

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
        middle: Text('Progress', style: AppTextStyles.heading),
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
        middle: Text('Progress', style: AppTextStyles.heading),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.exclamationmark_triangle,
                  color: AppTheme.textPrimary,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Something went wrong',
                  style: AppTextStyles.title.copyWith(
                    color: AppTheme.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please try again later',
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
