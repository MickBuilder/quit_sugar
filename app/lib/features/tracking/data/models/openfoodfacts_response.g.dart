// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openfoodfacts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenFoodFactsResponse _$OpenFoodFactsResponseFromJson(
  Map<String, dynamic> json,
) => _OpenFoodFactsResponse(
  status: (json['status'] as num).toInt(),
  statusVerbose: json['statusVerbose'] as String?,
  product: json['product'] == null
      ? null
      : ProductInfoModel.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OpenFoodFactsResponseToJson(
  _OpenFoodFactsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusVerbose': instance.statusVerbose,
  'product': instance.product,
};
