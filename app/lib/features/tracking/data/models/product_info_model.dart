import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';

part 'product_info_model.freezed.dart';
part 'product_info_model.g.dart';

@freezed
abstract class ProductInfoModel with _$ProductInfoModel {
  const factory ProductInfoModel({
    required String barcode,
    required String name,
    String? brand,
    double? sugarPer100g,
    String? imageUrl,
    String? ingredients,
    String? nutritionGrade,
    double? weightGrams,
    Map<String, dynamic>? nutriments,
  }) = _ProductInfoModel;

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoModelFromJson(json);

  factory ProductInfoModel.fromOpenFoodFactsJson(Map<String, dynamic> json) {
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

    return ProductInfoModel(
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
          .replaceAll(
            RegExp(r'[^\d.,]'),
            '',
          ) // Keep only digits, dots, and commas
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
        if (value.toLowerCase().contains('l') &&
            !value.toLowerCase().contains('ml') &&
            !value.toLowerCase().contains('cl')) {
          return parsed * 1000;
        }
        return parsed;
      }
    }

    return null;
  }
}

extension ProductInfoModelExtension on ProductInfoModel {
  /// Convert data model to domain entity
  ProductInfo toDomain() {
    return ProductInfo(
      barcode: barcode,
      name: name,
      brand: brand,
      sugarPer100g: sugarPer100g,
      imageUrl: imageUrl,
      ingredients: ingredients,
      nutritionGrade: nutritionGrade,
      weightGrams: weightGrams,
      nutriments: nutriments,
    );
  }
}

extension ProductInfoDomainExtension on ProductInfo {
  /// Convert domain entity to data model
  ProductInfoModel toModel() {
    return ProductInfoModel(
      barcode: barcode,
      name: name,
      brand: brand,
      sugarPer100g: sugarPer100g,
      imageUrl: imageUrl,
      ingredients: ingredients,
      nutritionGrade: nutritionGrade,
      weightGrams: weightGrams,
      nutriments: nutriments,
    );
  }
}
