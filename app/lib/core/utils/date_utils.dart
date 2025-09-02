

/// Utility class for date operations used across the app
class DateUtils {
  /// Get current date in YYYY-MM-DD format
  static String getCurrentDate() {
    return DateTime.now().toIso8601String().split('T')[0];
  }

  /// Get date in YYYY-MM-DD format from DateTime
  static String formatDate(DateTime date) {
    return date.toIso8601String().split('T')[0];
  }

  /// Get date in YYYY-MM-DD format from DateTime, offset by days
  static String getDateOffset(int daysOffset) {
    final date = DateTime.now().add(Duration(days: daysOffset));
    return formatDate(date);
  }

  /// Get month name from month number (1-12)
  static String getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  /// Get short month name from month number (1-12)
  static String getShortMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  /// Get short day name from weekday (1-7, Monday = 1)
  static String getShortDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  /// Get days in month
  static int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Get first day of month weekday (1-7, Monday = 1)
  static int getFirstDayOfMonth(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }

  /// Check if a date is today
  static bool isToday(String date) {
    return date == getCurrentDate();
  }

  /// Check if a date is in the past
  static bool isPast(String date) {
    final today = getCurrentDate();
    return date.compareTo(today) < 0;
  }

  /// Check if a date is in the future
  static bool isFuture(String date) {
    final today = getCurrentDate();
    return date.compareTo(today) > 0;
  }

  /// Get the last N days as date strings
  static List<String> getLastNDays(int count) {
    final List<String> dates = [];
    for (int i = count - 1; i >= 0; i--) {
      dates.add(getDateOffset(-i));
    }
    return dates;
  }

  /// Get the last N days as date strings starting from a specific date
  static List<String> getLastNDaysFromDate(String fromDate, int count) {
    final List<String> dates = [];
    final fromDateTime = DateTime.parse(fromDate);
    
    for (int i = count - 1; i >= 0; i--) {
      final date = fromDateTime.subtract(Duration(days: i));
      dates.add(formatDate(date));
    }
    return dates;
  }
}
