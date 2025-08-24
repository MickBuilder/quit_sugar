// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openfoodfacts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenFoodFactsResponse {

 int get status; String? get statusVerbose; ProductInfoModel? get product;
/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenFoodFactsResponseCopyWith<OpenFoodFactsResponse> get copyWith => _$OpenFoodFactsResponseCopyWithImpl<OpenFoodFactsResponse>(this as OpenFoodFactsResponse, _$identity);

  /// Serializes this OpenFoodFactsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenFoodFactsResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusVerbose, statusVerbose) || other.statusVerbose == statusVerbose)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusVerbose,product);

@override
String toString() {
  return 'OpenFoodFactsResponse(status: $status, statusVerbose: $statusVerbose, product: $product)';
}


}

/// @nodoc
abstract mixin class $OpenFoodFactsResponseCopyWith<$Res>  {
  factory $OpenFoodFactsResponseCopyWith(OpenFoodFactsResponse value, $Res Function(OpenFoodFactsResponse) _then) = _$OpenFoodFactsResponseCopyWithImpl;
@useResult
$Res call({
 int status, String? statusVerbose, ProductInfoModel? product
});


$ProductInfoModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$OpenFoodFactsResponseCopyWithImpl<$Res>
    implements $OpenFoodFactsResponseCopyWith<$Res> {
  _$OpenFoodFactsResponseCopyWithImpl(this._self, this._then);

  final OpenFoodFactsResponse _self;
  final $Res Function(OpenFoodFactsResponse) _then;

/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusVerbose = freezed,Object? product = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusVerbose: freezed == statusVerbose ? _self.statusVerbose : statusVerbose // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel?,
  ));
}
/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductInfoModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [OpenFoodFactsResponse].
extension OpenFoodFactsResponsePatterns on OpenFoodFactsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenFoodFactsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenFoodFactsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenFoodFactsResponse value)  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenFoodFactsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int status,  String? statusVerbose,  ProductInfoModel? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenFoodFactsResponse() when $default != null:
return $default(_that.status,_that.statusVerbose,_that.product);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int status,  String? statusVerbose,  ProductInfoModel? product)  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsResponse():
return $default(_that.status,_that.statusVerbose,_that.product);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int status,  String? statusVerbose,  ProductInfoModel? product)?  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsResponse() when $default != null:
return $default(_that.status,_that.statusVerbose,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenFoodFactsResponse implements OpenFoodFactsResponse {
  const _OpenFoodFactsResponse({required this.status, this.statusVerbose, this.product});
  factory _OpenFoodFactsResponse.fromJson(Map<String, dynamic> json) => _$OpenFoodFactsResponseFromJson(json);

@override final  int status;
@override final  String? statusVerbose;
@override final  ProductInfoModel? product;

/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenFoodFactsResponseCopyWith<_OpenFoodFactsResponse> get copyWith => __$OpenFoodFactsResponseCopyWithImpl<_OpenFoodFactsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenFoodFactsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenFoodFactsResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.statusVerbose, statusVerbose) || other.statusVerbose == statusVerbose)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,statusVerbose,product);

@override
String toString() {
  return 'OpenFoodFactsResponse(status: $status, statusVerbose: $statusVerbose, product: $product)';
}


}

/// @nodoc
abstract mixin class _$OpenFoodFactsResponseCopyWith<$Res> implements $OpenFoodFactsResponseCopyWith<$Res> {
  factory _$OpenFoodFactsResponseCopyWith(_OpenFoodFactsResponse value, $Res Function(_OpenFoodFactsResponse) _then) = __$OpenFoodFactsResponseCopyWithImpl;
@override @useResult
$Res call({
 int status, String? statusVerbose, ProductInfoModel? product
});


@override $ProductInfoModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$OpenFoodFactsResponseCopyWithImpl<$Res>
    implements _$OpenFoodFactsResponseCopyWith<$Res> {
  __$OpenFoodFactsResponseCopyWithImpl(this._self, this._then);

  final _OpenFoodFactsResponse _self;
  final $Res Function(_OpenFoodFactsResponse) _then;

/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusVerbose = freezed,Object? product = freezed,}) {
  return _then(_OpenFoodFactsResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusVerbose: freezed == statusVerbose ? _self.statusVerbose : statusVerbose // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel?,
  ));
}

/// Create a copy of OpenFoodFactsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductInfoModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$OpenFoodFactsSearchResponse {

 int get count; int get page;@JsonKey(name: 'page_count') int get pageCount;@JsonKey(name: 'page_size') int get pageSize; List<ProductInfoModel> get products;
