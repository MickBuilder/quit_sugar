import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/daily_log_card.dart';

class DailyLogsScreen extends HookConsumerWidget {
  const DailyLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
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
              _buildHeaderStats(),
              
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

  Widget _buildHeaderStats() {
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
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Streak', '12 days', AppTheme.progressGreen),
              _buildStatItem('Success Rate', '85%', AppTheme.accentBlue),
              _buildStatItem('Avg. Sugar', '18.5g', AppTheme.accentOrange),
            ],
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
    // Mock data for now - will be replaced with real data from repository
    final mockLogs = _generateMockLogs();
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: mockLogs.length,
      itemBuilder: (context, index) {
        final log = mockLogs[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: DailyLogCard(log: log),
        );
      },
    );
  }

  List<DailyLog> _generateMockLogs() {
    final List<DailyLog> logs = [];
    final now = DateTime.now();
    
    for (int i = 0; i < 30; i++) {
      final date = now.subtract(Duration(days: i));
      final totalSugar = 15.0 + (i * 0.5); // Gradually increasing
      final dailyLimit = 25.0;
      final goalAchieved = totalSugar <= dailyLimit;
      
      logs.add(DailyLog(
        date: date,
        totalSugar: totalSugar,
        dailyLimit: dailyLimit,
        entries: _generateMockEntries(date),
        status: _getSugarStatus(totalSugar, dailyLimit),
        goalAchieved: goalAchieved,
        streakDayNumber: goalAchieved ? (30 - i) : 0,
      ));
    }
    
    return logs;
  }

  List<FoodEntry> _generateMockEntries(DateTime date) {
    // Mock entries for each day
    return [
      // This would come from real data
    ];
  }

  SugarStatus _getSugarStatus(double totalSugar, double dailyLimit) {
    final percentage = totalSugar / dailyLimit;
    
    if (percentage <= 0.7) {
      return SugarStatus.green;
    } else if (percentage <= 0.9) {
      return SugarStatus.yellow;
    } else if (percentage <= 1.0) {
      return SugarStatus.red;
    } else {
      return SugarStatus.overLimit;
    }
  }
}