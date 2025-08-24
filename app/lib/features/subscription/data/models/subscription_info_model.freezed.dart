// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionInfoModel {

 SubscriptionStatus get status; SubscriptionType? get subscriptionType; int get trialDaysRemaining; int get remainingScans; bool get hasUnlimitedScans; DateTime? get subscriptionExpiry;
/// Create a copy of SubscriptionInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionInfoModelCopyWith<SubscriptionInfoModel> get copyWith => _$SubscriptionInfoModelCopyWithImpl<SubscriptionInfoModel>(this as SubscriptionInfoModel, _$identity);

  /// Serializes this SubscriptionInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionInfoModel&&(identical(other.status, status) || other.status == status)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.trialDaysRemaining, trialDaysRemaining) || other.trialDaysRemaining == trialDaysRemaining)&&(identical(other.remainingScans, remainingScans) || other.remainingScans == remainingScans)&&(identical(other.hasUnlimitedScans, hasUnlimitedScans) || other.hasUnlimitedScans == hasUnlimitedScans)&&(identical(other.subscriptionExpiry, subscriptionExpiry) || other.subscriptionExpiry == subscriptionExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,subscriptionType,trialDaysRemaining,remainingScans,hasUnlimitedScans,subscriptionExpiry);

@override
String toString() {
  return 'SubscriptionInfoModel(status: $status, subscriptionType: $subscriptionType, trialDaysRemaining: $trialDaysRemaining, remainingScans: $remainingScans, hasUnlimitedScans: $hasUnlimitedScans, subscriptionExpiry: $subscriptionExpiry)';
}


}

