import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/daily_log_card.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class DailyLogsScreen extends AppScreen {
  const DailyLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: Text(
          'Daily Logs',
          style: AppTextStyles.heading,
        ),
      ),
      child: SafeArea(
        child: Container(
          color: AppTheme.background,
          child: Column(
            children: [
              // Header with summary stats
              _buildHeaderStats(ref),
              
              const SizedBox(height: 16),
              
              // Daily logs list
              Expanded(
                child: _buildDailyLogsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderStats(WidgetRef ref) {
    final sugarTrackingAsync = ref.watch(sugarTrackingProvider);
    
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: AppCardStyles.primary,
      child: Column(
        children: [
          Text(
            'Last 30 Days',
            style: AppTextStyles.title,
          ),
          const SizedBox(height: 12),
          
          sugarTrackingAsync.when(
            data: (sugarTracking) {
              final streak = sugarTracking.currentStreak;
              
              // Get historical data for calculations
              final endDate = DateTime.now();
              final startDate = endDate.subtract(const Duration(days: 29));
              
              final historicalDataAsync = ref.watch(
                dailySummariesInRangeProvider(
                  startDate.toIso8601String().split('T')[0],
                  endDate.toIso8601String().split('T')[0],
                ),
              );
              
              return historicalDataAsync.when(
                data: (logs) {
                  double avgSugar = 0.0;
                  int successfulDays = 0;
                  
                  if (logs.isNotEmpty) {
                    final totalSugar = logs.fold(0.0, (sum, log) => sum + log.totalSugar);
                    avgSugar = totalSugar / logs.length;
                    successfulDays = logs.where((log) => log.goalAchieved).length;
                  }
                  
                  final successRate = logs.isNotEmpty ? (successfulDays / logs.length * 100) : 0.0;
                  
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Streak', '$streak days', AppTheme.progressGreen),
                      _buildStatItem('Success Rate', '${successRate.toStringAsFixed(0)}%', AppTheme.accentBlue),
                      _buildStatItem('Avg. Sugar', '${avgSugar.toStringAsFixed(1)}g', AppTheme.accentOrange),
                    ],
                  );
                },
                loading: () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Streak', '$streak days', AppTheme.progressGreen),
                    _buildStatItem('Success Rate', '...', AppTheme.accentBlue),
                    _buildStatItem('Avg. Sugar', '...', AppTheme.accentOrange),
                  ],
                ),
                error: (_, __) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Streak', '$streak days', AppTheme.progressGreen),
                    _buildStatItem('Success Rate', 'N/A', AppTheme.accentBlue),
                    _buildStatItem('Avg. Sugar', 'N/A', AppTheme.accentOrange),
                  ],
                ),
              );
            },
            loading: () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Streak', '...', AppTheme.progressGreen),
                _buildStatItem('Success Rate', '...', AppTheme.accentBlue),
                _buildStatItem('Avg. Sugar', '...', AppTheme.accentOrange),
              ],
            ),
            error: (_, __) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Streak', 'N/A', AppTheme.progressGreen),
                _buildStatItem('Success Rate', 'N/A', AppTheme.accentBlue),
                _buildStatItem('Avg. Sugar', 'N/A', AppTheme.accentOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildDailyLogsList() {
    return Consumer(
      builder: (context, ref, child) {
        // Get real historical data for the last 30 days
        final endDate = DateTime.now();
        final startDate = endDate.subtract(const Duration(days: 29));
        
        final historicalDataAsync = ref.watch(
          dailySummariesInRangeProvider(
            startDate.toIso8601String().split('T')[0],
            endDate.toIso8601String().split('T')[0],
          ),
        );
        
        return historicalDataAsync.when(
          data: (logs) {
            if (logs.isEmpty) {
              return const Center(
                child: Text(
                  'No historical data available yet.\nStart tracking to see your progress!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 16,
                  ),
                ),
              );
            }
            
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: DailyLogCard(log: log),
                );
              },
            );
          },
          loading: () => const Center(
            child: CupertinoActivityIndicator(radius: 20),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              'Error loading data: $error',
              style: const TextStyle(color: AppTheme.accentRed),
            ),
          ),
        );
      },
    );
  }
}