import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quit_suggar/features/tracking/data/models/product_info_model.dart';
import 'package:quit_suggar/features/tracking/data/models/openfoodfacts_response.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class OpenFoodFactsApiService {
  static const String _baseUrl = 'https://world.openfoodfacts.org/api/v0';
  static const Map<String, String> _headers = {
    'User-Agent': 'QuitSugar/1.0 (Flutter App)',
    'Accept': 'application/json',
  };

  /// Fetch product information by barcode
  Future<ProductInfo?> getProductByBarcode(String barcode) async {
    final stopwatch = Stopwatch()..start();

    try {
      AppLogger.logApi('Fetching product for barcode: $barcode');

      final response = await http.get(
        Uri.parse('$_baseUrl/product/$barcode.json'),
        headers: _headers,
      );

      stopwatch.stop();
      AppLogger.logPerformance('OpenFoodFacts API call', stopwatch.elapsed);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final apiResponse = OpenFoodFactsResponse.fromApiJson(data);

        if (apiResponse.status == 1 && apiResponse.product != null) {
          final product = apiResponse.product!.toDomain();
          AppLogger.logProductFound(barcode, product.name);

          if (product.sugarPer100g != null) {
            AppLogger.logSugarCalculation(
              product.name,
              product.sugarPer100g!,
              100.0,
              product.sugarPer100g!,
            );
          } else {
            AppLogger.logSugarTracking(
              'No sugar data found for product: ${product.name}',
            );
          }

          return product;
        } else {
          AppLogger.logProductNotFound(barcode);
          return null;
        }
      } else {
        AppLogger.logApiError(
          'HTTP Error: ${response.statusCode} for barcode: $barcode',
        );
        return null;
      }
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.logApiError(
        'Error fetching product for barcode: $barcode',
        e,
        stackTrace,
      );
      return null;
    }
  }

  /// Search products by name
  Future<List<ProductInfo>> searchProducts(String query) async {
    final stopwatch = Stopwatch()..start();

    try {
      AppLogger.logApi('Searching products for query: $query');

      final response = await http.get(
        Uri.parse(
          '$_baseUrl/search?search_terms=${Uri.encodeComponent(query)}&json=1',
        ),
        headers: _headers,
      );

      stopwatch.stop();
      AppLogger.logPerformance(
        'OpenFoodFacts search API call',
        stopwatch.elapsed,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final searchResponse = OpenFoodFactsSearchResponse.fromApiJson(data);

        final filteredProducts = searchResponse.products
            ?.where((product) => product.sugarPer100g != null)
            .map((product) => product.toDomain())
            .toList() ?? [];

        AppLogger.logApi(
          'Found ${filteredProducts.length} products with sugar data for query: $query',
        );
        return filteredProducts;
      } else {
        AppLogger.logApiError(
          'HTTP Error: ${response.statusCode} for search query: $query',
        );
        return [];
      }
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.logApiError(
        'Error searching products for query: $query',
        e,
        stackTrace,
      );
      return [];
    }
  }

  /// Check API health
  Future<bool> checkApiHealth() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/product/3017620422003.json'), // Nutella barcode
        headers: _headers,
      );

      return response.statusCode == 200;
    } catch (e, stackTrace) {
      AppLogger.logApiError('API health check failed', e, stackTrace);
      return false;
    }
  }
}
