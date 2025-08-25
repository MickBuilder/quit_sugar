import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/data/models/product_info_model.dart';

part 'openfoodfacts_response.freezed.dart';
part 'openfoodfacts_response.g.dart';

@freezed
abstract class OpenFoodFactsResponse with _$OpenFoodFactsResponse {
  const factory OpenFoodFactsResponse({
    required int status,
    String? statusVerbose,
    ProductInfoModel? product,
  }) = _OpenFoodFactsResponse;

  factory OpenFoodFactsResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsResponseFromJson(json);

  factory OpenFoodFactsResponse.fromApiJson(Map<String, dynamic> json) {
    return OpenFoodFactsResponse(
      status: json['status'] as int,
      statusVerbose: json['status_verbose'] as String?,
      product: json['product'] != null
          ? ProductInfoModel.fromOpenFoodFactsJson(
              json['product'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

@freezed
abstract class OpenFoodFactsSearchResponse with _$OpenFoodFactsSearchResponse {
  const factory OpenFoodFactsSearchResponse({
    int? count,
    int? page,
    int? pageCount,
    int? pageSize,
    List<ProductInfoModel>? products,
  }) = _OpenFoodFactsSearchResponse;

  factory OpenFoodFactsSearchResponse.fromApiJson(Map<String, dynamic> json) {
    final products =
        (json['products'] as List<dynamic>?)
            ?.map(
              (product) => ProductInfoModel.fromOpenFoodFactsJson(
                product as Map<String, dynamic>,
              ),
            )
            .toList() ??
        [];

    return OpenFoodFactsSearchResponse(
      count: json['count'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      pageCount: json['page_count'] as int? ?? 1,
      pageSize: json['page_size'] as int? ?? 20,
      products: products,
    );
  }
}
