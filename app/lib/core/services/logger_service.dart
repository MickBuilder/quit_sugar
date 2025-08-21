import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    level: Level.debug,
  );

  // API and Network logging
  static void logApi(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i('🌐 API: $message', error: error, stackTrace: stackTrace);
  }

  static void logApiError(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.e('❌ API Error: $message', error: error, stackTrace: stackTrace);
  }

  // Sugar tracking logging
  static void logSugarTracking(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.i(
      '🍯 Sugar Tracking: $message',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void logSugarTrackingError(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.e(
      '❌ Sugar Tracking Error: $message',
      error: error,
      stackTrace: stackTrace,
    );
  }

  // Scanner logging
  static void logScanner(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.i('📱 Scanner: $message', error: error, stackTrace: stackTrace);
  }

  static void logScannerError(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.e(
      '❌ Scanner Error: $message',
      error: error,
      stackTrace: stackTrace,
    );
  }

  // Navigation logging
  static void logNavigation(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.i('🧭 Navigation: $message', error: error, stackTrace: stackTrace);
  }

  // UI and State logging
  static void logUI(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i('🎨 UI: $message', error: error, stackTrace: stackTrace);
  }

  static void logState(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.i('🔄 State: $message', error: error, stackTrace: stackTrace);
  }

  // General logging methods
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d('🐛 Debug: $message', error: error, stackTrace: stackTrace);
  }

  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i('ℹ️ Info: $message', error: error, stackTrace: stackTrace);
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w('⚠️ Warning: $message', error: error, stackTrace: stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e('❌ Error: $message', error: error, stackTrace: stackTrace);
  }

  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f('💀 Fatal: $message', error: error, stackTrace: stackTrace);
  }

  // Product-specific logging
  static void logProductFound(String barcode, String productName) {
    _logger.i('✅ Product Found: $productName (Barcode: $barcode)');
  }

  static void logProductNotFound(String barcode) {
    _logger.w('❓ Product Not Found: Barcode $barcode not in database');
  }

  static void logSugarCalculation(
    String productName,
    double sugarPer100g,
    double portion,
    double calculatedSugar,
  ) {
    _logger.i(
      '🧮 Sugar Calculation: $productName - ${sugarPer100g}g/100g × ${portion}g = ${calculatedSugar}g',
    );
  }

  // User action logging
  static void logUserAction(String action, [Map<String, dynamic>? data]) {
    final dataString = data != null ? ' - Data: $data' : '';
    _logger.i('👤 User Action: $action$dataString');
  }

  // Performance logging
  static void logPerformance(String operation, Duration duration) {
    _logger.i('⚡ Performance: $operation took ${duration.inMilliseconds}ms');
  }
}
