// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sugar_alternative.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SugarAlternative {

 ProductInfo get product;// The alternative product
 double get originalSugar;// Sugar content of original product
 double get alternativeSugar;// Sugar content of alternative
 double get sugarReduction;// Grams of sugar saved
 double get sugarReductionPercent;// Percentage of sugar saved
 AlternativeRecommendationReason get reason;// Why this is recommended
 double get relevanceScore;// How relevant this alternative is (0-1)
 String get swapMessage;
/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SugarAlternativeCopyWith<SugarAlternative> get copyWith => _$SugarAlternativeCopyWithImpl<SugarAlternative>(this as SugarAlternative, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SugarAlternative&&(identical(other.product, product) || other.product == product)&&(identical(other.originalSugar, originalSugar) || other.originalSugar == originalSugar)&&(identical(other.alternativeSugar, alternativeSugar) || other.alternativeSugar == alternativeSugar)&&(identical(other.sugarReduction, sugarReduction) || other.sugarReduction == sugarReduction)&&(identical(other.sugarReductionPercent, sugarReductionPercent) || other.sugarReductionPercent == sugarReductionPercent)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore)&&(identical(other.swapMessage, swapMessage) || other.swapMessage == swapMessage));
}


@override
int get hashCode => Object.hash(runtimeType,product,originalSugar,alternativeSugar,sugarReduction,sugarReductionPercent,reason,relevanceScore,swapMessage);

@override
String toString() {
  return 'SugarAlternative(product: $product, originalSugar: $originalSugar, alternativeSugar: $alternativeSugar, sugarReduction: $sugarReduction, sugarReductionPercent: $sugarReductionPercent, reason: $reason, relevanceScore: $relevanceScore, swapMessage: $swapMessage)';
}


}

