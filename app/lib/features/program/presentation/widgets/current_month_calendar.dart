import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/utils/date_utils.dart';

class CurrentMonthCalendar extends ConsumerWidget {
  const CurrentMonthCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final monthName = DateUtils.getMonthName(now.month);
    final year = now.year;
    
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with month/year and streak info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$monthName $year',
                style: AppTextStyles.title,
              ),
              _buildStreakInfo(ref),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Calendar grid
          _buildCalendarGrid(now, ref),
        ],
      ),
    );
  }

  Widget _buildStreakInfo(WidgetRef ref) {
    final dailySummary = ref.watch(sugarTrackingProvider.notifier).getDailySummary();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Your Streak',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.textMuted,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(
              '${dailySummary.streak}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.progressGreen,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Days',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.progressGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalendarGrid(DateTime currentDate, WidgetRef ref) {
    final daysInMonth = DateUtils.getDaysInMonth(currentDate.year, currentDate.month);
    final startingWeekday = DateUtils.getFirstDayOfMonth(currentDate.year, currentDate.month);
    
    return Column(
      children: [
        // Weekday headers
        _buildWeekdayHeaders(),
        
        const SizedBox(height: 12),
        
        // Calendar days grid
        _buildDaysGrid(daysInMonth, startingWeekday, currentDate.day, ref),
      ],
    );
  }

  Widget _buildWeekdayHeaders() {
    const weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays.map((day) => SizedBox(
        width: 32,
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textMuted,
            ),
          ),
        ),
      )).toList(),
    );
  }

  Widget _buildDaysGrid(int daysInMonth, int startingWeekday, int currentDay, WidgetRef ref) {
    final List<Widget> dayWidgets = [];
    
    // Add empty spaces for days before the first day of the month
    for (int i = 1; i < startingWeekday; i++) {
      dayWidgets.add(const SizedBox(width: 32, height: 32));
    }
    
    // Add days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(_buildDayCell(day, day == currentDay, day < currentDay, ref));
    }
    
    // Organize into rows of 7
    final List<Widget> rows = [];
    for (int i = 0; i < dayWidgets.length; i += 7) {
      final rowChildren = dayWidgets
          .skip(i)
          .take(7)
          .toList();
      
      // Fill remaining spaces in the last row
      while (rowChildren.length < 7) {
        rowChildren.add(const SizedBox(width: 32, height: 32));
      }
      
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: rowChildren,
          ),
        ),
      );
    }
    
    return Column(children: rows);
  }

  Widget _buildDayCell(int day, bool isToday, bool isPast, WidgetRef ref) {
    // Get real data for this day
    final isSuccess = _getRealDayStatus(day, isPast, ref);
    
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    Widget? icon;
    
    if (isToday) {
      backgroundColor = AppTheme.accentOrange;
      borderColor = AppTheme.borderDefault;
      textColor = AppTheme.primaryWhite;
    } else if (isPast) {
      if (isSuccess) {
        backgroundColor = AppTheme.progressGreen;
        borderColor = AppTheme.borderDefault;
        textColor = AppTheme.primaryWhite;
        icon = const Icon(
          CupertinoIcons.checkmark,
          size: 12,
          color: AppTheme.primaryWhite,
        );
      } else {
        backgroundColor = AppTheme.errorRed;
        borderColor = AppTheme.borderDefault;
        textColor = AppTheme.primaryWhite;
        icon = const Icon(
          CupertinoIcons.xmark,
          size: 12,
          color: AppTheme.primaryWhite,
        );
      }
    } else {
      // Future days
      backgroundColor = AppTheme.surfaceBackground;
      borderColor = AppTheme.borderDefault;
      textColor = AppTheme.textMuted;
    }
    
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
          if (icon != null)
            Positioned(
              top: 2,
              right: 2,
              child: icon,
            ),
        ],
      ),
    );
  }



  bool _getRealDayStatus(int day, bool isPast, WidgetRef ref) {
    if (!isPast) return false;
    
    // Get the date for this day
    final now = DateTime.now();
    final dateString = DateUtils.formatDate(DateTime(now.year, now.month, day));
    
    // Get historical data for this date
    final historicalDataAsync = ref.watch(dailySummariesInRangeProvider(
      dateString,
      dateString,
    ));
    
    // If no data available, assume success (conservative approach)
    if (historicalDataAsync.isLoading || historicalDataAsync.hasError) {
      return true;
    }
    
    final historicalData = historicalDataAsync.value ?? [];
    if (historicalData.isEmpty) {
      return true; // No data means no failure recorded
    }
    
    // Check if the day was successful (under limit)
    final dayLog = historicalData.first;
    return !dayLog.limitExceeded;
  }
}