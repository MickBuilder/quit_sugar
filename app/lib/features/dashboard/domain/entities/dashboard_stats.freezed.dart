// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardStats {

 double get totalSugar; double get dailyLimit; int get currentStreak; int get totalEntries; DateTime get lastEntryTime; String get motivationalMessage;
/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStatsCopyWith<DashboardStats> get copyWith => _$DashboardStatsCopyWithImpl<DashboardStats>(this as DashboardStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStats&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.totalEntries, totalEntries) || other.totalEntries == totalEntries)&&(identical(other.lastEntryTime, lastEntryTime) || other.lastEntryTime == lastEntryTime)&&(identical(other.motivationalMessage, motivationalMessage) || other.motivationalMessage == motivationalMessage));
}


@override
int get hashCode => Object.hash(runtimeType,totalSugar,dailyLimit,currentStreak,totalEntries,lastEntryTime,motivationalMessage);

@override
String toString() {
  return 'DashboardStats(totalSugar: $totalSugar, dailyLimit: $dailyLimit, currentStreak: $currentStreak, totalEntries: $totalEntries, lastEntryTime: $lastEntryTime, motivationalMessage: $motivationalMessage)';
}


}

/// @nodoc
abstract mixin class $DashboardStatsCopyWith<$Res>  {
  factory $DashboardStatsCopyWith(DashboardStats value, $Res Function(DashboardStats) _then) = _$DashboardStatsCopyWithImpl;
@useResult
$Res call({
 double totalSugar, double dailyLimit, int currentStreak, int totalEntries, DateTime lastEntryTime, String motivationalMessage
});




}
/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._self, this._then);

  final DashboardStats _self;
  final $Res Function(DashboardStats) _then;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSugar = null,Object? dailyLimit = null,Object? currentStreak = null,Object? totalEntries = null,Object? lastEntryTime = null,Object? motivationalMessage = null,}) {
  return _then(_self.copyWith(
totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,totalEntries: null == totalEntries ? _self.totalEntries : totalEntries // ignore: cast_nullable_to_non_nullable
as int,lastEntryTime: null == lastEntryTime ? _self.lastEntryTime : lastEntryTime // ignore: cast_nullable_to_non_nullable
as DateTime,motivationalMessage: null == motivationalMessage ? _self.motivationalMessage : motivationalMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardStats].
extension DashboardStatsPatterns on DashboardStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardStats value)  $default,){
final _that = this;
switch (_that) {
case _DashboardStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardStats value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSugar,  double dailyLimit,  int currentStreak,  int totalEntries,  DateTime lastEntryTime,  String motivationalMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
return $default(_that.totalSugar,_that.dailyLimit,_that.currentStreak,_that.totalEntries,_that.lastEntryTime,_that.motivationalMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSugar,  double dailyLimit,  int currentStreak,  int totalEntries,  DateTime lastEntryTime,  String motivationalMessage)  $default,) {final _that = this;
switch (_that) {
case _DashboardStats():
return $default(_that.totalSugar,_that.dailyLimit,_that.currentStreak,_that.totalEntries,_that.lastEntryTime,_that.motivationalMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSugar,  double dailyLimit,  int currentStreak,  int totalEntries,  DateTime lastEntryTime,  String motivationalMessage)?  $default,) {final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
return $default(_that.totalSugar,_that.dailyLimit,_that.currentStreak,_that.totalEntries,_that.lastEntryTime,_that.motivationalMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardStats extends DashboardStats {
  const _DashboardStats({required this.totalSugar, required this.dailyLimit, required this.currentStreak, required this.totalEntries, required this.lastEntryTime, required this.motivationalMessage}): super._();
  

@override final  double totalSugar;
@override final  double dailyLimit;
@override final  int currentStreak;
@override final  int totalEntries;
@override final  DateTime lastEntryTime;
@override final  String motivationalMessage;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStatsCopyWith<_DashboardStats> get copyWith => __$DashboardStatsCopyWithImpl<_DashboardStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardStats&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.totalEntries, totalEntries) || other.totalEntries == totalEntries)&&(identical(other.lastEntryTime, lastEntryTime) || other.lastEntryTime == lastEntryTime)&&(identical(other.motivationalMessage, motivationalMessage) || other.motivationalMessage == motivationalMessage));
}


@override
int get hashCode => Object.hash(runtimeType,totalSugar,dailyLimit,currentStreak,totalEntries,lastEntryTime,motivationalMessage);

@override
String toString() {
  return 'DashboardStats(totalSugar: $totalSugar, dailyLimit: $dailyLimit, currentStreak: $currentStreak, totalEntries: $totalEntries, lastEntryTime: $lastEntryTime, motivationalMessage: $motivationalMessage)';
}


}

/// @nodoc
abstract mixin class _$DashboardStatsCopyWith<$Res> implements $DashboardStatsCopyWith<$Res> {
  factory _$DashboardStatsCopyWith(_DashboardStats value, $Res Function(_DashboardStats) _then) = __$DashboardStatsCopyWithImpl;
@override @useResult
$Res call({
 double totalSugar, double dailyLimit, int currentStreak, int totalEntries, DateTime lastEntryTime, String motivationalMessage
});




}
/// @nodoc
class __$DashboardStatsCopyWithImpl<$Res>
    implements _$DashboardStatsCopyWith<$Res> {
  __$DashboardStatsCopyWithImpl(this._self, this._then);

  final _DashboardStats _self;
  final $Res Function(_DashboardStats) _then;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSugar = null,Object? dailyLimit = null,Object? currentStreak = null,Object? totalEntries = null,Object? lastEntryTime = null,Object? motivationalMessage = null,}) {
  return _then(_DashboardStats(
totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,totalEntries: null == totalEntries ? _self.totalEntries : totalEntries // ignore: cast_nullable_to_non_nullable
as int,lastEntryTime: null == lastEntryTime ? _self.lastEntryTime : lastEntryTime // ignore: cast_nullable_to_non_nullable
as DateTime,motivationalMessage: null == motivationalMessage ? _self.motivationalMessage : motivationalMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
