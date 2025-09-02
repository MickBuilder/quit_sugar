// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodEntry {

 String get id; ProductInfo get product; double get portionGrams; double get sugarAmount; String? get customName; DateTime get timestamp;
/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodEntryCopyWith<FoodEntry> get copyWith => _$FoodEntryCopyWithImpl<FoodEntry>(this as FoodEntry, _$identity);

  /// Serializes this FoodEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.portionGrams, portionGrams) || other.portionGrams == portionGrams)&&(identical(other.sugarAmount, sugarAmount) || other.sugarAmount == sugarAmount)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,portionGrams,sugarAmount,customName,timestamp);

@override
String toString() {
  return 'FoodEntry(id: $id, product: $product, portionGrams: $portionGrams, sugarAmount: $sugarAmount, customName: $customName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $FoodEntryCopyWith<$Res>  {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) _then) = _$FoodEntryCopyWithImpl;
@useResult
$Res call({
 String id, ProductInfo product, double portionGrams, double sugarAmount, String? customName, DateTime timestamp
});


$ProductInfoCopyWith<$Res> get product;

}
/// @nodoc
class _$FoodEntryCopyWithImpl<$Res>
    implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._self, this._then);

  final FoodEntry _self;
  final $Res Function(FoodEntry) _then;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? portionGrams = null,Object? sugarAmount = null,Object? customName = freezed,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfo,portionGrams: null == portionGrams ? _self.portionGrams : portionGrams // ignore: cast_nullable_to_non_nullable
as double,sugarAmount: null == sugarAmount ? _self.sugarAmount : sugarAmount // ignore: cast_nullable_to_non_nullable
as double,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get product {
  
  return $ProductInfoCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodEntry].
extension FoodEntryPatterns on FoodEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodEntry value)  $default,){
final _that = this;
switch (_that) {
case _FoodEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodEntry value)?  $default,){
final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProductInfo product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProductInfo product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _FoodEntry():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProductInfo product,  double portionGrams,  double sugarAmount,  String? customName,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _FoodEntry() when $default != null:
return $default(_that.id,_that.product,_that.portionGrams,_that.sugarAmount,_that.customName,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodEntry extends FoodEntry {
  const _FoodEntry({required this.id, required this.product, required this.portionGrams, required this.sugarAmount, this.customName, required this.timestamp}): super._();
  factory _FoodEntry.fromJson(Map<String, dynamic> json) => _$FoodEntryFromJson(json);

@override final  String id;
@override final  ProductInfo product;
@override final  double portionGrams;
@override final  double sugarAmount;
@override final  String? customName;
@override final  DateTime timestamp;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodEntryCopyWith<_FoodEntry> get copyWith => __$FoodEntryCopyWithImpl<_FoodEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.portionGrams, portionGrams) || other.portionGrams == portionGrams)&&(identical(other.sugarAmount, sugarAmount) || other.sugarAmount == sugarAmount)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,portionGrams,sugarAmount,customName,timestamp);

@override
String toString() {
  return 'FoodEntry(id: $id, product: $product, portionGrams: $portionGrams, sugarAmount: $sugarAmount, customName: $customName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$FoodEntryCopyWith<$Res> implements $FoodEntryCopyWith<$Res> {
  factory _$FoodEntryCopyWith(_FoodEntry value, $Res Function(_FoodEntry) _then) = __$FoodEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, ProductInfo product, double portionGrams, double sugarAmount, String? customName, DateTime timestamp
});


@override $ProductInfoCopyWith<$Res> get product;

}
/// @nodoc
class __$FoodEntryCopyWithImpl<$Res>
    implements _$FoodEntryCopyWith<$Res> {
  __$FoodEntryCopyWithImpl(this._self, this._then);

  final _FoodEntry _self;
  final $Res Function(_FoodEntry) _then;

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? portionGrams = null,Object? sugarAmount = null,Object? customName = freezed,Object? timestamp = null,}) {
  return _then(_FoodEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfo,portionGrams: null == portionGrams ? _self.portionGrams : portionGrams // ignore: cast_nullable_to_non_nullable
as double,sugarAmount: null == sugarAmount ? _self.sugarAmount : sugarAmount // ignore: cast_nullable_to_non_nullable
as double,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of FoodEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get product {
  
  return $ProductInfoCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
