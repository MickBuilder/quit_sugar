import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/product_providers.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/historical_data_providers.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';

/// Hook to get the current daily summary with consistent error handling
DailySummary useDailySummary(WidgetRef ref) {
  final trackingState = ref.watch(sugarTrackingProvider);
  
  return trackingState.when(
    data: (tracking) => tracking.getDailySummary(),
    loading: () => _getDefaultDailySummary(),
    error: (_, __) => _getDefaultDailySummary(),
  );
}

/// Hook to get the current daily summary asynchronously
Future<DailySummary> useDailySummaryAsync(WidgetRef ref) async {
  final trackingState = await ref.read(sugarTrackingProvider.future);
  return trackingState.getDailySummary();
}

/// Hook to check if user is over daily limit
bool useIsOverDailyLimit(WidgetRef ref) {
  final summary = useDailySummary(ref);
  return summary.totalSugar > summary.dailyLimit;
}

/// Hook to get current streak
int useCurrentStreak(WidgetRef ref) {
  final summary = useDailySummary(ref);
  return summary.streak;
}

/// Hook to get remaining sugar budget
double useRemainingBudget(WidgetRef ref) {
  final summary = useDailySummary(ref);
  return summary.remainingSugar;
}

/// Hook to get daily limit
double useDailyLimit(WidgetRef ref) {
  final summary = useDailySummary(ref);
  return summary.dailyLimit;
}

/// Hook to get onboarding completion status
Future<bool> useOnboardingCompleted(WidgetRef ref) async {
  return await ref.read(onboardingStatusProvider.future);
}

/// Hook to get onboarding data
Future<OnboardingData?> useOnboardingData(WidgetRef ref) async {
  try {
    return await ref.read(onboardingDataProvider.future);
  } catch (e) {
    return null;
  }
}

/// Hook to add food entry with consistent error handling
Future<bool> useAddFoodEntry(
  WidgetRef ref,
  String foodName,
  double sugarAmount, {
  double? portionGrams,
}) async {
  try {
    final success = await ref.read(sugarTrackingProvider.notifier).addManualEntry(
      foodName,
      sugarAmount,
      portionGrams: portionGrams,
    );
    
    if (success) {
      ref.invalidate(sugarTrackingProvider);
    }
    
    return success;
  } catch (e) {
    return false;
  }
}

/// Hook to add scanned product with consistent error handling
Future<bool> useAddScannedProduct(
  WidgetRef ref,
  String barcode,
  double portionGrams,
) async {
  try {
    final success = await ref.read(sugarTrackingProvider.notifier).addScannedProduct(
      barcode,
      portionGrams,
    );
    
    if (success) {
      ref.invalidate(sugarTrackingProvider);
    }
    
    return success;
  } catch (e) {
    return false;
  }
}

/// Hook to get product by barcode with consistent error handling
Future<ProductInfo?> useProductByBarcode(
  WidgetRef ref,
  String barcode,
) async {
  try {
    return await ref.read(productByBarcodeProvider(barcode).future);
  } catch (e) {
    return null;
  }
}

/// Hook to get historical data with consistent error handling
Future<List<DailyLog>> useHistoricalData(
  WidgetRef ref,
  String startDate,
  String endDate,
) async {
  try {
    return await ref.read(dailySummariesInRangeProvider(startDate, endDate).future);
  } catch (e) {
    return [];
  }
}

/// Hook to reset today's tracking
Future<void> useResetToday(WidgetRef ref) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).resetToday();
    ref.invalidate(sugarTrackingProvider);
  } catch (e) {
    rethrow;
  }
}

/// Hook to set daily limit
Future<void> useSetDailyLimit(WidgetRef ref, double limit) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).setDailyLimit(limit);
    ref.invalidate(sugarTrackingProvider);
  } catch (e) {
    rethrow;
  }
}

/// Hook to check daily streak evaluation
Future<void> useCheckDailyStreakEvaluation(WidgetRef ref) async {
  try {
    await ref.read(sugarTrackingProvider.notifier).checkDailyStreakEvaluation();
    ref.invalidate(sugarTrackingProvider);
  } catch (e) {
    // Silently fail for streak evaluation
  }
}

/// Hook to get recent daily summaries
Future<List<DailyLog>> useRecentDailySummaries(WidgetRef ref, int count) async {
  try {
    return await ref.read(recentDailySummariesProvider(count).future);
  } catch (e) {
    return [];
  }
}

/// Hook to get weekly progress data
Future<List<DailyLog>> useWeeklyProgress(WidgetRef ref, int weeks) async {
  try {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: weeks * 7));
    
    return await useHistoricalData(
      ref,
      startDate.toIso8601String().split('T')[0],
      endDate.toIso8601String().split('T')[0],
    );
  } catch (e) {
    return [];
  }
}

/// Hook to get monthly progress data
Future<List<DailyLog>> useMonthlyProgress(WidgetRef ref, int months) async {
  try {
    final endDate = DateTime.now();
    final startDate = DateTime(endDate.year, endDate.month - months, 1);
    
    return await useHistoricalData(
      ref,
      startDate.toIso8601String().split('T')[0],
      endDate.toIso8601String().split('T')[0],
    );
  } catch (e) {
    return [];
  }
}

/// Hook to calculate success rate from daily logs
double useSuccessRate(WidgetRef ref, List<DailyLog> logs) {
  if (logs.isEmpty) return 0.0;
  
  final successfulDays = logs.where((log) => log.goalAchieved).length;
  return (successfulDays / logs.length) * 100;
}

/// Hook to calculate average sugar consumption from daily logs
double useAverageSugarConsumption(WidgetRef ref, List<DailyLog> logs) {
  if (logs.isEmpty) return 0.0;
  
  final totalSugar = logs.fold(0.0, (sum, log) => sum + log.totalSugar);
  return totalSugar / logs.length;
}

/// Hook to get default daily summary for loading/error states
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
