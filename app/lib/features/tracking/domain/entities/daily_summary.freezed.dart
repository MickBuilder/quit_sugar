// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySummary {

 double get totalSugar;
  double get dailyLimit;
  double get remainingSugar;
  double get progressPercentage;
  SugarStatus get status;
  List<FoodEntry> get entries;
  String get motivationalMessage;
  int get streak;
/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySummaryCopyWith<DailySummary> get copyWith => _$DailySummaryCopyWithImpl<DailySummary>(this as DailySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySummary&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.motivationalMessage, motivationalMessage) || other.motivationalMessage == motivationalMessage)&&(identical(other.streak, streak) || other.streak == streak));
}


@override
int get hashCode => Object.hash(runtimeType,totalSugar,dailyLimit,remainingSugar,progressPercentage,status,const DeepCollectionEquality().hash(entries),motivationalMessage,streak);

@override
String toString() {
  return 'DailySummary(totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, status: $status, entries: $entries, motivationalMessage: $motivationalMessage, streak: $streak)';
}


}

/// @nodoc
abstract mixin class $DailySummaryCopyWith<$Res>  {
  factory $DailySummaryCopyWith(DailySummary value, $Res Function(DailySummary) _then) = _$DailySummaryCopyWithImpl;
@useResult
$Res call({
 double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, SugarStatus status, List<FoodEntry> entries, String motivationalMessage, int streak
});




}
/// @nodoc
class _$DailySummaryCopyWithImpl<$Res>
    implements $DailySummaryCopyWith<$Res> {
  _$DailySummaryCopyWithImpl(this._self, this._then);

  final DailySummary _self;
  final $Res Function(DailySummary) _then;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? status = null,Object? entries = null,Object? motivationalMessage = null,Object? streak = null,}) {
  return _then(_self.copyWith(
totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,remainingSugar: null == remainingSugar ? _self.remainingSugar : remainingSugar // ignore: cast_nullable_to_non_nullable
as double,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SugarStatus,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<FoodEntry>,motivationalMessage: null == motivationalMessage ? _self.motivationalMessage : motivationalMessage // ignore: cast_nullable_to_non_nullable
as String,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySummary].
extension DailySummaryPatterns on DailySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySummary value)  $default,){
final _that = this;
switch (_that) {
case _DailySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySummary value)?  $default,){
final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  SugarStatus status,  List<FoodEntry> entries,  String motivationalMessage,  int streak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
return $default(_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.status,_that.entries,_that.motivationalMessage,_that.streak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  SugarStatus status,  List<FoodEntry> entries,  String motivationalMessage,  int streak)  $default,) {final _that = this;
switch (_that) {
case _DailySummary():
return $default(_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.status,_that.entries,_that.motivationalMessage,_that.streak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSugar,  double dailyLimit,  double remainingSugar,  double progressPercentage,  SugarStatus status,  List<FoodEntry> entries,  String motivationalMessage,  int streak)?  $default,) {final _that = this;
switch (_that) {
case _DailySummary() when $default != null:
return $default(_that.totalSugar,_that.dailyLimit,_that.remainingSugar,_that.progressPercentage,_that.status,_that.entries,_that.motivationalMessage,_that.streak);case _:
  return null;

}
}

}

/// @nodoc


class _DailySummary extends DailySummary {
  const _DailySummary({required this.totalSugar, required this.dailyLimit, required this.remainingSugar, required this.progressPercentage, required this.status, required final  List<FoodEntry> entries, required this.motivationalMessage, required this.streak}): _entries = entries,super._();
  

@override final  double totalSugar;
@override final  double dailyLimit;
@override final  double remainingSugar;
@override final  double progressPercentage;
@override final  SugarStatus status;
 final  List<FoodEntry> _entries;
@override List<FoodEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  String motivationalMessage;
@override final  int streak;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySummaryCopyWith<_DailySummary> get copyWith => __$DailySummaryCopyWithImpl<_DailySummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySummary&&(identical(other.totalSugar, totalSugar) || other.totalSugar == totalSugar)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.remainingSugar, remainingSugar) || other.remainingSugar == remainingSugar)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.motivationalMessage, motivationalMessage) || other.motivationalMessage == motivationalMessage)&&(identical(other.streak, streak) || other.streak == streak));
}


@override
int get hashCode => Object.hash(runtimeType,totalSugar,dailyLimit,remainingSugar,progressPercentage,status,const DeepCollectionEquality().hash(_entries),motivationalMessage,streak);

@override
String toString() {
  return 'DailySummary(totalSugar: $totalSugar, dailyLimit: $dailyLimit, remainingSugar: $remainingSugar, progressPercentage: $progressPercentage, status: $status, entries: $entries, motivationalMessage: $motivationalMessage, streak: $streak)';
}


}

/// @nodoc
abstract mixin class _$DailySummaryCopyWith<$Res> implements $DailySummaryCopyWith<$Res> {
  factory _$DailySummaryCopyWith(_DailySummary value, $Res Function(_DailySummary) _then) = __$DailySummaryCopyWithImpl;
@override @useResult
$Res call({
 double totalSugar, double dailyLimit, double remainingSugar, double progressPercentage, SugarStatus status, List<FoodEntry> entries, String motivationalMessage, int streak
});




}
/// @nodoc
class __$DailySummaryCopyWithImpl<$Res>
    implements _$DailySummaryCopyWith<$Res> {
  __$DailySummaryCopyWithImpl(this._self, this._then);

  final _DailySummary _self;
  final $Res Function(_DailySummary) _then;

/// Create a copy of DailySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSugar = null,Object? dailyLimit = null,Object? remainingSugar = null,Object? progressPercentage = null,Object? status = null,Object? entries = null,Object? motivationalMessage = null,Object? streak = null,}) {
  return _then(_DailySummary(
totalSugar: null == totalSugar ? _self.totalSugar : totalSugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,remainingSugar: null == remainingSugar ? _self.remainingSugar : remainingSugar // ignore: cast_nullable_to_non_nullable
as double,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SugarStatus,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<FoodEntry>,motivationalMessage: null == motivationalMessage ? _self.motivationalMessage : motivationalMessage // ignore: cast_nullable_to_non_nullable
as String,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