/// Create a copy of OpenFoodFactsSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenFoodFactsSearchResponseCopyWith<OpenFoodFactsSearchResponse> get copyWith => _$OpenFoodFactsSearchResponseCopyWithImpl<OpenFoodFactsSearchResponse>(this as OpenFoodFactsSearchResponse, _$identity);

  /// Serializes this OpenFoodFactsSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenFoodFactsSearchResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,page,pageCount,pageSize,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'OpenFoodFactsSearchResponse(count: $count, page: $page, pageCount: $pageCount, pageSize: $pageSize, products: $products)';
}


}

/// @nodoc
abstract mixin class $OpenFoodFactsSearchResponseCopyWith<$Res>  {
  factory $OpenFoodFactsSearchResponseCopyWith(OpenFoodFactsSearchResponse value, $Res Function(OpenFoodFactsSearchResponse) _then) = _$OpenFoodFactsSearchResponseCopyWithImpl;
@useResult
$Res call({
 int count, int page,@JsonKey(name: 'page_count') int pageCount,@JsonKey(name: 'page_size') int pageSize, List<ProductInfoModel> products
});




}
/// @nodoc
class _$OpenFoodFactsSearchResponseCopyWithImpl<$Res>
    implements $OpenFoodFactsSearchResponseCopyWith<$Res> {
  _$OpenFoodFactsSearchResponseCopyWithImpl(this._self, this._then);

  final OpenFoodFactsSearchResponse _self;
  final $Res Function(OpenFoodFactsSearchResponse) _then;

/// Create a copy of OpenFoodFactsSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? page = null,Object? pageCount = null,Object? pageSize = null,Object? products = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenFoodFactsSearchResponse].
extension OpenFoodFactsSearchResponsePatterns on OpenFoodFactsSearchResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenFoodFactsSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenFoodFactsSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenFoodFactsSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int page, @JsonKey(name: 'page_count')  int pageCount, @JsonKey(name: 'page_size')  int pageSize,  List<ProductInfoModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse() when $default != null:
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int page, @JsonKey(name: 'page_count')  int pageCount, @JsonKey(name: 'page_size')  int pageSize,  List<ProductInfoModel> products)  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse():
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int page, @JsonKey(name: 'page_count')  int pageCount, @JsonKey(name: 'page_size')  int pageSize,  List<ProductInfoModel> products)?  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsSearchResponse() when $default != null:
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenFoodFactsSearchResponse implements OpenFoodFactsSearchResponse {
  const _OpenFoodFactsSearchResponse({required this.count, required this.page, @JsonKey(name: 'page_count') required this.pageCount, @JsonKey(name: 'page_size') required this.pageSize, required final  List<ProductInfoModel> products}): _products = products;
  factory _OpenFoodFactsSearchResponse.fromJson(Map<String, dynamic> json) => _$OpenFoodFactsSearchResponseFromJson(json);

@override final  int count;
@override final  int page;
@override@JsonKey(name: 'page_count') final  int pageCount;
@override@JsonKey(name: 'page_size') final  int pageSize;
 final  List<ProductInfoModel> _products;
@override List<ProductInfoModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of OpenFoodFactsSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenFoodFactsSearchResponseCopyWith<_OpenFoodFactsSearchResponse> get copyWith => __$OpenFoodFactsSearchResponseCopyWithImpl<_OpenFoodFactsSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenFoodFactsSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenFoodFactsSearchResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,page,pageCount,pageSize,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'OpenFoodFactsSearchResponse(count: $count, page: $page, pageCount: $pageCount, pageSize: $pageSize, products: $products)';
}


}

/// @nodoc
abstract mixin class _$OpenFoodFactsSearchResponseCopyWith<$Res> implements $OpenFoodFactsSearchResponseCopyWith<$Res> {
  factory _$OpenFoodFactsSearchResponseCopyWith(_OpenFoodFactsSearchResponse value, $Res Function(_OpenFoodFactsSearchResponse) _then) = __$OpenFoodFactsSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 int count, int page,@JsonKey(name: 'page_count') int pageCount,@JsonKey(name: 'page_size') int pageSize, List<ProductInfoModel> products
});




}
/// @nodoc
class __$OpenFoodFactsSearchResponseCopyWithImpl<$Res>
    implements _$OpenFoodFactsSearchResponseCopyWith<$Res> {
  __$OpenFoodFactsSearchResponseCopyWithImpl(this._self, this._then);

  final _OpenFoodFactsSearchResponse _self;
  final $Res Function(_OpenFoodFactsSearchResponse) _then;

/// Create a copy of OpenFoodFactsSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? page = null,Object? pageCount = null,Object? pageSize = null,Object? products = null,}) {
  return _then(_OpenFoodFactsSearchResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInfoModel>,
  ));
}


}

// dart format on