/// @nodoc
abstract mixin class $SubscriptionInfoModelCopyWith<$Res>  {
  factory $SubscriptionInfoModelCopyWith(SubscriptionInfoModel value, $Res Function(SubscriptionInfoModel) _then) = _$SubscriptionInfoModelCopyWithImpl;
@useResult
$Res call({
 SubscriptionStatus status, SubscriptionType? subscriptionType, int trialDaysRemaining, int remainingScans, bool hasUnlimitedScans, DateTime? subscriptionExpiry
});




}
/// @nodoc
class _$SubscriptionInfoModelCopyWithImpl<$Res>
    implements $SubscriptionInfoModelCopyWith<$Res> {
  _$SubscriptionInfoModelCopyWithImpl(this._self, this._then);

  final SubscriptionInfoModel _self;
  final $Res Function(SubscriptionInfoModel) _then;

/// Create a copy of SubscriptionInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? subscriptionType = freezed,Object? trialDaysRemaining = null,Object? remainingScans = null,Object? hasUnlimitedScans = null,Object? subscriptionExpiry = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,subscriptionType: freezed == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as SubscriptionType?,trialDaysRemaining: null == trialDaysRemaining ? _self.trialDaysRemaining : trialDaysRemaining // ignore: cast_nullable_to_non_nullable
as int,remainingScans: null == remainingScans ? _self.remainingScans : remainingScans // ignore: cast_nullable_to_non_nullable
as int,hasUnlimitedScans: null == hasUnlimitedScans ? _self.hasUnlimitedScans : hasUnlimitedScans // ignore: cast_nullable_to_non_nullable
as bool,subscriptionExpiry: freezed == subscriptionExpiry ? _self.subscriptionExpiry : subscriptionExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionInfoModel].
extension SubscriptionInfoModelPatterns on SubscriptionInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionStatus status,  SubscriptionType? subscriptionType,  int trialDaysRemaining,  int remainingScans,  bool hasUnlimitedScans,  DateTime? subscriptionExpiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionInfoModel() when $default != null:
return $default(_that.status,_that.subscriptionType,_that.trialDaysRemaining,_that.remainingScans,_that.hasUnlimitedScans,_that.subscriptionExpiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionStatus status,  SubscriptionType? subscriptionType,  int trialDaysRemaining,  int remainingScans,  bool hasUnlimitedScans,  DateTime? subscriptionExpiry)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionInfoModel():
return $default(_that.status,_that.subscriptionType,_that.trialDaysRemaining,_that.remainingScans,_that.hasUnlimitedScans,_that.subscriptionExpiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionStatus status,  SubscriptionType? subscriptionType,  int trialDaysRemaining,  int remainingScans,  bool hasUnlimitedScans,  DateTime? subscriptionExpiry)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionInfoModel() when $default != null:
return $default(_that.status,_that.subscriptionType,_that.trialDaysRemaining,_that.remainingScans,_that.hasUnlimitedScans,_that.subscriptionExpiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionInfoModel implements SubscriptionInfoModel {
  const _SubscriptionInfoModel({required this.status, this.subscriptionType, required this.trialDaysRemaining, required this.remainingScans, required this.hasUnlimitedScans, this.subscriptionExpiry});
  factory _SubscriptionInfoModel.fromJson(Map<String, dynamic> json) => _$SubscriptionInfoModelFromJson(json);

@override final  SubscriptionStatus status;
@override final  SubscriptionType? subscriptionType;
@override final  int trialDaysRemaining;
@override final  int remainingScans;
@override final  bool hasUnlimitedScans;
@override final  DateTime? subscriptionExpiry;

/// Create a copy of SubscriptionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionInfoModelCopyWith<_SubscriptionInfoModel> get copyWith => __$SubscriptionInfoModelCopyWithImpl<_SubscriptionInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionInfoModel&&(identical(other.status, status) || other.status == status)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.trialDaysRemaining, trialDaysRemaining) || other.trialDaysRemaining == trialDaysRemaining)&&(identical(other.remainingScans, remainingScans) || other.remainingScans == remainingScans)&&(identical(other.hasUnlimitedScans, hasUnlimitedScans) || other.hasUnlimitedScans == hasUnlimitedScans)&&(identical(other.subscriptionExpiry, subscriptionExpiry) || other.subscriptionExpiry == subscriptionExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,subscriptionType,trialDaysRemaining,remainingScans,hasUnlimitedScans,subscriptionExpiry);

@override
String toString() {
  return 'SubscriptionInfoModel(status: $status, subscriptionType: $subscriptionType, trialDaysRemaining: $trialDaysRemaining, remainingScans: $remainingScans, hasUnlimitedScans: $hasUnlimitedScans, subscriptionExpiry: $subscriptionExpiry)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionInfoModelCopyWith<$Res> implements $SubscriptionInfoModelCopyWith<$Res> {
  factory _$SubscriptionInfoModelCopyWith(_SubscriptionInfoModel value, $Res Function(_SubscriptionInfoModel) _then) = __$SubscriptionInfoModelCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionStatus status, SubscriptionType? subscriptionType, int trialDaysRemaining, int remainingScans, bool hasUnlimitedScans, DateTime? subscriptionExpiry
});




}
/// @nodoc
class __$SubscriptionInfoModelCopyWithImpl<$Res>
    implements _$SubscriptionInfoModelCopyWith<$Res> {
  __$SubscriptionInfoModelCopyWithImpl(this._self, this._then);

  final _SubscriptionInfoModel _self;
  final $Res Function(_SubscriptionInfoModel) _then;

/// Create a copy of SubscriptionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? subscriptionType = freezed,Object? trialDaysRemaining = null,Object? remainingScans = null,Object? hasUnlimitedScans = null,Object? subscriptionExpiry = freezed,}) {
  return _then(_SubscriptionInfoModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,subscriptionType: freezed == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as SubscriptionType?,trialDaysRemaining: null == trialDaysRemaining ? _self.trialDaysRemaining : trialDaysRemaining // ignore: cast_nullable_to_non_nullable
as int,remainingScans: null == remainingScans ? _self.remainingScans : remainingScans // ignore: cast_nullable_to_non_nullable
as int,hasUnlimitedScans: null == hasUnlimitedScans ? _self.hasUnlimitedScans : hasUnlimitedScans // ignore: cast_nullable_to_non_nullable
as bool,subscriptionExpiry: freezed == subscriptionExpiry ? _self.subscriptionExpiry : subscriptionExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