/// @nodoc
abstract mixin class $SugarAlternativeCopyWith<$Res>  {
  factory $SugarAlternativeCopyWith(SugarAlternative value, $Res Function(SugarAlternative) _then) = _$SugarAlternativeCopyWithImpl;
@useResult
$Res call({
 ProductInfo product, double originalSugar, double alternativeSugar, double sugarReduction, double sugarReductionPercent, AlternativeRecommendationReason reason, double relevanceScore, String swapMessage
});


$ProductInfoCopyWith<$Res> get product;

}
/// @nodoc
class _$SugarAlternativeCopyWithImpl<$Res>
    implements $SugarAlternativeCopyWith<$Res> {
  _$SugarAlternativeCopyWithImpl(this._self, this._then);

  final SugarAlternative _self;
  final $Res Function(SugarAlternative) _then;

/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? originalSugar = null,Object? alternativeSugar = null,Object? sugarReduction = null,Object? sugarReductionPercent = null,Object? reason = null,Object? relevanceScore = null,Object? swapMessage = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfo,originalSugar: null == originalSugar ? _self.originalSugar : originalSugar // ignore: cast_nullable_to_non_nullable
as double,alternativeSugar: null == alternativeSugar ? _self.alternativeSugar : alternativeSugar // ignore: cast_nullable_to_non_nullable
as double,sugarReduction: null == sugarReduction ? _self.sugarReduction : sugarReduction // ignore: cast_nullable_to_non_nullable
as double,sugarReductionPercent: null == sugarReductionPercent ? _self.sugarReductionPercent : sugarReductionPercent // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as AlternativeRecommendationReason,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,swapMessage: null == swapMessage ? _self.swapMessage : swapMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get product {
  
  return $ProductInfoCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [SugarAlternative].
extension SugarAlternativePatterns on SugarAlternative {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SugarAlternative value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SugarAlternative() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SugarAlternative value)  $default,){
final _that = this;
switch (_that) {
case _SugarAlternative():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SugarAlternative value)?  $default,){
final _that = this;
switch (_that) {
case _SugarAlternative() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductInfo product,  double originalSugar,  double alternativeSugar,  double sugarReduction,  double sugarReductionPercent,  AlternativeRecommendationReason reason,  double relevanceScore,  String swapMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SugarAlternative() when $default != null:
return $default(_that.product,_that.originalSugar,_that.alternativeSugar,_that.sugarReduction,_that.sugarReductionPercent,_that.reason,_that.relevanceScore,_that.swapMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductInfo product,  double originalSugar,  double alternativeSugar,  double sugarReduction,  double sugarReductionPercent,  AlternativeRecommendationReason reason,  double relevanceScore,  String swapMessage)  $default,) {final _that = this;
switch (_that) {
case _SugarAlternative():
return $default(_that.product,_that.originalSugar,_that.alternativeSugar,_that.sugarReduction,_that.sugarReductionPercent,_that.reason,_that.relevanceScore,_that.swapMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductInfo product,  double originalSugar,  double alternativeSugar,  double sugarReduction,  double sugarReductionPercent,  AlternativeRecommendationReason reason,  double relevanceScore,  String swapMessage)?  $default,) {final _that = this;
switch (_that) {
case _SugarAlternative() when $default != null:
return $default(_that.product,_that.originalSugar,_that.alternativeSugar,_that.sugarReduction,_that.sugarReductionPercent,_that.reason,_that.relevanceScore,_that.swapMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SugarAlternative extends SugarAlternative {
  const _SugarAlternative({required this.product, required this.originalSugar, required this.alternativeSugar, required this.sugarReduction, required this.sugarReductionPercent, required this.reason, required this.relevanceScore, required this.swapMessage}): super._();
  

@override final  ProductInfo product;
// The alternative product
@override final  double originalSugar;
// Sugar content of original product
@override final  double alternativeSugar;
// Sugar content of alternative
@override final  double sugarReduction;
// Grams of sugar saved
@override final  double sugarReductionPercent;
// Percentage of sugar saved
@override final  AlternativeRecommendationReason reason;
// Why this is recommended
@override final  double relevanceScore;
// How relevant this alternative is (0-1)
@override final  String swapMessage;

/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SugarAlternativeCopyWith<_SugarAlternative> get copyWith => __$SugarAlternativeCopyWithImpl<_SugarAlternative>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SugarAlternative&&(identical(other.product, product) || other.product == product)&&(identical(other.originalSugar, originalSugar) || other.originalSugar == originalSugar)&&(identical(other.alternativeSugar, alternativeSugar) || other.alternativeSugar == alternativeSugar)&&(identical(other.sugarReduction, sugarReduction) || other.sugarReduction == sugarReduction)&&(identical(other.sugarReductionPercent, sugarReductionPercent) || other.sugarReductionPercent == sugarReductionPercent)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore)&&(identical(other.swapMessage, swapMessage) || other.swapMessage == swapMessage));
}


@override
int get hashCode => Object.hash(runtimeType,product,originalSugar,alternativeSugar,sugarReduction,sugarReductionPercent,reason,relevanceScore,swapMessage);

@override
String toString() {
  return 'SugarAlternative(product: $product, originalSugar: $originalSugar, alternativeSugar: $alternativeSugar, sugarReduction: $sugarReduction, sugarReductionPercent: $sugarReductionPercent, reason: $reason, relevanceScore: $relevanceScore, swapMessage: $swapMessage)';
}


}

/// @nodoc
abstract mixin class _$SugarAlternativeCopyWith<$Res> implements $SugarAlternativeCopyWith<$Res> {
  factory _$SugarAlternativeCopyWith(_SugarAlternative value, $Res Function(_SugarAlternative) _then) = __$SugarAlternativeCopyWithImpl;
@override @useResult
$Res call({
 ProductInfo product, double originalSugar, double alternativeSugar, double sugarReduction, double sugarReductionPercent, AlternativeRecommendationReason reason, double relevanceScore, String swapMessage
});


@override $ProductInfoCopyWith<$Res> get product;

}
/// @nodoc
class __$SugarAlternativeCopyWithImpl<$Res>
    implements _$SugarAlternativeCopyWith<$Res> {
  __$SugarAlternativeCopyWithImpl(this._self, this._then);

  final _SugarAlternative _self;
  final $Res Function(_SugarAlternative) _then;

/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? originalSugar = null,Object? alternativeSugar = null,Object? sugarReduction = null,Object? sugarReductionPercent = null,Object? reason = null,Object? relevanceScore = null,Object? swapMessage = null,}) {
  return _then(_SugarAlternative(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductInfo,originalSugar: null == originalSugar ? _self.originalSugar : originalSugar // ignore: cast_nullable_to_non_nullable
as double,alternativeSugar: null == alternativeSugar ? _self.alternativeSugar : alternativeSugar // ignore: cast_nullable_to_non_nullable
as double,sugarReduction: null == sugarReduction ? _self.sugarReduction : sugarReduction // ignore: cast_nullable_to_non_nullable
as double,sugarReductionPercent: null == sugarReductionPercent ? _self.sugarReductionPercent : sugarReductionPercent // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as AlternativeRecommendationReason,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,swapMessage: null == swapMessage ? _self.swapMessage : swapMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SugarAlternative
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get product {
  
  return $ProductInfoCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

/// @nodoc
mixin _$SugarSwapRecommendation {

 ProductInfo get originalProduct; List<SugarAlternative> get alternatives; String get recommendationMessage; SugarSwapStrategy get strategy; DateTime get generatedAt;
/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SugarSwapRecommendationCopyWith<SugarSwapRecommendation> get copyWith => _$SugarSwapRecommendationCopyWithImpl<SugarSwapRecommendation>(this as SugarSwapRecommendation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SugarSwapRecommendation&&(identical(other.originalProduct, originalProduct) || other.originalProduct == originalProduct)&&const DeepCollectionEquality().equals(other.alternatives, alternatives)&&(identical(other.recommendationMessage, recommendationMessage) || other.recommendationMessage == recommendationMessage)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,originalProduct,const DeepCollectionEquality().hash(alternatives),recommendationMessage,strategy,generatedAt);

@override
String toString() {
  return 'SugarSwapRecommendation(originalProduct: $originalProduct, alternatives: $alternatives, recommendationMessage: $recommendationMessage, strategy: $strategy, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class $SugarSwapRecommendationCopyWith<$Res>  {
  factory $SugarSwapRecommendationCopyWith(SugarSwapRecommendation value, $Res Function(SugarSwapRecommendation) _then) = _$SugarSwapRecommendationCopyWithImpl;
@useResult
$Res call({
 ProductInfo originalProduct, List<SugarAlternative> alternatives, String recommendationMessage, SugarSwapStrategy strategy, DateTime generatedAt
});


$ProductInfoCopyWith<$Res> get originalProduct;

}
/// @nodoc
class _$SugarSwapRecommendationCopyWithImpl<$Res>
    implements $SugarSwapRecommendationCopyWith<$Res> {
  _$SugarSwapRecommendationCopyWithImpl(this._self, this._then);

  final SugarSwapRecommendation _self;
  final $Res Function(SugarSwapRecommendation) _then;

/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalProduct = null,Object? alternatives = null,Object? recommendationMessage = null,Object? strategy = null,Object? generatedAt = null,}) {
  return _then(_self.copyWith(
originalProduct: null == originalProduct ? _self.originalProduct : originalProduct // ignore: cast_nullable_to_non_nullable
as ProductInfo,alternatives: null == alternatives ? _self.alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<SugarAlternative>,recommendationMessage: null == recommendationMessage ? _self.recommendationMessage : recommendationMessage // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as SugarSwapStrategy,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get originalProduct {
  
  return $ProductInfoCopyWith<$Res>(_self.originalProduct, (value) {
    return _then(_self.copyWith(originalProduct: value));
  });
}
}


/// Adds pattern-matching-related methods to [SugarSwapRecommendation].
extension SugarSwapRecommendationPatterns on SugarSwapRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SugarSwapRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SugarSwapRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SugarSwapRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _SugarSwapRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SugarSwapRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _SugarSwapRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductInfo originalProduct,  List<SugarAlternative> alternatives,  String recommendationMessage,  SugarSwapStrategy strategy,  DateTime generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SugarSwapRecommendation() when $default != null:
return $default(_that.originalProduct,_that.alternatives,_that.recommendationMessage,_that.strategy,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductInfo originalProduct,  List<SugarAlternative> alternatives,  String recommendationMessage,  SugarSwapStrategy strategy,  DateTime generatedAt)  $default,) {final _that = this;
switch (_that) {
case _SugarSwapRecommendation():
return $default(_that.originalProduct,_that.alternatives,_that.recommendationMessage,_that.strategy,_that.generatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductInfo originalProduct,  List<SugarAlternative> alternatives,  String recommendationMessage,  SugarSwapStrategy strategy,  DateTime generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SugarSwapRecommendation() when $default != null:
return $default(_that.originalProduct,_that.alternatives,_that.recommendationMessage,_that.strategy,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SugarSwapRecommendation extends SugarSwapRecommendation {
  const _SugarSwapRecommendation({required this.originalProduct, required final  List<SugarAlternative> alternatives, required this.recommendationMessage, required this.strategy, required this.generatedAt}): _alternatives = alternatives,super._();
  

@override final  ProductInfo originalProduct;
 final  List<SugarAlternative> _alternatives;
@override List<SugarAlternative> get alternatives {
  if (_alternatives is EqualUnmodifiableListView) return _alternatives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternatives);
}

@override final  String recommendationMessage;
@override final  SugarSwapStrategy strategy;
@override final  DateTime generatedAt;

/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SugarSwapRecommendationCopyWith<_SugarSwapRecommendation> get copyWith => __$SugarSwapRecommendationCopyWithImpl<_SugarSwapRecommendation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SugarSwapRecommendation&&(identical(other.originalProduct, originalProduct) || other.originalProduct == originalProduct)&&const DeepCollectionEquality().equals(other._alternatives, _alternatives)&&(identical(other.recommendationMessage, recommendationMessage) || other.recommendationMessage == recommendationMessage)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,originalProduct,const DeepCollectionEquality().hash(_alternatives),recommendationMessage,strategy,generatedAt);

@override
String toString() {
  return 'SugarSwapRecommendation(originalProduct: $originalProduct, alternatives: $alternatives, recommendationMessage: $recommendationMessage, strategy: $strategy, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$SugarSwapRecommendationCopyWith<$Res> implements $SugarSwapRecommendationCopyWith<$Res> {
  factory _$SugarSwapRecommendationCopyWith(_SugarSwapRecommendation value, $Res Function(_SugarSwapRecommendation) _then) = __$SugarSwapRecommendationCopyWithImpl;
@override @useResult
$Res call({
 ProductInfo originalProduct, List<SugarAlternative> alternatives, String recommendationMessage, SugarSwapStrategy strategy, DateTime generatedAt
});


@override $ProductInfoCopyWith<$Res> get originalProduct;

}
/// @nodoc
class __$SugarSwapRecommendationCopyWithImpl<$Res>
    implements _$SugarSwapRecommendationCopyWith<$Res> {
  __$SugarSwapRecommendationCopyWithImpl(this._self, this._then);

  final _SugarSwapRecommendation _self;
  final $Res Function(_SugarSwapRecommendation) _then;

/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalProduct = null,Object? alternatives = null,Object? recommendationMessage = null,Object? strategy = null,Object? generatedAt = null,}) {
  return _then(_SugarSwapRecommendation(
originalProduct: null == originalProduct ? _self.originalProduct : originalProduct // ignore: cast_nullable_to_non_nullable
as ProductInfo,alternatives: null == alternatives ? _self._alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<SugarAlternative>,recommendationMessage: null == recommendationMessage ? _self.recommendationMessage : recommendationMessage // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as SugarSwapStrategy,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SugarSwapRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductInfoCopyWith<$Res> get originalProduct {
  
  return $ProductInfoCopyWith<$Res>(_self.originalProduct, (value) {
    return _then(_self.copyWith(originalProduct: value));
  });
}
}

// dart format on
