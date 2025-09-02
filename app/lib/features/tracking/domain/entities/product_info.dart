import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.freezed.dart';
part 'product_info.g.dart';

@freezed
abstract class ProductInfo with _$ProductInfo {
  const factory ProductInfo({
    required String barcode,
    required String name,
    String? brand,
    double? sugarPer100g,
    String? imageUrl,
    String? ingredients,
    String? nutritionGrade,
    double? weightGrams,
    Map<String, dynamic>? nutriments,
    @Default([]) List<String> categories,
    @Default(100.0) double servingSize,
  }) = _ProductInfo;

  const ProductInfo._();

  factory ProductInfo.fromJson(Map<String, dynamic> json) => 
      _$ProductInfoFromJson(json);

  /// Calculate sugar content for a given portion size in grams
  double calculateSugarForPortion(double portionGrams) {
    if (sugarPer100g == null) return 0.0;
    return (sugarPer100g! * portionGrams) / 100.0;
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
}
