// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductInfo {

 String get barcode; String get name; String? get brand; double? get sugarPer100g; String? get imageUrl; String? get ingredients; String? get nutritionGrade; double? get weightGrams; Map<String, dynamic>? get nutriments; List<String> get categories; double get servingSize;
/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<ProductInfo> get copyWith => _$ProductInfoCopyWithImpl<ProductInfo>(this as ProductInfo, _$identity);

  /// Serializes this ProductInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInfo&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.sugarPer100g, sugarPer100g) || other.sugarPer100g == sugarPer100g)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients)&&(identical(other.nutritionGrade, nutritionGrade) || other.nutritionGrade == nutritionGrade)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&const DeepCollectionEquality().equals(other.nutriments, nutriments)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,barcode,name,brand,sugarPer100g,imageUrl,ingredients,nutritionGrade,weightGrams,const DeepCollectionEquality().hash(nutriments),const DeepCollectionEquality().hash(categories),servingSize);

@override
String toString() {
  return 'ProductInfo(barcode: $barcode, name: $name, brand: $brand, sugarPer100g: $sugarPer100g, imageUrl: $imageUrl, ingredients: $ingredients, nutritionGrade: $nutritionGrade, weightGrams: $weightGrams, nutriments: $nutriments, categories: $categories, servingSize: $servingSize)';
}


}

