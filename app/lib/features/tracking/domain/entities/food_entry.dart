import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';

part 'food_entry.freezed.dart';

@freezed
abstract class FoodEntry with _$FoodEntry {
  const factory FoodEntry({
    required String id,
    required ProductInfo product,
    required double portionGrams,
    required double sugarAmount,
    String? customName,
    required DateTime timestamp,
  }) = _FoodEntry;

  const FoodEntry._();

  String get displayName => customName ?? product.name;
}
