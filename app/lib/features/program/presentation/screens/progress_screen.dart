import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/program/presentation/widgets/simple_progress_grid.dart';
import 'package:quit_suggar/features/program/presentation/widgets/weekly_sugar_bar_chart.dart';
import 'package:quit_suggar/features/program/presentation/widgets/current_month_calendar.dart';
import 'package:quit_suggar/features/program/presentation/widgets/program_overview.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class ProgressScreen extends AppScreen {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sugarTrackingAsync = ref.watch(sugarTrackingProvider);

    return sugarTrackingAsync.when(
      data: (sugarTracking) {
        AppLogger.logUI('Progress screen built');
        return _buildProgressScreen(context, ref, sugarTracking);
      },
      loading: () => buildLoadingState(context),
      error: (error, stackTrace) {
        AppLogger.logUI('Progress screen error: $error');
        return buildErrorState(context, error, stackTrace);
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
        leading: Text('Program', style: AppTextStyles.heading),
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

                // Program Overview - Phase and Progress
                const ProgramOverview(),

                const SizedBox(height: 24),

                // Weekly Sugar Consumption Bar Chart
                const WeeklySugarBarChart(),

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




}
