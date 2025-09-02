import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/features/tracking/domain/usecases/sugar_tracking_usecase.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:quit_suggar/features/tracking/data/repositories/tracking_repository_impl.dart';
import 'package:quit_suggar/features/tracking/data/datasources/tracking_storage_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/product_providers.dart';

part 'tracking_operations_provider.g.dart';

// Data sources providers
@riverpod
TrackingStorageService trackingStorageService(Ref ref) {
  return TrackingStorageService();
}

// Repository provider
@riverpod
TrackingRepository trackingRepository(Ref ref) {
  final storageService = ref.watch(trackingStorageServiceProvider);
  final apiService = ref.watch(openFoodFactsApiServiceProvider);
  return TrackingRepositoryImpl(storageService, apiService);
}

// Usecase provider
@riverpod
SugarTrackingUsecase sugarTrackingUsecase(Ref ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return SugarTrackingUsecase(repository);
}

// Core tracking operations provider
@riverpod
class SugarTracking extends _$SugarTracking {
  late SugarTrackingUsecase _usecase;

  @override
  Future<SugarTrackingUsecase> build() async {
    _usecase = ref.watch(sugarTrackingUsecaseProvider);
    await _usecase.initialize();
    AppLogger.logState(
      'SugarTracking provider initialized with Clean Architecture',
    );
    return _usecase;
  }

  /// Add a food entry from scanned product (with barcode lookup)
  Future<bool> addScannedProduct(String barcode, double portionGrams) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Scan product', {
      'barcode': barcode,
      'portion_grams': portionGrams,
    });

    final product = await usecaseState.getProductByBarcode(barcode);
    if (product != null) {
      final success = await usecaseState.addFoodEntry(product, portionGrams);
      if (success) {
        ref.invalidateSelf();
        AppLogger.logState(
          'SugarTracking state updated after adding scanned product',
        );
      }
      return success;
    }

    AppLogger.logSugarTrackingError(
      'Failed to add scanned product: Product not found for barcode $barcode',
    );
    return false;
  }

  /// Add a food entry from ProductInfo directly (more efficient for scanner)
  Future<bool> addProductEntry(ProductInfo product, double portionGrams) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Add product entry', {
      'product_name': product.name,
      'barcode': product.barcode,
      'portion_grams': portionGrams,
    });

    final success = await usecaseState.addFoodEntry(product, portionGrams);
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState(
        'SugarTracking state updated after adding product entry',
      );
    }
    return success;
  }

  /// Add a manual food entry
  Future<bool> addManualEntry(
    String foodName,
    double sugarAmount, {
    double? portionGrams,
  }) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Add manual entry', {
      'food_name': foodName,
      'sugar_amount': sugarAmount,
      'portion_grams': portionGrams,
    });

    final success = await usecaseState.addManualEntry(
      foodName,
      sugarAmount,
      portionGrams: portionGrams,
    );
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState(
        'SugarTracking state updated after adding manual entry',
      );
    }
    return success;
  }

  /// Remove a food entry
  Future<bool> removeEntry(String entryId) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Remove food entry', {'entry_id': entryId});

    final success = await usecaseState.removeEntry(entryId);
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after removing entry');
    }
    return success;
  }

  /// Edit a food entry (portion size or sugar amount)
  Future<bool> editEntry(String entryId, {
    double? portionGrams,
    double? sugarAmount,
  }) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Edit food entry', {
      'entry_id': entryId,
      'portion_grams': portionGrams,
      'sugar_amount': sugarAmount,
    });

    final success = await usecaseState.editEntry(
      entryId,
      portionGrams: portionGrams,
      sugarAmount: sugarAmount,
    );
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after editing entry');
    }
    return success;
  }

  /// Check if streak evaluation has already been performed today
  bool hasCheckedStreakToday(String today) {
    return _usecase.hasCheckedStreakToday(today);
  }

  /// Set daily sugar limit
  Future<void> setDailyLimit(double limit) async {
    final usecaseState = await future;
    AppLogger.logUserAction('Set daily limit', {'new_limit': limit});

    await usecaseState.setDailyLimit(limit);
    ref.invalidateSelf();
    AppLogger.logState('SugarTracking state updated after setting daily limit');
  }

  /// Reset today's tracking
  Future<void> resetToday() async {
    final usecaseState = await future;
    AppLogger.logUserAction('Reset daily tracking');

    await usecaseState.resetToday();
    ref.invalidateSelf();
    AppLogger.logState(
      'SugarTracking state updated after resetting daily tracking',
    );
  }

  /// Check daily streak evaluation (call when app opens)
  Future<void> checkDailyStreakEvaluation() async {
    final usecaseState = await future;
    final streakChanged = await usecaseState.checkDailyStreakEvaluation();
    if (streakChanged) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after streak evaluation');
    }
  }

  /// Get current daily summary
  DailySummary getDailySummary() {
    // For sync access, we need the usecase to be initialized
    if (_usecase.isInitialized) {
      return _usecase.getDailySummary();
    } else {
      // Return empty summary if not initialized yet
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
  }
}
