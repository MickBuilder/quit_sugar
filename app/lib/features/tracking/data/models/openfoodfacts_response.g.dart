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

_OpenFoodFactsSearchResponse _$OpenFoodFactsSearchResponseFromJson(
  Map<String, dynamic> json,
) => _OpenFoodFactsSearchResponse(
  count: (json['count'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageCount: (json['page_count'] as num).toInt(),
  pageSize: (json['page_size'] as num).toInt(),
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductInfoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OpenFoodFactsSearchResponseToJson(
  _OpenFoodFactsSearchResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'page': instance.page,
  'page_count': instance.pageCount,
  'page_size': instance.pageSize,
  'products': instance.products,
};
