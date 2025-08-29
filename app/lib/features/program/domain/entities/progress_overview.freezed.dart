// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressOverview {

 int get totalDaysTracked; int get currentStreak; int get longestStreak; double get averageDailySugar; double get totalSugarSaved; List<WeeklyProgress> get weeklyProgress; Map<String, int> get monthlyStats;
/// Create a copy of ProgressOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressOverviewCopyWith<ProgressOverview> get copyWith => _$ProgressOverviewCopyWithImpl<ProgressOverview>(this as ProgressOverview, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressOverview&&(identical(other.totalDaysTracked, totalDaysTracked) || other.totalDaysTracked == totalDaysTracked)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.averageDailySugar, averageDailySugar) || other.averageDailySugar == averageDailySugar)&&(identical(other.totalSugarSaved, totalSugarSaved) || other.totalSugarSaved == totalSugarSaved)&&const DeepCollectionEquality().equals(other.weeklyProgress, weeklyProgress)&&const DeepCollectionEquality().equals(other.monthlyStats, monthlyStats));
}


@override
int get hashCode => Object.hash(runtimeType,totalDaysTracked,currentStreak,longestStreak,averageDailySugar,totalSugarSaved,const DeepCollectionEquality().hash(weeklyProgress),const DeepCollectionEquality().hash(monthlyStats));

@override
String toString() {
  return 'ProgressOverview(totalDaysTracked: $totalDaysTracked, currentStreak: $currentStreak, longestStreak: $longestStreak, averageDailySugar: $averageDailySugar, totalSugarSaved: $totalSugarSaved, weeklyProgress: $weeklyProgress, monthlyStats: $monthlyStats)';
}


}

