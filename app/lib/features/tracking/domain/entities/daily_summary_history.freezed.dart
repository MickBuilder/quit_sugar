// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailySummaryHistory {

 String get date;// Format: YYYY-MM-DD
 double get totalSugar;// Total sugar consumed that day
 double get dailyLimit;// The limit for that specific day
 double get remainingSugar;// How much sugar was remaining
 double get progressPercentage;// Percentage of daily limit used
 bool get limitExceeded;// Whether the daily limit was exceeded
 bool get streakDay;// Whether this day contributed to streak
 int get streakCountAtEndOfDay;// Streak count at end of this day
 int get entryCount;// Number of food entries that day
 List<String> get topFoods;// Top 3 foods consumed (names only for storage efficiency)
 DateTime get timestamp;
/// Create a copy of DailySummaryHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySummaryHistoryCopyWith<DailySummaryHistory> get copyWith => _$DailySummaryHistoryCopyWithImpl<DailySummaryHistory>(this as DailySummaryHistory, _$identity);

  /// Serializes this DailySummaryHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySummaryHistory&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other.topFoods, topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(topFoods),timestamp);

@override
String toString() {
  return 'DailySummaryHistory(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $DailySummaryHistoryCopyWith<$Res>  {
  factory $DailySummaryHistoryCopyWith(DailySummaryHistory value, $Res Function(DailySummaryHistory) _then) = _$DailySummaryHistoryCopyWithImpl;
@useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, DateTime timestamp
});




}
/// @nodoc
class _$DailySummaryHistoryCopyWithImpl<$Res>
    implements $DailySummaryHistoryCopyWith<$Res> {
  _$DailySummaryHistoryCopyWithImpl(this._self, this._then);

  final DailySummaryHistory _self;
  final $Res Function(DailySummaryHistory) _then;

/// Create a copy of DailySummaryHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? limitExceeded = null,Object? streakDay = null,Object? streakCountAtEndOfDay = null,Object? entryCount = null,Object? topFoods = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,remainingSugar: null == remainingSugar ? _self.remainingSugar : remainingSugar // ignore: cast_nullable_to_non_nullable
as double,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,limitExceeded: null == limitExceeded ? _self.limitExceeded : limitExceeded // ignore: cast_nullable_to_non_nullable
as bool,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as bool,streakCountAtEndOfDay: null == streakCountAtEndOfDay ? _self.streakCountAtEndOfDay : streakCountAtEndOfDay // ignore: cast_nullable_to_non_nullable
as int,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,topFoods: null == topFoods ? _self.topFoods : topFoods // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySummaryHistory].
extension DailySummaryHistoryPatterns on DailySummaryHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySummaryHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySummaryHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySummaryHistory value)  $default,){
final _that = this;
switch (_that) {
case _DailySummaryHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySummaryHistory value)?  $default,){
final _that = this;
switch (_that) {
case _DailySummaryHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySummaryHistory() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.limitExceeded,_that.streakDay,_that.streakCountAtEndOfDay,_that.entryCount,_that.topFoods,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _DailySummaryHistory():
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.limitExceeded,_that.streakDay,_that.streakCountAtEndOfDay,_that.entryCount,_that.topFoods,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _DailySummaryHistory() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.limitExceeded,_that.streakDay,_that.streakCountAtEndOfDay,_that.entryCount,_that.topFoods,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailySummaryHistory extends DailySummaryHistory {
  const _DailySummaryHistory({required this.date, required this.totalSugar, required this.dailyLimit, required this.remainingSugar, required this.progressPercentage, required this.limitExceeded, required this.streakDay, required this.streakCountAtEndOfDay, required this.entryCount, required final  List<String> topFoods, required this.timestamp}): _topFoods = topFoods,super._();
  factory _DailySummaryHistory.fromJson(Map<String, dynamic> json) => _$DailySummaryHistoryFromJson(json);

@override final  String date;
// Format: YYYY-MM-DD
@override final  double totalSugar;
// Total sugar consumed that day
@override final  double dailyLimit;
// The limit for that specific day
@override final  double remainingSugar;
// How much sugar was remaining
@override final  double progressPercentage;
// Percentage of daily limit used
@override final  bool limitExceeded;
// Whether the daily limit was exceeded
@override final  bool streakDay;
// Whether this day contributed to streak
@override final  int streakCountAtEndOfDay;
// Streak count at end of this day
@override final  int entryCount;
// Number of food entries that day
 final  List<String> _topFoods;
// Number of food entries that day
@override List<String> get topFoods {
  if (_topFoods is EqualUnmodifiableListView) return _topFoods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topFoods);
}

// Top 3 foods consumed (names only for storage efficiency)
@override final  DateTime timestamp;

/// Create a copy of DailySummaryHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySummaryHistoryCopyWith<_DailySummaryHistory> get copyWith => __$DailySummaryHistoryCopyWithImpl<_DailySummaryHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailySummaryHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySummaryHistory&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other._topFoods, _topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(_topFoods),timestamp);

@override
String toString() {
  return 'DailySummaryHistory(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$DailySummaryHistoryCopyWith<$Res> implements $DailySummaryHistoryCopyWith<$Res> {
  factory _$DailySummaryHistoryCopyWith(_DailySummaryHistory value, $Res Function(_DailySummaryHistory) _then) = __$DailySummaryHistoryCopyWithImpl;
@override @useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, DateTime timestamp
});




}
/// @nodoc
class __$DailySummaryHistoryCopyWithImpl<$Res>
    implements _$DailySummaryHistoryCopyWith<$Res> {
  __$DailySummaryHistoryCopyWithImpl(this._self, this._then);

  final _DailySummaryHistory _self;
  final $Res Function(_DailySummaryHistory) _then;

/// Create a copy of DailySummaryHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? limitExceeded = null,Object? streakDay = null,Object? streakCountAtEndOfDay = null,Object? entryCount = null,Object? topFoods = null,Object? timestamp = null,}) {
  return _then(_DailySummaryHistory(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,remainingSugar: null == remainingSugar ? _self.remainingSugar : remainingSugar // ignore: cast_nullable_to_non_nullable
as double,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,limitExceeded: null == limitExceeded ? _self.limitExceeded : limitExceeded // ignore: cast_nullable_to_non_nullable
as bool,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as bool,streakCountAtEndOfDay: null == streakCountAtEndOfDay ? _self.streakCountAtEndOfDay : streakCountAtEndOfDay // ignore: cast_nullable_to_non_nullable
as int,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,topFoods: null == topFoods ? _self._topFoods : topFoods // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
