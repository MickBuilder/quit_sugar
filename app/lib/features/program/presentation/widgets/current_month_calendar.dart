import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class CurrentMonthCalendar extends ConsumerWidget {
  const CurrentMonthCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final monthName = _getMonthName(now.month);
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
          _buildCalendarGrid(now),
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

  Widget _buildCalendarGrid(DateTime currentDate) {
    final daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
    final firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    final startingWeekday = firstDayOfMonth.weekday;
    
    return Column(
      children: [
        // Weekday headers
        _buildWeekdayHeaders(),
        
        const SizedBox(height: 12),
        
        // Calendar days grid
        _buildDaysGrid(daysInMonth, startingWeekday, currentDate.day),
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

  Widget _buildDaysGrid(int daysInMonth, int startingWeekday, int currentDay) {
    final List<Widget> dayWidgets = [];
    
    // Add empty spaces for days before the first day of the month
    for (int i = 1; i < startingWeekday; i++) {
      dayWidgets.add(const SizedBox(width: 32, height: 32));
    }
    
    // Add days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(_buildDayCell(day, day == currentDay, day < currentDay));
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

  Widget _buildDayCell(int day, bool isToday, bool isPast) {
    // Mock data for success/failure - replace with real data
    final isSuccess = _getMockDayStatus(day, isPast);
    
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

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  bool _getMockDayStatus(int day, bool isPast) {
    if (!isPast) return false;
    
    // Mock pattern: mostly successful with some failures
    final failureDays = [5, 12, 18, 25]; // Days when limit was exceeded
    return !failureDays.contains(day);
  }
}