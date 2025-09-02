// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) => _FoodEntry(
  id: json['id'] as String,
  product: ProductInfo.fromJson(json['product'] as Map<String, dynamic>),
  portionGrams: (json['portionGrams'] as num).toDouble(),
  sugarAmount: (json['sugarAmount'] as num).toDouble(),
  customName: json['customName'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$FoodEntryToJson(_FoodEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'portionGrams': instance.portionGrams,
      'sugarAmount': instance.sugarAmount,
      'customName': instance.customName,
      'timestamp': instance.timestamp.toIso8601String(),
    };
