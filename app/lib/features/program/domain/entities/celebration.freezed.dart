// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'celebration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Celebration {

 CelebrationType get type; int get day; int get week; ProgramPhase get phase; String get title; String get message; String get badge; List<String> get achievements;
/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CelebrationCopyWith<Celebration> get copyWith => _$CelebrationCopyWithImpl<Celebration>(this as Celebration, _$identity);

  /// Serializes this Celebration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Celebration&&(identical(other.type, type) || other.type == type)&&(identical(other.day, day) || other.day == day)&&(identical(other.week, week) || other.week == week)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.badge, badge) || other.badge == badge)&&const DeepCollectionEquality().equals(other.achievements, achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,day,week,phase,title,message,badge,const DeepCollectionEquality().hash(achievements));

@override
String toString() {
  return 'Celebration(type: $type, day: $day, week: $week, phase: $phase, title: $title, message: $message, badge: $badge, achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class $CelebrationCopyWith<$Res>  {
  factory $CelebrationCopyWith(Celebration value, $Res Function(Celebration) _then) = _$CelebrationCopyWithImpl;
@useResult
$Res call({
 CelebrationType type, int day, int week, ProgramPhase phase, String title, String message, String badge, List<String> achievements
});




}
/// @nodoc
class _$CelebrationCopyWithImpl<$Res>
    implements $CelebrationCopyWith<$Res> {
  _$CelebrationCopyWithImpl(this._self, this._then);

  final Celebration _self;
  final $Res Function(Celebration) _then;

/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? day = null,Object? week = null,Object? phase = null,Object? title = null,Object? message = null,Object? badge = null,Object? achievements = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CelebrationType,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ProgramPhase,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Celebration].
extension CelebrationPatterns on Celebration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Celebration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Celebration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Celebration value)  $default,){
final _that = this;
switch (_that) {
case _Celebration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Celebration value)?  $default,){
final _that = this;
switch (_that) {
case _Celebration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CelebrationType type,  int day,  int week,  ProgramPhase phase,  String title,  String message,  String badge,  List<String> achievements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Celebration() when $default != null:
return $default(_that.type,_that.day,_that.week,_that.phase,_that.title,_that.message,_that.badge,_that.achievements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CelebrationType type,  int day,  int week,  ProgramPhase phase,  String title,  String message,  String badge,  List<String> achievements)  $default,) {final _that = this;
switch (_that) {
case _Celebration():
return $default(_that.type,_that.day,_that.week,_that.phase,_that.title,_that.message,_that.badge,_that.achievements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CelebrationType type,  int day,  int week,  ProgramPhase phase,  String title,  String message,  String badge,  List<String> achievements)?  $default,) {final _that = this;
switch (_that) {
case _Celebration() when $default != null:
return $default(_that.type,_that.day,_that.week,_that.phase,_that.title,_that.message,_that.badge,_that.achievements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Celebration implements Celebration {
  const _Celebration({required this.type, required this.day, required this.week, required this.phase, required this.title, required this.message, required this.badge, required final  List<String> achievements}): _achievements = achievements;
  factory _Celebration.fromJson(Map<String, dynamic> json) => _$CelebrationFromJson(json);

@override final  CelebrationType type;
@override final  int day;
@override final  int week;
@override final  ProgramPhase phase;
@override final  String title;
@override final  String message;
@override final  String badge;
 final  List<String> _achievements;
@override List<String> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}


/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CelebrationCopyWith<_Celebration> get copyWith => __$CelebrationCopyWithImpl<_Celebration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CelebrationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Celebration&&(identical(other.type, type) || other.type == type)&&(identical(other.day, day) || other.day == day)&&(identical(other.week, week) || other.week == week)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.badge, badge) || other.badge == badge)&&const DeepCollectionEquality().equals(other._achievements, _achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,day,week,phase,title,message,badge,const DeepCollectionEquality().hash(_achievements));

@override
String toString() {
  return 'Celebration(type: $type, day: $day, week: $week, phase: $phase, title: $title, message: $message, badge: $badge, achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class _$CelebrationCopyWith<$Res> implements $CelebrationCopyWith<$Res> {
  factory _$CelebrationCopyWith(_Celebration value, $Res Function(_Celebration) _then) = __$CelebrationCopyWithImpl;
@override @useResult
$Res call({
 CelebrationType type, int day, int week, ProgramPhase phase, String title, String message, String badge, List<String> achievements
});




}
/// @nodoc
class __$CelebrationCopyWithImpl<$Res>
    implements _$CelebrationCopyWith<$Res> {
  __$CelebrationCopyWithImpl(this._self, this._then);

  final _Celebration _self;
  final $Res Function(_Celebration) _then;

/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? day = null,Object? week = null,Object? phase = null,Object? title = null,Object? message = null,Object? badge = null,Object? achievements = null,}) {
  return _then(_Celebration(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CelebrationType,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ProgramPhase,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
