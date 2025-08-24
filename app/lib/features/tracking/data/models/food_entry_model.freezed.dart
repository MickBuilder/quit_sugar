// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodEntryModel {

 String get id; ProductInfoModel get product; double get portionGrams; double get sugarAmount; String? get customName; DateTime get timestamp;
/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodEntryModelCopyWith<FoodEntryModel> get copyWith => _$FoodEntryModelCopyWithImpl<FoodEntryModel>(this as FoodEntryModel, _$identity);

  /// Serializes this FoodEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.portionGrams, portionGrams) || other.portionGrams == portionGrams)&&(identical(other.sugarAmount, sugarAmount) || other.sugarAmount == sugarAmount)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,portionGrams,sugarAmount,customName,timestamp);

@override
String toString() {
  return 'FoodEntryModel(id: $id, product: $product, portionGrams: $portionGrams, sugarAmount: $sugarAmount, customName: $customName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $FoodEntryModelCopyWith<$Res>  {
  factory $FoodEntryModelCopyWith(FoodEntryModel value, $Res Function(FoodEntryModel) _then) = _$FoodEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, ProductInfoModel product, double portionGrams, double sugarAmount, String? customName, DateTime timestamp
});


$ProductInfoModelCopyWith<$Res> get product;

}
/// @nodoc
class _$FoodEntryModelCopyWithImpl<$Res>
    implements $FoodEntryModelCopyWith<$Res> {
  _$FoodEntryModelCopyWithImpl(this._self, this._then);

  final FoodEntryModel _self;
  final $Res Function(FoodEntryModel) _then;

/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? portionGrams = null,Object? sugarAmount = null,Object? customName = freezed,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel,portionGrams: null == portionGrams ? _self.portionGrams : portionGrams // ignore: cast_nullable_to_non_nullable
as double,sugarAmount: null == sugarAmount ? _self.sugarAmount : sugarAmount // ignore: cast_nullable_to_non_nullable
as double,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res> get product {
  
  return $ProductInfoModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodEntryModel].
extension FoodEntryModelPatterns on FoodEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _FoodEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _FoodEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProductInfoModel product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodEntryModel() when $default != null:
return $default(_that.id,_that.product,_that.portionGrams,_that.sugarAmount,_that.customName,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProductInfoModel product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _FoodEntryModel():
return $default(_that.id,_that.product,_that.portionGrams,_that.sugarAmount,_that.customName,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProductInfoModel product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _FoodEntryModel() when $default != null:
return $default(_that.id,_that.product,_that.portionGrams,_that.sugarAmount,_that.customName,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodEntryModel implements FoodEntryModel {
  const _FoodEntryModel({required this.id, required this.product, required this.portionGrams, required this.sugarAmount, this.customName, required this.timestamp});
  factory _FoodEntryModel.fromJson(Map<String, dynamic> json) => _$FoodEntryModelFromJson(json);

@override final  String id;
@override final  ProductInfoModel product;
@override final  double portionGrams;
@override final  double sugarAmount;
@override final  String? customName;
@override final  DateTime timestamp;

/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodEntryModelCopyWith<_FoodEntryModel> get copyWith => __$FoodEntryModelCopyWithImpl<_FoodEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.portionGrams, portionGrams) || other.portionGrams == portionGrams)&&(identical(other.sugarAmount, sugarAmount) || other.sugarAmount == sugarAmount)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,portionGrams,sugarAmount,customName,timestamp);

@override
String toString() {
  return 'FoodEntryModel(id: $id, product: $product, portionGrams: $portionGrams, sugarAmount: $sugarAmount, customName: $customName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$FoodEntryModelCopyWith<$Res> implements $FoodEntryModelCopyWith<$Res> {
  factory _$FoodEntryModelCopyWith(_FoodEntryModel value, $Res Function(_FoodEntryModel) _then) = __$FoodEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ProductInfoModel product, double portionGrams, double sugarAmount, String? customName, DateTime timestamp
});


@override $ProductInfoModelCopyWith<$Res> get product;

}
/// @nodoc
class __$FoodEntryModelCopyWithImpl<$Res>
    implements _$FoodEntryModelCopyWith<$Res> {
  __$FoodEntryModelCopyWithImpl(this._self, this._then);

  final _FoodEntryModel _self;
  final $Res Function(_FoodEntryModel) _then;

/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? portionGrams = null,Object? sugarAmount = null,Object? customName = freezed,Object? timestamp = null,}) {
  return _then(_FoodEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfoModel,portionGrams: null == portionGrams ? _self.portionGrams : portionGrams // ignore: cast_nullable_to_non_nullable
as double,sugarAmount: null == sugarAmount ? _self.sugarAmount : sugarAmount // ignore: cast_nullable_to_non_nullable
as double,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of FoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<$Res> get product {
  
  return $ProductInfoModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
