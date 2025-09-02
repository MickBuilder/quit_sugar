// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => _ProductInfo(
  barcode: json['barcode'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String?,
  sugarPer100g: (json['sugarPer100g'] as num?)?.toDouble(),
  imageUrl: json['imageUrl'] as String?,
  ingredients: json['ingredients'] as String?,
  nutritionGrade: json['nutritionGrade'] as String?,
  weightGrams: (json['weightGrams'] as num?)?.toDouble(),
  nutriments: json['nutriments'] as Map<String, dynamic>?,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  servingSize: (json['servingSize'] as num?)?.toDouble() ?? 100.0,
);

Map<String, dynamic> _$ProductInfoToJson(_ProductInfo instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'sugarPer100g': instance.sugarPer100g,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'nutritionGrade': instance.nutritionGrade,
      'weightGrams': instance.weightGrams,
      'nutriments': instance.nutriments,
      'categories': instance.categories,
      'servingSize': instance.servingSize,
    };
