// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyLog {

 DateTime get date; double get totalSugar; double get dailyLimit; List<FoodEntry> get entries; SugarStatus get status; bool get goalAchieved; int get streakDayNumber;
/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLogCopyWith<DailyLog> get copyWith => _$DailyLogCopyWithImpl<DailyLog>(this as DailyLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLog&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.status, status) || other.status == status)&&(identical(other.goalAchieved, goalAchieved) || other.goalAchieved == goalAchieved)&&(identical(other.streakDayNumber, streakDayNumber) || other.streakDayNumber == streakDayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,const DeepCollectionEquality().hash(entries),status,goalAchieved,streakDayNumber);

@override
String toString() {
  return 'DailyLog(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, entries: $entries, status: $status, goalAchieved: $goalAchieved, streakDayNumber: $streakDayNumber)';
}


}

/// @nodoc
abstract mixin class $DailyLogCopyWith<$Res>  {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) _then) = _$DailyLogCopyWithImpl;
@useResult
$Res call({
 DateTime date, double totalSugar, double dailyLimit, List<FoodEntry> entries, SugarStatus status, bool goalAchieved, int streakDayNumber
});




}
/// @nodoc
class _$DailyLogCopyWithImpl<$Res>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._self, this._then);

  final DailyLog _self;
  final $Res Function(DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? entries = null,Object? status = null,Object? goalAchieved = null,Object? streakDayNumber = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<FoodEntry>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SugarStatus,goalAchieved: null == goalAchieved ? _self.goalAchieved : goalAchieved // ignore: cast_nullable_to_non_nullable
as bool,streakDayNumber: null == streakDayNumber ? _self.streakDayNumber : streakDayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLog].
extension DailyLogPatterns on DailyLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLog value)  $default,){
final _that = this;
switch (_that) {
case _DailyLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLog value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double totalSugar,  double dailyLimit,  List<FoodEntry> entries,  SugarStatus status,  bool goalAchieved,  int streakDayNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.entries,_that.status,_that.goalAchieved,_that.streakDayNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double totalSugar,  double dailyLimit,  List<FoodEntry> entries,  SugarStatus status,  bool goalAchieved,  int streakDayNumber)  $default,) {final _that = this;
switch (_that) {
case _DailyLog():
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.entries,_that.status,_that.goalAchieved,_that.streakDayNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double totalSugar,  double dailyLimit,  List<FoodEntry> entries,  SugarStatus status,  bool goalAchieved,  int streakDayNumber)?  $default,) {final _that = this;
switch (_that) {
case _DailyLog() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.entries,_that.status,_that.goalAchieved,_that.streakDayNumber);case _:
  return null;

}
}

}

/// @nodoc


class _DailyLog extends DailyLog {
  const _DailyLog({required this.date, required this.totalSugar, required this.dailyLimit, required final  List<FoodEntry> entries, required this.status, required this.goalAchieved, required this.streakDayNumber}): _entries = entries,super._();
  

@override final  DateTime date;
@override final  double totalSugar;
@override final  double dailyLimit;
 final  List<FoodEntry> _entries;
@override List<FoodEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  SugarStatus status;
@override final  bool goalAchieved;
@override final  int streakDayNumber;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLogCopyWith<_DailyLog> get copyWith => __$DailyLogCopyWithImpl<_DailyLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLog&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.status, status) || other.status == status)&&(identical(other.goalAchieved, goalAchieved) || other.goalAchieved == goalAchieved)&&(identical(other.streakDayNumber, streakDayNumber) || other.streakDayNumber == streakDayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,const DeepCollectionEquality().hash(_entries),status,goalAchieved,streakDayNumber);

@override
String toString() {
  return 'DailyLog(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, entries: $entries, status: $status, goalAchieved: $goalAchieved, streakDayNumber: $streakDayNumber)';
}


}

/// @nodoc
abstract mixin class _$DailyLogCopyWith<$Res> implements $DailyLogCopyWith<$Res> {
  factory _$DailyLogCopyWith(_DailyLog value, $Res Function(_DailyLog) _then) = __$DailyLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double totalSugar, double dailyLimit, List<FoodEntry> entries, SugarStatus status, bool goalAchieved, int streakDayNumber
});




}
/// @nodoc
class __$DailyLogCopyWithImpl<$Res>
    implements _$DailyLogCopyWith<$Res> {
  __$DailyLogCopyWithImpl(this._self, this._then);

  final _DailyLog _self;
  final $Res Function(_DailyLog) _then;

/// Create a copy of DailyLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? entries = null,Object? status = null,Object? goalAchieved = null,Object? streakDayNumber = null,}) {
  return _then(_DailyLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<FoodEntry>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SugarStatus,goalAchieved: null == goalAchieved ? _self.goalAchieved : goalAchieved // ignore: cast_nullable_to_non_nullable
as bool,streakDayNumber: null == streakDayNumber ? _self.streakDayNumber : streakDayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
