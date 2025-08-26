// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailySummaryHistoryModel {

 String get date; double get totalSugar; double get dailyLimit; double get remainingSugar; double get progressPercentage; bool get limitExceeded; bool get streakDay; int get streakCountAtEndOfDay; int get entryCount; List<String> get topFoods; String get timestamp;
/// Create a copy of DailySummaryHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySummaryHistoryModelCopyWith<DailySummaryHistoryModel> get copyWith => _$DailySummaryHistoryModelCopyWithImpl<DailySummaryHistoryModel>(this as DailySummaryHistoryModel, _$identity);

  /// Serializes this DailySummaryHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySummaryHistoryModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other.topFoods, topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(topFoods),timestamp);

@override
String toString() {
  return 'DailySummaryHistoryModel(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $DailySummaryHistoryModelCopyWith<$Res>  {
  factory $DailySummaryHistoryModelCopyWith(DailySummaryHistoryModel value, $Res Function(DailySummaryHistoryModel) _then) = _$DailySummaryHistoryModelCopyWithImpl;
@useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, String timestamp
});




}
/// @nodoc
class _$DailySummaryHistoryModelCopyWithImpl<$Res>
    implements $DailySummaryHistoryModelCopyWith<$Res> {
  _$DailySummaryHistoryModelCopyWithImpl(this._self, this._then);

  final DailySummaryHistoryModel _self;
  final $Res Function(DailySummaryHistoryModel) _then;

/// Create a copy of DailySummaryHistoryModel
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
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySummaryHistoryModel].
extension DailySummaryHistoryModelPatterns on DailySummaryHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySummaryHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySummaryHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySummaryHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _DailySummaryHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySummaryHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailySummaryHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySummaryHistoryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _DailySummaryHistoryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  bool limitExceeded,  bool streakDay,  int streakCountAtEndOfDay,  int entryCount,  List<String> topFoods,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _DailySummaryHistoryModel() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.limitExceeded,_that.streakDay,_that.streakCountAtEndOfDay,_that.entryCount,_that.topFoods,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailySummaryHistoryModel extends DailySummaryHistoryModel {
  const _DailySummaryHistoryModel({required this.date, required this.totalSugar, required this.dailyLimit, required this.remainingSugar, required this.progressPercentage, required this.limitExceeded, required this.streakDay, required this.streakCountAtEndOfDay, required this.entryCount, required final  List<String> topFoods, required this.timestamp}): _topFoods = topFoods,super._();
  factory _DailySummaryHistoryModel.fromJson(Map<String, dynamic> json) => _$DailySummaryHistoryModelFromJson(json);

@override final  String date;
@override final  double totalSugar;
@override final  double dailyLimit;
@override final  double remainingSugar;
@override final  double progressPercentage;
@override final  bool limitExceeded;
@override final  bool streakDay;
@override final  int streakCountAtEndOfDay;
@override final  int entryCount;
 final  List<String> _topFoods;
@override List<String> get topFoods {
  if (_topFoods is EqualUnmodifiableListView) return _topFoods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topFoods);
}

@override final  String timestamp;

/// Create a copy of DailySummaryHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySummaryHistoryModelCopyWith<_DailySummaryHistoryModel> get copyWith => __$DailySummaryHistoryModelCopyWithImpl<_DailySummaryHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailySummaryHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySummaryHistoryModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other._topFoods, _topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(_topFoods),timestamp);

@override
String toString() {
  return 'DailySummaryHistoryModel(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$DailySummaryHistoryModelCopyWith<$Res> implements $DailySummaryHistoryModelCopyWith<$Res> {
  factory _$DailySummaryHistoryModelCopyWith(_DailySummaryHistoryModel value, $Res Function(_DailySummaryHistoryModel) _then) = __$DailySummaryHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, String timestamp
});




}
/// @nodoc
class __$DailySummaryHistoryModelCopyWithImpl<$Res>
    implements _$DailySummaryHistoryModelCopyWith<$Res> {
  __$DailySummaryHistoryModelCopyWithImpl(this._self, this._then);

  final _DailySummaryHistoryModel _self;
  final $Res Function(_DailySummaryHistoryModel) _then;

/// Create a copy of DailySummaryHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? limitExceeded = null,Object? streakDay = null,Object? streakCountAtEndOfDay = null,Object? entryCount = null,Object? topFoods = null,Object? timestamp = null,}) {
  return _then(_DailySummaryHistoryModel(
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
as String,
  ));
}


}

// dart format on
