import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'sugar_tracking_provider.g.dart';

@riverpod
class SugarTracking extends _$SugarTracking {
  late SugarTrackingService _service;

  @override
  Future<SugarTrackingService> build() async {
    _service = SugarTrackingService();
    await _service.initialize();
    AppLogger.logState('SugarTracking provider initialized with persistent storage');
    return _service;
  }

  /// Add a food entry from scanned product (with barcode lookup)
  Future<bool> addScannedProduct(String barcode, double portionGrams) async {
    final serviceState = await future;
    AppLogger.logUserAction('Scan product', {
      'barcode': barcode,
      'portion_grams': portionGrams,
    });
    
    final product = await OpenFoodFactsService.getProductByBarcode(barcode);
    if (product != null) {
      final success = await serviceState.addFoodEntry(product, portionGrams);
      if (success) {
        ref.invalidateSelf();
        AppLogger.logState('SugarTracking state updated after adding scanned product');
      }
      return success;
    }
    
    AppLogger.logSugarTrackingError('Failed to add scanned product: Product not found for barcode $barcode');
    return false;
  }

  /// Add a food entry from ProductInfo directly (more efficient for scanner)
  Future<bool> addProductEntry(ProductInfo product, double portionGrams) async {
    final serviceState = await future;
    AppLogger.logUserAction('Add product entry', {
      'product_name': product.name,
      'barcode': product.barcode,
      'portion_grams': portionGrams,
    });
    
    final success = await serviceState.addFoodEntry(product, portionGrams);
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after adding product entry');
    }
    return success;
  }

  /// Add a manual food entry
  Future<bool> addManualEntry(String foodName, double sugarAmount, {double? portionGrams}) async {
    final serviceState = await future;
    AppLogger.logUserAction('Add manual entry', {
      'food_name': foodName,
      'sugar_amount': sugarAmount,
      'portion_grams': portionGrams,
    });
    
    final success = await serviceState.addManualEntry(foodName, sugarAmount, portionGrams: portionGrams);
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after adding manual entry');
    }
    return success;
  }

  /// Remove a food entry
  Future<bool> removeEntry(String entryId) async {
    final serviceState = await future;
    AppLogger.logUserAction('Remove food entry', {'entry_id': entryId});
    
    final success = await serviceState.removeEntry(entryId);
    if (success) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after removing entry');
    }
    return success;
  }

  /// Set daily sugar limit
  Future<void> setDailyLimit(double limit) async {
    final serviceState = await future;
    AppLogger.logUserAction('Set daily limit', {'new_limit': limit});
    
    await serviceState.setDailyLimit(limit);
    ref.invalidateSelf();
    AppLogger.logState('SugarTracking state updated after setting daily limit');
  }

  /// Reset today's tracking
  Future<void> resetToday() async {
    final serviceState = await future;
    AppLogger.logUserAction('Reset daily tracking');
    
    await serviceState.resetToday();
    ref.invalidateSelf();
    AppLogger.logState('SugarTracking state updated after resetting daily tracking');
  }

  /// Check daily streak evaluation (call when app opens)
  Future<void> checkDailyStreakEvaluation() async {
    final serviceState = await future;
    final streakChanged = await serviceState.checkDailyStreakEvaluation();
    if (streakChanged) {
      ref.invalidateSelf();
      AppLogger.logState('SugarTracking state updated after streak evaluation');
    }
  }

  /// Get current daily summary
  DailySummary getDailySummary() {
    // For sync access, we need the service to be initialized
    if (_service.isInitialized) {
      return _service.getDailySummary();
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

@riverpod
Future<ProductInfo?> productByBarcode(Ref ref, String barcode) async {
  AppLogger.logApi('Provider: Fetching product by barcode: $barcode');
  return await OpenFoodFactsService.getProductByBarcode(barcode);
}

@riverpod
Future<List<ProductInfo>> searchProducts(Ref ref, String query) async {
  AppLogger.logApi('Provider: Searching products for query: $query');
  return await OpenFoodFactsService.searchProducts(query);
}
