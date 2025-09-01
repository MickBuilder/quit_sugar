import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/data/datasources/openfoodfacts_api_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

part 'product_providers.g.dart';

// Data source provider
@riverpod
OpenFoodFactsApiService openFoodFactsApiService(Ref ref) {
  return OpenFoodFactsApiService();
}

// Product lookup provider
@riverpod
Future<ProductInfo?> productByBarcode(Ref ref, String barcode) async {
  AppLogger.logApi('Provider: Fetching product by barcode: $barcode');
  final apiService = ref.watch(openFoodFactsApiServiceProvider);
  return await apiService.getProductByBarcode(barcode);
}

// Product search provider
@riverpod
Future<List<ProductInfo>> searchProducts(Ref ref, String query) async {
  AppLogger.logApi('Provider: Searching products for query: $query');
  final apiService = ref.watch(openFoodFactsApiServiceProvider);
  return await apiService.searchProducts(query);
}
