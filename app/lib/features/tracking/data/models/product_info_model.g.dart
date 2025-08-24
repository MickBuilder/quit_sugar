// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductInfoModel _$ProductInfoModelFromJson(Map<String, dynamic> json) =>
    _ProductInfoModel(
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      sugarPer100g: (json['sugarPer100g'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      ingredients: json['ingredients'] as String?,
      nutritionGrade: json['nutritionGrade'] as String?,
      weightGrams: (json['weightGrams'] as num?)?.toDouble(),
      nutriments: json['nutriments'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ProductInfoModelToJson(_ProductInfoModel instance) =>
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
    };
