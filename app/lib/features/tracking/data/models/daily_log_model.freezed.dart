// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyLogModel {

 String get date; double get totalSugar; double get dailyLimit; double get remainingSugar; double get progressPercentage; bool get limitExceeded; bool get streakDay; int get streakCountAtEndOfDay; int get entryCount; List<String> get topFoods; String get timestamp;
/// Create a copy of DailyLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLogModelCopyWith<DailyLogModel> get copyWith => _$DailyLogModelCopyWithImpl<DailyLogModel>(this as DailyLogModel, _$identity);

  /// Serializes this DailyLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLogModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other.topFoods, topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(topFoods),timestamp);

@override
String toString() {
  return 'DailyLogModel(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $DailyLogModelCopyWith<$Res>  {
  factory $DailyLogModelCopyWith(DailyLogModel value, $Res Function(DailyLogModel) _then) = _$DailyLogModelCopyWithImpl;
@useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, String timestamp
});




}
/// @nodoc
class _$DailyLogModelCopyWithImpl<$Res>
    implements $DailyLogModelCopyWith<$Res> {
  _$DailyLogModelCopyWithImpl(this._self, this._then);

  final DailyLogModel _self;
  final $Res Function(DailyLogModel) _then;

/// Create a copy of DailyLogModel
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


/// Adds pattern-matching-related methods to [DailyLogModel].
extension DailyLogModelPatterns on DailyLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLogModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLogModel() when $default != null:
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
case _DailyLogModel() when $default != null:
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
case _DailyLogModel():
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
case _DailyLogModel() when $default != null:
return $default(_that.date,_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.limitExceeded,_that.streakDay,_that.streakCountAtEndOfDay,_that.entryCount,_that.topFoods,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyLogModel extends DailyLogModel {
  const _DailyLogModel({required this.date, required this.totalSugar, required this.dailyLimit, required this.remainingSugar, required this.progressPercentage, required this.limitExceeded, required this.streakDay, required this.streakCountAtEndOfDay, required this.entryCount, required final  List<String> topFoods, required this.timestamp}): _topFoods = topFoods,super._();
  factory _DailyLogModel.fromJson(Map<String, dynamic> json) => _$DailyLogModelFromJson(json);

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

/// Create a copy of DailyLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLogModelCopyWith<_DailyLogModel> get copyWith => __$DailyLogModelCopyWithImpl<_DailyLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLogModel&&(identical(other.date, date) || other.date == date)&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.limitExceeded, limitExceeded) || other.limitExceeded == limitExceeded)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.streakCountAtEndOfDay, streakCountAtEndOfDay) || other.streakCountAtEndOfDay == streakCountAtEndOfDay)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&const DeepCollectionEquality().equals(other._topFoods, _topFoods)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,totalSugar,dailyLimit,remainingSugar,progressPercentage,limitExceeded,streakDay,streakCountAtEndOfDay,entryCount,const DeepCollectionEquality().hash(_topFoods),timestamp);

@override
String toString() {
  return 'DailyLogModel(date: $date, totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, limitExceeded: $limitExceeded, streakDay: $streakDay, streakCountAtEndOfDay: $streakCountAtEndOfDay, entryCount: $entryCount, topFoods: $topFoods, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$DailyLogModelCopyWith<$Res> implements $DailyLogModelCopyWith<$Res> {
  factory _$DailyLogModelCopyWith(_DailyLogModel value, $Res Function(_DailyLogModel) _then) = __$DailyLogModelCopyWithImpl;
@override @useResult
$Res call({
 String date, double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, bool limitExceeded, bool streakDay, int streakCountAtEndOfDay, int entryCount, List<String> topFoods, String timestamp
});




}
/// @nodoc
class __$DailyLogModelCopyWithImpl<$Res>
    implements _$DailyLogModelCopyWith<$Res> {
  __$DailyLogModelCopyWithImpl(this._self, this._then);

  final _DailyLogModel _self;
  final $Res Function(_DailyLogModel) _then;

/// Create a copy of DailyLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? limitExceeded = null,Object? streakDay = null,Object? streakCountAtEndOfDay = null,Object? entryCount = null,Object? topFoods = null,Object? timestamp = null,}) {
  return _then(_DailyLogModel(
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
