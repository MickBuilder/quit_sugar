import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quit_suggar/core/services/logger_service.dart';

class OpenFoodFactsService {
  static const String _baseUrl = 'https://world.openfoodfacts.org/api/v0';
  
  /// Fetch product information by barcode
  static Future<ProductInfo?> getProductByBarcode(String barcode) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      AppLogger.logApi('Fetching product for barcode: $barcode');
      
      final response = await http.get(
        Uri.parse('$_baseUrl/product/$barcode.json'),
        headers: {
          'User-Agent': 'QuitSugar/1.0 (Flutter App)',
          'Accept': 'application/json',
        },
      );

      stopwatch.stop();
      AppLogger.logPerformance('OpenFoodFacts API call', stopwatch.elapsed);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['status'] == 1) {
          final product = ProductInfo.fromJson(data['product']);
          AppLogger.logProductFound(barcode, product.name);
          return product;
        } else {
          AppLogger.logProductNotFound(barcode);
          return null;
        }
      } else {
        AppLogger.logApiError('HTTP Error: ${response.statusCode} for barcode: $barcode');
        return null;
      }
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.logApiError('Error fetching product for barcode: $barcode', e, stackTrace);
      return null;
    }
  }

  /// Search products by name
  static Future<List<ProductInfo>> searchProducts(String query) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      AppLogger.logApi('Searching products for query: $query');
      
      final response = await http.get(
        Uri.parse('$_baseUrl/search?search_terms=${Uri.encodeComponent(query)}&json=1'),
        headers: {
          'User-Agent': 'QuitSugar/1.0 (Flutter App)',
          'Accept': 'application/json',
        },
      );

      stopwatch.stop();
      AppLogger.logPerformance('OpenFoodFacts search API call', stopwatch.elapsed);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final products = data['products'] as List;
        
        final filteredProducts = products
            .map((product) => ProductInfo.fromJson(product))
            .where((product) => product.sugarPer100g != null)
            .toList();
        
        AppLogger.logApi('Found ${filteredProducts.length} products with sugar data for query: $query');
        return filteredProducts;
      } else {
        AppLogger.logApiError('HTTP Error: ${response.statusCode} for search query: $query');
        return [];
      }
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.logApiError('Error searching products for query: $query', e, stackTrace);
      return [];
    }
  }
}

class ProductInfo {
  final String barcode;
  final String name;
  final String? brand;
  final double? sugarPer100g;
  final String? imageUrl;
  final String? ingredients;
  final String? nutritionGrade;
  final double? weightGrams;
  final Map<String, dynamic>? nutriments;

  ProductInfo({
    required this.barcode,
    required this.name,
    this.brand,
    this.sugarPer100g,
    this.imageUrl,
    this.ingredients,
    this.nutritionGrade,
    this.weightGrams,
    this.nutriments,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    // Extract sugar content from various possible fields
    double? sugarPer100g;
    
    // Try different possible sugar fields
    if (json['nutriments'] != null) {
      final nutriments = json['nutriments'] as Map<String, dynamic>;
      sugarPer100g = _extractSugarValue(nutriments);
    }
    
    // Fallback to direct sugar fields
    sugarPer100g ??= _extractSugarValue(json);
    
    // Extract weight information
    double? weightGrams;
    if (json['product_quantity'] != null) {
      weightGrams = _parseWeight(json['product_quantity']);
    } else if (json['quantity'] != null) {
      weightGrams = _parseWeight(json['quantity']);
    } else if (json['net_weight_value'] != null) {
      weightGrams = _parseWeight(json['net_weight_value']);
    }

    final product = ProductInfo(
      barcode: json['code'] ?? '',
      name: json['product_name'] ?? json['generic_name'] ?? 'Unknown Product',
      brand: json['brands'],
      sugarPer100g: sugarPer100g,
      imageUrl: json['image_front_url'] ?? json['image_url'],
      ingredients: json['ingredients_text'],
      nutritionGrade: json['nutrition_grade_fr'] ?? json['nutrition_grade'],
      weightGrams: weightGrams,
      nutriments: json['nutriments'],
    );

    if (sugarPer100g != null) {
      AppLogger.logSugarCalculation(product.name, sugarPer100g, 100.0, sugarPer100g);
    } else {
      AppLogger.logSugarTracking('No sugar data found for product: ${product.name}');
    }

    return product;
  }

  /// Calculate sugar content for a given portion size in grams
  double calculateSugarForPortion(double portionGrams) {
    if (sugarPer100g == null) return 0.0;
    final calculatedSugar = (sugarPer100g! * portionGrams) / 100.0;
    AppLogger.logSugarCalculation(name, sugarPer100g!, portionGrams, calculatedSugar);
    return calculatedSugar;
  }

  /// Get sugar content for common portion sizes
  Map<String, double> getCommonPortionSugar() {
    if (sugarPer100g == null) return {};
    
    return {
      '1 tsp (4g)': calculateSugarForPortion(4),
      '1 tbsp (15g)': calculateSugarForPortion(15),
      '1 cup (240g)': calculateSugarForPortion(240),
      '1 serving (30g)': calculateSugarForPortion(30),
      '1 piece (20g)': calculateSugarForPortion(20),
    };
  }

  /// Extract sugar value from various possible field names
  static double? _extractSugarValue(Map<String, dynamic> data) {
    final sugarFields = [
      'sugars_100g',
      'sugars',
      'sugar_100g',
      'sugar',
      'carbohydrates_100g',
    ];

    for (final field in sugarFields) {
      final value = data[field];
      if (value != null) {
        if (value is num) {
          return value.toDouble();
        } else if (value is String) {
          final parsed = double.tryParse(value);
          if (parsed != null) return parsed;
        }
      }
    }
    
    return null;
  }

  /// Parse weight from various string formats
  static double? _parseWeight(dynamic value) {
    if (value == null) return null;
    
    if (value is num) {
      return value.toDouble();
    }
    
    if (value is String) {
      // Remove common units and non-numeric characters
      final cleanValue = value
          .toLowerCase()
          .replaceAll(RegExp(r'[^\d.,]'), '') // Keep only digits, dots, and commas
          .replaceAll(',', '.'); // Replace comma with dot for decimal
          
      final parsed = double.tryParse(cleanValue);
      if (parsed != null) {
        // If the original string contained 'kg', convert to grams
        if (value.toLowerCase().contains('kg')) {
          return parsed * 1000;
        }
        // If the original string contained 'ml' or 'cl', treat as roughly equivalent to grams
        if (value.toLowerCase().contains('ml')) {
          return parsed;
        }
        if (value.toLowerCase().contains('cl')) {
          return parsed * 10;
        }
        // If the original string contained 'l', treat as roughly equivalent to grams * 1000
        if (value.toLowerCase().contains('l') && !value.toLowerCase().contains('ml') && !value.toLowerCase().contains('cl')) {
          return parsed * 1000;
        }
        return parsed;
      }
    }
    
    return null;
  }

  @override
  String toString() {
    return 'ProductInfo(barcode: $barcode, name: $name, sugarPer100g: $sugarPer100g, weightGrams: $weightGrams)';
  }
}
