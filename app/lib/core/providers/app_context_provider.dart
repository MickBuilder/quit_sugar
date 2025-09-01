import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/product_providers.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'app_context_provider.g.dart';

/// Global app context provider that centralizes all app state
/// This provides a single source of truth for all app-wide state
@riverpod
Future<AppContextState> appContext(Ref ref) async {
  AppLogger.logState('AppContext provider initialized');
  
  // Initialize core services
  await _initializeCoreServices(ref);
  
  return AppContextState(
    isInitialized: true,
    lastUpdate: DateTime.now(),
  );
}

/// Initialize core services and dependencies
Future<void> _initializeCoreServices(Ref ref) async {
  try {
    // Pre-warm critical providers
    await ref.read(sugarTrackingProvider.future);
    await ref.read(onboardingStatusProvider.future);
    
    AppLogger.logState('Core services initialized successfully');
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to initialize core services', e, stackTrace);
    rethrow;
  }
}

/// Get current daily summary (synchronous access)
DailySummary getDailySummary(Ref ref) {
  final trackingState = ref.read(sugarTrackingProvider);
  return trackingState.when(
    data: (tracking) => tracking.getDailySummary(),
    loading: () => _getDefaultDailySummary(),
    error: (_, __) => _getDefaultDailySummary(),
  );
}

/// Get current daily summary (asynchronous access)
Future<DailySummary> getDailySummaryAsync(Ref ref) async {
  final trackingState = await ref.read(sugarTrackingProvider.future);
  return trackingState.getDailySummary();
}

/// Check if user is currently over daily limit
bool isOverDailyLimit(Ref ref) {
  final summary = getDailySummary(ref);
  return summary.totalSugar > summary.dailyLimit;
}

/// Get current streak
int getCurrentStreak(Ref ref) {
  final summary = getDailySummary(ref);
  return summary.streak;
}

/// Get remaining sugar budget
double getRemainingBudget(Ref ref) {
  final summary = getDailySummary(ref);
  return summary.remainingSugar;
}

/// Get daily limit
double getDailyLimit(Ref ref) {
  final summary = getDailySummary(ref);
  return summary.dailyLimit;
}

/// Check if onboarding is completed
Future<bool> isOnboardingCompleted(Ref ref) async {
  return await ref.read(onboardingStatusProvider.future);
}

/// Get onboarding data
Future<OnboardingData?> getOnboardingData(Ref ref) async {
  try {
    return await ref.read(onboardingDataProvider.future);
  } catch (e) {
    AppLogger.logSugarTrackingError('Failed to get onboarding data', e);
    return null;
  }
}

/// Add food entry with consistent error handling
Future<bool> addFoodEntry(Ref ref, String foodName, double sugarAmount, {double? portionGrams}) async {
  try {
    final success = await ref.read(sugarTrackingProvider.notifier).addManualEntry(
      foodName,
      sugarAmount,
      portionGrams: portionGrams,
    );
    
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Food entry added successfully via AppContext');
    }
    
    return success;
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to add food entry via AppContext', e, stackTrace);
    return false;
  }
}

/// Add scanned product with consistent error handling
Future<bool> addScannedProduct(Ref ref, String barcode, double portionGrams) async {
  try {
    final success = await ref.read(sugarTrackingProvider.notifier).addScannedProduct(
      barcode,
      portionGrams,
    );
    
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('Scanned product added successfully via AppContext');
    }
    
    return success;
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to add scanned product via AppContext', e, stackTrace);
    return false;
  }
}

/// Get product by barcode with consistent error handling
Future<ProductInfo?> getProductByBarcode(Ref ref, String barcode) async {
  try {
    return await ref.read(productByBarcodeProvider(barcode).future);
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to get product by barcode via AppContext', e, stackTrace);
    return null;
  }
}

/// Get historical data with consistent error handling
Future<List<DailyLog>> getHistoricalData(Ref ref, String startDate, String endDate) async {
  try {
    return await ref.read(dailySummariesInRangeProvider(startDate, endDate).future);
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to get historical data via AppContext', e, stackTrace);
    return [];
  }
}

/// Reset today's tracking
Future<void> resetToday(Ref ref) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).resetToday();
    ref.invalidate(appContextProvider);
    AppLogger.logState('Today reset successfully via AppContext');
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to reset today via AppContext', e, stackTrace);
    rethrow;
  }
}

/// Set daily limit
Future<void> setDailyLimit(Ref ref, double limit) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).setDailyLimit(limit);
    ref.invalidate(appContextProvider);
    AppLogger.logState('Daily limit set successfully via AppContext');
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to set daily limit via AppContext', e, stackTrace);
    rethrow;
  }
}

/// Check daily streak evaluation
Future<void> checkDailyStreakEvaluation(Ref ref) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).checkDailyStreakEvaluation();
    ref.invalidate(appContextProvider);
  } catch (e, stackTrace) {
    AppLogger.logSugarTrackingError('Failed to check daily streak evaluation via AppContext', e, stackTrace);
  }
}

/// Get default daily summary for loading/error states
DailySummary _getDefaultDailySummary() {
  return DailySummary(
    totalSugar: 0.0,
    dailyLimit: 25.0,
    remainingSugar: 25.0,
    progressPercentage: 0.0,
    status: SugarStatus.green,
    entries: [],
    motivationalMessage: "Loading your daily progress...",
    streak: 0,
  );
}

/// Immutable state class for app context
class AppContextState {
  final bool isInitialized;
  final DateTime lastUpdate;

  const AppContextState({
    required this.isInitialized,
    required this.lastUpdate,
  });

  AppContextState copyWith({
    bool? isInitialized,
    DateTime? lastUpdate,
  }) {
    return AppContextState(
      isInitialized: isInitialized ?? this.isInitialized,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
