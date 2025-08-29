// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/today_entries_list.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/daily_progress_card.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/expandable_fab.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/program/presentation/providers/celebration_provider.dart';
import 'package:quit_suggar/features/program/presentation/widgets/celebration_modal.dart';
import 'package:quit_suggar/features/program/domain/entities/celebration.dart';

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

        // Check daily streak evaluation and celebrations when dashboard loads
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(sugarTrackingProvider.notifier).checkDailyStreakEvaluation();
          _checkAndShowCelebration(context, ref);
        });

        return Stack(
          children: [
            _buildDashboard(context, ref, dailySummary),
            const ExpandableFab(),
          ],
        );
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
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CupertinoPageScaffold(
        backgroundColor: AppTheme.background,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppTheme.background,
          border: const Border(bottom: BorderSide.none),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Today',
                style: AppTextStyles.heading,
              ),
              const SizedBox(width: 8),
              Text(
                _getFormattedDate(),
                style: AppTextStyles.caption.copyWith(
                  color: AppTheme.textMuted,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.0
                ),
              ),
            ],
          ),
          trailing: _buildStreakCounter(dailySummary.streak, ref),
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
          'Today',
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
          'Today',
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

  String _getFormattedDate() {
    final now = DateTime.now();
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${now.day} ${months[now.month - 1]}';
  }

  Widget _buildStreakCounter(int streak, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Day counter
        ref.watch(onboardingDataProvider).when(
          data: (data) {
            if (data == null) return const SizedBox.shrink();
            
            final now = DateTime.now();
            final daysPassed = now.difference(data.startDate).inDays;
            
            return Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.accentOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.accentOrange, width: 1),
              ),
              child: Text(
                'Day ${daysPassed + 1}/${data.targetDays}',
                style: AppTextStyles.caption.copyWith(
                  color: AppTheme.accentOrange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
        // Streak counter
        Icon(
          CupertinoIcons.flame_fill,
          color: AppTheme.accentOrange,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(
          '$streak',
          style: AppTextStyles.heading.copyWith(
            fontSize: 16,
            color: AppTheme.accentOrange,
          ),
        ),
      ],
    );
  }

  void _checkAndShowCelebration(BuildContext context, WidgetRef ref) {
    ref.read(todayCelebrationProvider.future).then((Celebration? celebration) {
      if (celebration != null && context.mounted) {
        final celebrationSeenNotifier = ref.read(celebrationSeenProvider.notifier);
        
        // Check if user has already seen today's celebration
        if (!celebrationSeenNotifier.hasSeen(celebration.day)) {
          // Show celebration modal
          showCelebrationModal(context, celebration);
          
          // Mark as seen so it doesn't show again today
          celebrationSeenNotifier.markSeen(celebration.day);
          
          AppLogger.logUserAction(
            'Celebration shown: Day ${celebration.day} - ${celebration.type.name}',
          );
        }
      }
    });
  }
}
