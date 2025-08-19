import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'sugar_tracking_provider.g.dart';

@riverpod
class SugarTracking extends _$SugarTracking {
  late SugarTrackingService _service;

  @override
  SugarTrackingService build() {
    _service = SugarTrackingService();
    AppLogger.logState('SugarTracking provider initialized');
    return _service;
  }

  /// Add a food entry from scanned product
  Future<bool> addScannedProduct(String barcode, double portionGrams) async {
    AppLogger.logUserAction('Scan product', {
      'barcode': barcode,
      'portion_grams': portionGrams,
    });
    
    final product = await OpenFoodFactsService.getProductByBarcode(barcode);
    if (product != null) {
      final success = await _service.addFoodEntry(product, portionGrams);
      if (success) {
        state = _service;
        AppLogger.logState('SugarTracking state updated after adding scanned product');
      }
      return success;
    }
    
    AppLogger.logSugarTrackingError('Failed to add scanned product: Product not found for barcode $barcode');
    return false;
  }

  /// Add a manual food entry
  Future<bool> addManualEntry(String foodName, double sugarAmount, {double? portionGrams}) async {
    AppLogger.logUserAction('Add manual entry', {
      'food_name': foodName,
      'sugar_amount': sugarAmount,
      'portion_grams': portionGrams,
    });
    
    final success = await _service.addManualEntry(foodName, sugarAmount, portionGrams: portionGrams);
    if (success) {
      state = _service;
      AppLogger.logState('SugarTracking state updated after adding manual entry');
    }
    return success;
  }

  /// Remove a food entry
  bool removeEntry(String entryId) {
    AppLogger.logUserAction('Remove food entry', {'entry_id': entryId});
    
    final success = _service.removeEntry(entryId);
    if (success) {
      state = _service;
      AppLogger.logState('SugarTracking state updated after removing entry');
    }
    return success;
  }

  /// Set daily sugar limit
  void setDailyLimit(double limit) {
    AppLogger.logUserAction('Set daily limit', {'new_limit': limit});
    
    _service.setDailyLimit(limit);
    state = _service;
    AppLogger.logState('SugarTracking state updated after setting daily limit');
  }

  /// Reset today's tracking
  void resetToday() {
    AppLogger.logUserAction('Reset daily tracking');
    
    _service.resetToday();
    state = _service;
    AppLogger.logState('SugarTracking state updated after resetting daily tracking');
  }

  /// Get current daily summary
  DailySummary getDailySummary() {
    return _service.getDailySummary();
  }
}

@riverpod
Future<ProductInfo?> productByBarcode(ProductByBarcodeRef ref, String barcode) async {
  AppLogger.logApi('Provider: Fetching product by barcode: $barcode');
  return await OpenFoodFactsService.getProductByBarcode(barcode);
}

@riverpod
Future<List<ProductInfo>> searchProducts(SearchProductsRef ref, String query) async {
  AppLogger.logApi('Provider: Searching products for query: $query');
  return await OpenFoodFactsService.searchProducts(query);
}