/// @nodoc
abstract mixin class $ProgressOverviewCopyWith<$Res>  {
  factory $ProgressOverviewCopyWith(ProgressOverview value, $Res Function(ProgressOverview) _then) = _$ProgressOverviewCopyWithImpl;
@useResult
$Res call({
 int totalDaysTracked, int currentStreak, int longestStreak, double averageDailySugar, double totalSugarSaved, List<WeeklyProgress> weeklyProgress, Map<String, int> monthlyStats
});




}
/// @nodoc
class _$ProgressOverviewCopyWithImpl<$Res>
    implements $ProgressOverviewCopyWith<$Res> {
  _$ProgressOverviewCopyWithImpl(this._self, this._then);

  final ProgressOverview _self;
  final $Res Function(ProgressOverview) _then;

/// Create a copy of ProgressOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDaysTracked = null,Object? currentStreak = null,Object? longestStreak = null,Object? averageDailySugar = null,Object? totalSugarSaved = null,Object? weeklyProgress = null,Object? monthlyStats = null,}) {
  return _then(_self.copyWith(
totalDaysTracked: null == totalDaysTracked ? _self.totalDaysTracked : totalDaysTracked // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,averageDailySugar: null == averageDailySugar ? _self.averageDailySugar : averageDailySugar // ignore: cast_nullable_to_non_nullable
as double,totalSugarSaved: null == totalSugarSaved ? _self.totalSugarSaved : totalSugarSaved // ignore: cast_nullable_to_non_nullable
as double,weeklyProgress: null == weeklyProgress ? _self.weeklyProgress : weeklyProgress // ignore: cast_nullable_to_non_nullable
as List<WeeklyProgress>,monthlyStats: null == monthlyStats ? _self.monthlyStats : monthlyStats // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressOverview].
extension ProgressOverviewPatterns on ProgressOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressOverview value)  $default,){
final _that = this;
switch (_that) {
case _ProgressOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressOverview value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalDaysTracked,  int currentStreak,  int longestStreak,  double averageDailySugar,  double totalSugarSaved,  List<WeeklyProgress> weeklyProgress,  Map<String, int> monthlyStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressOverview() when $default != null:
return $default(_that.totalDaysTracked,_that.currentStreak,_that.longestStreak,_that.averageDailySugar,_that.totalSugarSaved,_that.weeklyProgress,_that.monthlyStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalDaysTracked,  int currentStreak,  int longestStreak,  double averageDailySugar,  double totalSugarSaved,  List<WeeklyProgress> weeklyProgress,  Map<String, int> monthlyStats)  $default,) {final _that = this;
switch (_that) {
case _ProgressOverview():
return $default(_that.totalDaysTracked,_that.currentStreak,_that.longestStreak,_that.averageDailySugar,_that.totalSugarSaved,_that.weeklyProgress,_that.monthlyStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalDaysTracked,  int currentStreak,  int longestStreak,  double averageDailySugar,  double totalSugarSaved,  List<WeeklyProgress> weeklyProgress,  Map<String, int> monthlyStats)?  $default,) {final _that = this;
switch (_that) {
case _ProgressOverview() when $default != null:
return $default(_that.totalDaysTracked,_that.currentStreak,_that.longestStreak,_that.averageDailySugar,_that.totalSugarSaved,_that.weeklyProgress,_that.monthlyStats);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressOverview extends ProgressOverview {
  const _ProgressOverview({required this.totalDaysTracked, required this.currentStreak, required this.longestStreak, required this.averageDailySugar, required this.totalSugarSaved, required final  List<WeeklyProgress> weeklyProgress, required final  Map<String, int> monthlyStats}): _weeklyProgress = weeklyProgress,_monthlyStats = monthlyStats,super._();
  

@override final  int totalDaysTracked;
@override final  int currentStreak;
@override final  int longestStreak;
@override final  double averageDailySugar;
@override final  double totalSugarSaved;
 final  List<WeeklyProgress> _weeklyProgress;
@override List<WeeklyProgress> get weeklyProgress {
  if (_weeklyProgress is EqualUnmodifiableListView) return _weeklyProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklyProgress);
}

 final  Map<String, int> _monthlyStats;
@override Map<String, int> get monthlyStats {
  if (_monthlyStats is EqualUnmodifiableMapView) return _monthlyStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_monthlyStats);
}


/// Create a copy of ProgressOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressOverviewCopyWith<_ProgressOverview> get copyWith => __$ProgressOverviewCopyWithImpl<_ProgressOverview>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressOverview&&(identical(other.totalDaysTracked, totalDaysTracked) || other.totalDaysTracked == totalDaysTracked)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.averageDailySugar, averageDailySugar) || other.averageDailySugar == averageDailySugar)&&(identical(other.totalSugarSaved, totalSugarSaved) || other.totalSugarSaved == totalSugarSaved)&&const DeepCollectionEquality().equals(other._weeklyProgress, _weeklyProgress)&&const DeepCollectionEquality().equals(other._monthlyStats, _monthlyStats));
}


@override
int get hashCode => Object.hash(runtimeType,totalDaysTracked,currentStreak,longestStreak,averageDailySugar,totalSugarSaved,const DeepCollectionEquality().hash(_weeklyProgress),const DeepCollectionEquality().hash(_monthlyStats));

@override
String toString() {
  return 'ProgressOverview(totalDaysTracked: $totalDaysTracked, currentStreak: $currentStreak, longestStreak: $longestStreak, averageDailySugar: $averageDailySugar, totalSugarSaved: $totalSugarSaved, weeklyProgress: $weeklyProgress, monthlyStats: $monthlyStats)';
}


}

/// @nodoc
abstract mixin class _$ProgressOverviewCopyWith<$Res> implements $ProgressOverviewCopyWith<$Res> {
  factory _$ProgressOverviewCopyWith(_ProgressOverview value, $Res Function(_ProgressOverview) _then) = __$ProgressOverviewCopyWithImpl;
@override @useResult
$Res call({
 int totalDaysTracked, int currentStreak, int longestStreak, double averageDailySugar, double totalSugarSaved, List<WeeklyProgress> weeklyProgress, Map<String, int> monthlyStats
});




}
/// @nodoc
class __$ProgressOverviewCopyWithImpl<$Res>
    implements _$ProgressOverviewCopyWith<$Res> {
  __$ProgressOverviewCopyWithImpl(this._self, this._then);

  final _ProgressOverview _self;
  final $Res Function(_ProgressOverview) _then;

/// Create a copy of ProgressOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDaysTracked = null,Object? currentStreak = null,Object? longestStreak = null,Object? averageDailySugar = null,Object? totalSugarSaved = null,Object? weeklyProgress = null,Object? monthlyStats = null,}) {
  return _then(_ProgressOverview(
totalDaysTracked: null == totalDaysTracked ? _self.totalDaysTracked : totalDaysTracked // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,averageDailySugar: null == averageDailySugar ? _self.averageDailySugar : averageDailySugar // ignore: cast_nullable_to_non_nullable
as double,totalSugarSaved: null == totalSugarSaved ? _self.totalSugarSaved : totalSugarSaved // ignore: cast_nullable_to_non_nullable
as double,weeklyProgress: null == weeklyProgress ? _self._weeklyProgress : weeklyProgress // ignore: cast_nullable_to_non_nullable
as List<WeeklyProgress>,monthlyStats: null == monthlyStats ? _self._monthlyStats : monthlyStats // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

/// @nodoc
mixin _$WeeklyProgress {

 DateTime get weekStart; DateTime get weekEnd; double get averageDailySugar; int get successfulDays; int get totalDays;
/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyProgressCopyWith<WeeklyProgress> get copyWith => _$WeeklyProgressCopyWithImpl<WeeklyProgress>(this as WeeklyProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyProgress&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&(identical(other.averageDailySugar, averageDailySugar) || other.averageDailySugar == averageDailySugar)&&(identical(other.successfulDays, successfulDays) || other.successfulDays == successfulDays)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,averageDailySugar,successfulDays,totalDays);

@override
String toString() {
  return 'WeeklyProgress(weekStart: $weekStart, weekEnd: $weekEnd, averageDailySugar: $averageDailySugar, successfulDays: $successfulDays, totalDays: $totalDays)';
}


}

/// @nodoc
abstract mixin class $WeeklyProgressCopyWith<$Res>  {
  factory $WeeklyProgressCopyWith(WeeklyProgress value, $Res Function(WeeklyProgress) _then) = _$WeeklyProgressCopyWithImpl;
@useResult
$Res call({
 DateTime weekStart, DateTime weekEnd, double averageDailySugar, int successfulDays, int totalDays
});




}
/// @nodoc
class _$WeeklyProgressCopyWithImpl<$Res>
    implements $WeeklyProgressCopyWith<$Res> {
  _$WeeklyProgressCopyWithImpl(this._self, this._then);

  final WeeklyProgress _self;
  final $Res Function(WeeklyProgress) _then;

/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekStart = null,Object? weekEnd = null,Object? averageDailySugar = null,Object? successfulDays = null,Object? totalDays = null,}) {
  return _then(_self.copyWith(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as DateTime,averageDailySugar: null == averageDailySugar ? _self.averageDailySugar : averageDailySugar // ignore: cast_nullable_to_non_nullable
as double,successfulDays: null == successfulDays ? _self.successfulDays : successfulDays // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyProgress].
extension WeeklyProgressPatterns on WeeklyProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyProgress value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyProgress value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime weekEnd,  double averageDailySugar,  int successfulDays,  int totalDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.averageDailySugar,_that.successfulDays,_that.totalDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime weekEnd,  double averageDailySugar,  int successfulDays,  int totalDays)  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress():
return $default(_that.weekStart,_that.weekEnd,_that.averageDailySugar,_that.successfulDays,_that.totalDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime weekStart,  DateTime weekEnd,  double averageDailySugar,  int successfulDays,  int totalDays)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyProgress() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.averageDailySugar,_that.successfulDays,_that.totalDays);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyProgress extends WeeklyProgress {
  const _WeeklyProgress({required this.weekStart, required this.weekEnd, required this.averageDailySugar, required this.successfulDays, required this.totalDays}): super._();
  

@override final  DateTime weekStart;
@override final  DateTime weekEnd;
@override final  double averageDailySugar;
@override final  int successfulDays;
@override final  int totalDays;

/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyProgressCopyWith<_WeeklyProgress> get copyWith => __$WeeklyProgressCopyWithImpl<_WeeklyProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyProgress&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&(identical(other.averageDailySugar, averageDailySugar) || other.averageDailySugar == averageDailySugar)&&(identical(other.successfulDays, successfulDays) || other.successfulDays == successfulDays)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,averageDailySugar,successfulDays,totalDays);

@override
String toString() {
  return 'WeeklyProgress(weekStart: $weekStart, weekEnd: $weekEnd, averageDailySugar: $averageDailySugar, successfulDays: $successfulDays, totalDays: $totalDays)';
}


}

/// @nodoc
abstract mixin class _$WeeklyProgressCopyWith<$Res> implements $WeeklyProgressCopyWith<$Res> {
  factory _$WeeklyProgressCopyWith(_WeeklyProgress value, $Res Function(_WeeklyProgress) _then) = __$WeeklyProgressCopyWithImpl;
@override @useResult
$Res call({
 DateTime weekStart, DateTime weekEnd, double averageDailySugar, int successfulDays, int totalDays
});




}
/// @nodoc
class __$WeeklyProgressCopyWithImpl<$Res>
    implements _$WeeklyProgressCopyWith<$Res> {
  __$WeeklyProgressCopyWithImpl(this._self, this._then);

  final _WeeklyProgress _self;
  final $Res Function(_WeeklyProgress) _then;

/// Create a copy of WeeklyProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekStart = null,Object? weekEnd = null,Object? averageDailySugar = null,Object? successfulDays = null,Object? totalDays = null,}) {
  return _then(_WeeklyProgress(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as DateTime,averageDailySugar: null == averageDailySugar ? _self.averageDailySugar : averageDailySugar // ignore: cast_nullable_to_non_nullable
as double,successfulDays: null == successfulDays ? _self.successfulDays : successfulDays // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
