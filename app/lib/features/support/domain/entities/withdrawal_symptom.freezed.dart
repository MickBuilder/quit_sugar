// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawal_symptom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawalSymptom {

 String get id; SymptomType get type; int get intensity; DateTime get recordedAt; String? get notes;
/// Create a copy of WithdrawalSymptom
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawalSymptomCopyWith<WithdrawalSymptom> get copyWith => _$WithdrawalSymptomCopyWithImpl<WithdrawalSymptom>(this as WithdrawalSymptom, _$identity);

  /// Serializes this WithdrawalSymptom to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawalSymptom&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,intensity,recordedAt,notes);

@override
String toString() {
  return 'WithdrawalSymptom(id: $id, type: $type, intensity: $intensity, recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $WithdrawalSymptomCopyWith<$Res>  {
  factory $WithdrawalSymptomCopyWith(WithdrawalSymptom value, $Res Function(WithdrawalSymptom) _then) = _$WithdrawalSymptomCopyWithImpl;
@useResult
$Res call({
 String id, SymptomType type, int intensity, DateTime recordedAt, String? notes
});




}
/// @nodoc
class _$WithdrawalSymptomCopyWithImpl<$Res>
    implements $WithdrawalSymptomCopyWith<$Res> {
  _$WithdrawalSymptomCopyWithImpl(this._self, this._then);

  final WithdrawalSymptom _self;
  final $Res Function(WithdrawalSymptom) _then;

/// Create a copy of WithdrawalSymptom
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? intensity = null,Object? recordedAt = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SymptomType,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawalSymptom].
extension WithdrawalSymptomPatterns on WithdrawalSymptom {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawalSymptom value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawalSymptom() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawalSymptom value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawalSymptom():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawalSymptom value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawalSymptom() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SymptomType type,  int intensity,  DateTime recordedAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawalSymptom() when $default != null:
return $default(_that.id,_that.type,_that.intensity,_that.recordedAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SymptomType type,  int intensity,  DateTime recordedAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _WithdrawalSymptom():
return $default(_that.id,_that.type,_that.intensity,_that.recordedAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SymptomType type,  int intensity,  DateTime recordedAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawalSymptom() when $default != null:
return $default(_that.id,_that.type,_that.intensity,_that.recordedAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawalSymptom extends WithdrawalSymptom {
  const _WithdrawalSymptom({required this.id, required this.type, required this.intensity, required this.recordedAt, this.notes}): super._();
  factory _WithdrawalSymptom.fromJson(Map<String, dynamic> json) => _$WithdrawalSymptomFromJson(json);

@override final  String id;
@override final  SymptomType type;
@override final  int intensity;
@override final  DateTime recordedAt;
@override final  String? notes;

/// Create a copy of WithdrawalSymptom
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawalSymptomCopyWith<_WithdrawalSymptom> get copyWith => __$WithdrawalSymptomCopyWithImpl<_WithdrawalSymptom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawalSymptomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawalSymptom&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,intensity,recordedAt,notes);

@override
String toString() {
  return 'WithdrawalSymptom(id: $id, type: $type, intensity: $intensity, recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$WithdrawalSymptomCopyWith<$Res> implements $WithdrawalSymptomCopyWith<$Res> {
  factory _$WithdrawalSymptomCopyWith(_WithdrawalSymptom value, $Res Function(_WithdrawalSymptom) _then) = __$WithdrawalSymptomCopyWithImpl;
@override @useResult
$Res call({
 String id, SymptomType type, int intensity, DateTime recordedAt, String? notes
});




}
/// @nodoc
class __$WithdrawalSymptomCopyWithImpl<$Res>
    implements _$WithdrawalSymptomCopyWith<$Res> {
  __$WithdrawalSymptomCopyWithImpl(this._self, this._then);

  final _WithdrawalSymptom _self;
  final $Res Function(_WithdrawalSymptom) _then;

/// Create a copy of WithdrawalSymptom
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? intensity = null,Object? recordedAt = null,Object? notes = freezed,}) {
  return _then(_WithdrawalSymptom(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SymptomType,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DailySymptomLog {

 DateTime get date; List<WithdrawalSymptom> get symptoms; String? get generalNotes; bool get completed;
/// Create a copy of DailySymptomLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySymptomLogCopyWith<DailySymptomLog> get copyWith => _$DailySymptomLogCopyWithImpl<DailySymptomLog>(this as DailySymptomLog, _$identity);

  /// Serializes this DailySymptomLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySymptomLog&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.symptoms, symptoms)&&(identical(other.generalNotes, generalNotes) || other.generalNotes == generalNotes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(symptoms),generalNotes,completed);

@override
String toString() {
  return 'DailySymptomLog(date: $date, symptoms: $symptoms, generalNotes: $generalNotes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $DailySymptomLogCopyWith<$Res>  {
  factory $DailySymptomLogCopyWith(DailySymptomLog value, $Res Function(DailySymptomLog) _then) = _$DailySymptomLogCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<WithdrawalSymptom> symptoms, String? generalNotes, bool completed
});




}
/// @nodoc
class _$DailySymptomLogCopyWithImpl<$Res>
    implements $DailySymptomLogCopyWith<$Res> {
  _$DailySymptomLogCopyWithImpl(this._self, this._then);

  final DailySymptomLog _self;
  final $Res Function(DailySymptomLog) _then;

/// Create a copy of DailySymptomLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? symptoms = null,Object? generalNotes = freezed,Object? completed = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as List<WithdrawalSymptom>,generalNotes: freezed == generalNotes ? _self.generalNotes : generalNotes // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySymptomLog].
extension DailySymptomLogPatterns on DailySymptomLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySymptomLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySymptomLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySymptomLog value)  $default,){
final _that = this;
switch (_that) {
case _DailySymptomLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySymptomLog value)?  $default,){
final _that = this;
switch (_that) {
case _DailySymptomLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<WithdrawalSymptom> symptoms,  String? generalNotes,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySymptomLog() when $default != null:
return $default(_that.date,_that.symptoms,_that.generalNotes,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<WithdrawalSymptom> symptoms,  String? generalNotes,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _DailySymptomLog():
return $default(_that.date,_that.symptoms,_that.generalNotes,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<WithdrawalSymptom> symptoms,  String? generalNotes,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _DailySymptomLog() when $default != null:
return $default(_that.date,_that.symptoms,_that.generalNotes,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailySymptomLog extends DailySymptomLog {
  const _DailySymptomLog({required this.date, required final  List<WithdrawalSymptom> symptoms, this.generalNotes, this.completed = false}): _symptoms = symptoms,super._();
  factory _DailySymptomLog.fromJson(Map<String, dynamic> json) => _$DailySymptomLogFromJson(json);

@override final  DateTime date;
 final  List<WithdrawalSymptom> _symptoms;
@override List<WithdrawalSymptom> get symptoms {
  if (_symptoms is EqualUnmodifiableListView) return _symptoms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symptoms);
}

@override final  String? generalNotes;
@override@JsonKey() final  bool completed;

/// Create a copy of DailySymptomLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySymptomLogCopyWith<_DailySymptomLog> get copyWith => __$DailySymptomLogCopyWithImpl<_DailySymptomLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailySymptomLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySymptomLog&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._symptoms, _symptoms)&&(identical(other.generalNotes, generalNotes) || other.generalNotes == generalNotes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_symptoms),generalNotes,completed);

@override
String toString() {
  return 'DailySymptomLog(date: $date, symptoms: $symptoms, generalNotes: $generalNotes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$DailySymptomLogCopyWith<$Res> implements $DailySymptomLogCopyWith<$Res> {
  factory _$DailySymptomLogCopyWith(_DailySymptomLog value, $Res Function(_DailySymptomLog) _then) = __$DailySymptomLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<WithdrawalSymptom> symptoms, String? generalNotes, bool completed
});




}
/// @nodoc
class __$DailySymptomLogCopyWithImpl<$Res>
    implements _$DailySymptomLogCopyWith<$Res> {
  __$DailySymptomLogCopyWithImpl(this._self, this._then);

  final _DailySymptomLog _self;
  final $Res Function(_DailySymptomLog) _then;

/// Create a copy of DailySymptomLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? symptoms = null,Object? generalNotes = freezed,Object? completed = null,}) {
  return _then(_DailySymptomLog(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,symptoms: null == symptoms ? _self._symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as List<WithdrawalSymptom>,generalNotes: freezed == generalNotes ? _self.generalNotes : generalNotes // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