/// @nodoc
abstract mixin class $ProductInfoCopyWith<$Res>  {
  factory $ProductInfoCopyWith(ProductInfo value, $Res Function(ProductInfo) _then) = _$ProductInfoCopyWithImpl;
@useResult
$Res call({
 String barcode, String name, String? brand, double? sugarPer100g, String? imageUrl, String? ingredients, String? nutritionGrade, double? weightGrams, Map<String, dynamic>? nutriments, List<String> categories, double servingSize
});




}
/// @nodoc
class _$ProductInfoCopyWithImpl<$Res>
    implements $ProductInfoCopyWith<$Res> {
  _$ProductInfoCopyWithImpl(this._self, this._then);

  final ProductInfo _self;
  final $Res Function(ProductInfo) _then;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? barcode = null,Object? name = null,Object? brand = freezed,Object? sugarPer100g = freezed,Object? imageUrl = freezed,Object? ingredients = freezed,Object? nutritionGrade = freezed,Object? weightGrams = freezed,Object? nutriments = freezed,Object? categories = null,Object? servingSize = null,}) {
  return _then(_self.copyWith(
barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,sugarPer100g: freezed == sugarPer100g ? _self.sugarPer100g : sugarPer100g // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as String?,nutritionGrade: freezed == nutritionGrade ? _self.nutritionGrade : nutritionGrade // ignore: cast_nullable_to_non_nullable
as String?,weightGrams: freezed == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as double?,nutriments: freezed == nutriments ? _self.nutriments : nutriments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInfo].
extension ProductInfoPatterns on ProductInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProductInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String barcode,  String name,  String? brand,  double? sugarPer100g,  String? imageUrl,  String? ingredients,  String? nutritionGrade,  double? weightGrams,  Map<String, dynamic>? nutriments,  List<String> categories,  double servingSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
return $default(_that.barcode,_that.name,_that.brand,_that.sugarPer100g,_that.imageUrl,_that.ingredients,_that.nutritionGrade,_that.weightGrams,_that.nutriments,_that.categories,_that.servingSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String barcode,  String name,  String? brand,  double? sugarPer100g,  String? imageUrl,  String? ingredients,  String? nutritionGrade,  double? weightGrams,  Map<String, dynamic>? nutriments,  List<String> categories,  double servingSize)  $default,) {final _that = this;
switch (_that) {
case _ProductInfo():
return $default(_that.barcode,_that.name,_that.brand,_that.sugarPer100g,_that.imageUrl,_that.ingredients,_that.nutritionGrade,_that.weightGrams,_that.nutriments,_that.categories,_that.servingSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String barcode,  String name,  String? brand,  double? sugarPer100g,  String? imageUrl,  String? ingredients,  String? nutritionGrade,  double? weightGrams,  Map<String, dynamic>? nutriments,  List<String> categories,  double servingSize)?  $default,) {final _that = this;
switch (_that) {
case _ProductInfo() when $default != null:
return $default(_that.barcode,_that.name,_that.brand,_that.sugarPer100g,_that.imageUrl,_that.ingredients,_that.nutritionGrade,_that.weightGrams,_that.nutriments,_that.categories,_that.servingSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInfo extends ProductInfo {
  const _ProductInfo({required this.barcode, required this.name, this.brand, this.sugarPer100g, this.imageUrl, this.ingredients, this.nutritionGrade, this.weightGrams, final  Map<String, dynamic>? nutriments, final  List<String> categories = const [], this.servingSize = 100.0}): _nutriments = nutriments,_categories = categories,super._();
  factory _ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);

@override final  String barcode;
@override final  String name;
@override final  String? brand;
@override final  double? sugarPer100g;
@override final  String? imageUrl;
@override final  String? ingredients;
@override final  String? nutritionGrade;
@override final  double? weightGrams;
 final  Map<String, dynamic>? _nutriments;
@override Map<String, dynamic>? get nutriments {
  final value = _nutriments;
  if (value == null) return null;
  if (_nutriments is EqualUnmodifiableMapView) return _nutriments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  double servingSize;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInfoCopyWith<_ProductInfo> get copyWith => __$ProductInfoCopyWithImpl<_ProductInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInfo&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.sugarPer100g, sugarPer100g) || other.sugarPer100g == sugarPer100g)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients)&&(identical(other.nutritionGrade, nutritionGrade) || other.nutritionGrade == nutritionGrade)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&const DeepCollectionEquality().equals(other._nutriments, _nutriments)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,barcode,name,brand,sugarPer100g,imageUrl,ingredients,nutritionGrade,weightGrams,const DeepCollectionEquality().hash(_nutriments),const DeepCollectionEquality().hash(_categories),servingSize);

@override
String toString() {
  return 'ProductInfo(barcode: $barcode, name: $name, brand: $brand, sugarPer100g: $sugarPer100g, imageUrl: $imageUrl, ingredients: $ingredients, nutritionGrade: $nutritionGrade, weightGrams: $weightGrams, nutriments: $nutriments, categories: $categories, servingSize: $servingSize)';
}


}

/// @nodoc
abstract mixin class _$ProductInfoCopyWith<$Res> implements $ProductInfoCopyWith<$Res> {
  factory _$ProductInfoCopyWith(_ProductInfo value, $Res Function(_ProductInfo) _then) = __$ProductInfoCopyWithImpl;
@override @useResult
$Res call({
 String barcode, String name, String? brand, double? sugarPer100g, String? imageUrl, String? ingredients, String? nutritionGrade, double? weightGrams, Map<String, dynamic>? nutriments, List<String> categories, double servingSize
});




}
/// @nodoc
class __$ProductInfoCopyWithImpl<$Res>
    implements _$ProductInfoCopyWith<$Res> {
  __$ProductInfoCopyWithImpl(this._self, this._then);

  final _ProductInfo _self;
  final $Res Function(_ProductInfo) _then;

/// Create a copy of ProductInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? barcode = null,Object? name = null,Object? brand = freezed,Object? sugarPer100g = freezed,Object? imageUrl = freezed,Object? ingredients = freezed,Object? nutritionGrade = freezed,Object? weightGrams = freezed,Object? nutriments = freezed,Object? categories = null,Object? servingSize = null,}) {
  return _then(_ProductInfo(
barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,sugarPer100g: freezed == sugarPer100g ? _self.sugarPer100g : sugarPer100g // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as String?,nutritionGrade: freezed == nutritionGrade ? _self.nutritionGrade : nutritionGrade // ignore: cast_nullable_to_non_nullable
as String?,weightGrams: freezed == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as double?,nutriments: freezed == nutriments ? _self._nutriments : nutriments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
