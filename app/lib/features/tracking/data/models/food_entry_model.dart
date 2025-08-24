import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/data/models/product_info_model.dart';

part 'food_entry_model.freezed.dart';
part 'food_entry_model.g.dart';

@freezed
abstract class FoodEntryModel with _$FoodEntryModel {
  const factory FoodEntryModel({
    required String id,
    required ProductInfoModel product,
    required double portionGrams,
    required double sugarAmount,
    String? customName,
    required DateTime timestamp,
  }) = _FoodEntryModel;

  factory FoodEntryModel.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryModelFromJson(json);
}

extension FoodEntryModelExtension on FoodEntryModel {
  /// Convert data model to domain entity
  FoodEntry toDomain() {
    return FoodEntry(
      id: id,
      product: product.toDomain(),
      portionGrams: portionGrams,
      sugarAmount: sugarAmount,
      customName: customName,
      timestamp: timestamp,
    );
  }
}

extension FoodEntryDomainExtension on FoodEntry {
  /// Convert domain entity to data model
  FoodEntryModel toModel() {
    return FoodEntryModel(
      id: id,
      product: product.toModel(),
      portionGrams: portionGrams,
      sugarAmount: sugarAmount,
      customName: customName,
      timestamp: timestamp,
    );
  }
}
