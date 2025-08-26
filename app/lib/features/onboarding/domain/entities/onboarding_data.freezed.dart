// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingData {

// Personal info
 String get name; int get age; String get gender;// Current sugar habits
 double get currentDailySugar; SugarSourcesProfile get sugarSources;// Health conditions
 List<HealthCondition> get healthConditions; bool get hasSpecialDiet; String? get dietType;// Goals and motivation
 SugarReductionGoal get reductionGoal; String get primaryMotivation; int get targetDays;// Usually 60 days
// Calculated plan
 double get targetDailySugar; List<double> get dailyLimitsProgression; DateTime get startDate; DateTime get targetDate;
/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingDataCopyWith<OnboardingData> get copyWith => _$OnboardingDataCopyWithImpl<OnboardingData>(this as OnboardingData, _$identity);

  /// Serializes this OnboardingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingData&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.currentDailySugar, currentDailySugar) || other.currentDailySugar == currentDailySugar)&&(identical(other.sugarSources, sugarSources) || other.sugarSources == sugarSources)&&const DeepCollectionEquality().equals(other.healthConditions, healthConditions)&&(identical(other.hasSpecialDiet, hasSpecialDiet) || other.hasSpecialDiet == hasSpecialDiet)&&(identical(other.dietType, dietType) || other.dietType == dietType)&&(identical(other.reductionGoal, reductionGoal) || other.reductionGoal == reductionGoal)&&(identical(other.primaryMotivation, primaryMotivation) || other.primaryMotivation == primaryMotivation)&&(identical(other.targetDays, targetDays) || other.targetDays == targetDays)&&(identical(other.targetDailySugar, targetDailySugar) || other.targetDailySugar == targetDailySugar)&&const DeepCollectionEquality().equals(other.dailyLimitsProgression, dailyLimitsProgression)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,gender,currentDailySugar,sugarSources,const DeepCollectionEquality().hash(healthConditions),hasSpecialDiet,dietType,reductionGoal,primaryMotivation,targetDays,targetDailySugar,const DeepCollectionEquality().hash(dailyLimitsProgression),startDate,targetDate);

@override
String toString() {
  return 'OnboardingData(name: $name, age: $age, gender: $gender, currentDailySugar: $currentDailySugar, sugarSources: $sugarSources, healthConditions: $healthConditions, hasSpecialDiet: $hasSpecialDiet, dietType: $dietType, reductionGoal: $reductionGoal, primaryMotivation: $primaryMotivation, targetDays: $targetDays, targetDailySugar: $targetDailySugar, dailyLimitsProgression: $dailyLimitsProgression, startDate: $startDate, targetDate: $targetDate)';
}


}

/// @nodoc
abstract mixin class $OnboardingDataCopyWith<$Res>  {
  factory $OnboardingDataCopyWith(OnboardingData value, $Res Function(OnboardingData) _then) = _$OnboardingDataCopyWithImpl;
@useResult
$Res call({
 String name, int age, String gender, double currentDailySugar, SugarSourcesProfile sugarSources, List<HealthCondition> healthConditions, bool hasSpecialDiet, String? dietType, SugarReductionGoal reductionGoal, String primaryMotivation, int targetDays, double targetDailySugar, List<double> dailyLimitsProgression, DateTime startDate, DateTime targetDate
});


$SugarSourcesProfileCopyWith<$Res> get sugarSources;

}
/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._self, this._then);

  final OnboardingData _self;
  final $Res Function(OnboardingData) _then;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? age = null,Object? gender = null,Object? currentDailySugar = null,Object? sugarSources = null,Object? healthConditions = null,Object? hasSpecialDiet = null,Object? dietType = freezed,Object? reductionGoal = null,Object? primaryMotivation = null,Object? targetDays = null,Object? targetDailySugar = null,Object? dailyLimitsProgression = null,Object? startDate = null,Object? targetDate = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,currentDailySugar: null == currentDailySugar ? _self.currentDailySugar : currentDailySugar // ignore: cast_nullable_to_non_nullable
as double,sugarSources: null == sugarSources ? _self.sugarSources : sugarSources // ignore: cast_nullable_to_non_nullable
as SugarSourcesProfile,healthConditions: null == healthConditions ? _self.healthConditions : healthConditions // ignore: cast_nullable_to_non_nullable
as List<HealthCondition>,hasSpecialDiet: null == hasSpecialDiet ? _self.hasSpecialDiet : hasSpecialDiet // ignore: cast_nullable_to_non_nullable
as bool,dietType: freezed == dietType ? _self.dietType : dietType // ignore: cast_nullable_to_non_nullable
as String?,reductionGoal: null == reductionGoal ? _self.reductionGoal : reductionGoal // ignore: cast_nullable_to_non_nullable
as SugarReductionGoal,primaryMotivation: null == primaryMotivation ? _self.primaryMotivation : primaryMotivation // ignore: cast_nullable_to_non_nullable
as String,targetDays: null == targetDays ? _self.targetDays : targetDays // ignore: cast_nullable_to_non_nullable
as int,targetDailySugar: null == targetDailySugar ? _self.targetDailySugar : targetDailySugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimitsProgression: null == dailyLimitsProgression ? _self.dailyLimitsProgression : dailyLimitsProgression // ignore: cast_nullable_to_non_nullable
as List<double>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SugarSourcesProfileCopyWith<$Res> get sugarSources {
  
  return $SugarSourcesProfileCopyWith<$Res>(_self.sugarSources, (value) {
    return _then(_self.copyWith(sugarSources: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingData].
extension OnboardingDataPatterns on OnboardingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingData value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingData value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int age,  String gender,  double currentDailySugar,  SugarSourcesProfile sugarSources,  List<HealthCondition> healthConditions,  bool hasSpecialDiet,  String? dietType,  SugarReductionGoal reductionGoal,  String primaryMotivation,  int targetDays,  double targetDailySugar,  List<double> dailyLimitsProgression,  DateTime startDate,  DateTime targetDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
return $default(_that.name,_that.age,_that.gender,_that.currentDailySugar,_that.sugarSources,_that.healthConditions,_that.hasSpecialDiet,_that.dietType,_that.reductionGoal,_that.primaryMotivation,_that.targetDays,_that.targetDailySugar,_that.dailyLimitsProgression,_that.startDate,_that.targetDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int age,  String gender,  double currentDailySugar,  SugarSourcesProfile sugarSources,  List<HealthCondition> healthConditions,  bool hasSpecialDiet,  String? dietType,  SugarReductionGoal reductionGoal,  String primaryMotivation,  int targetDays,  double targetDailySugar,  List<double> dailyLimitsProgression,  DateTime startDate,  DateTime targetDate)  $default,) {final _that = this;
switch (_that) {
case _OnboardingData():
return $default(_that.name,_that.age,_that.gender,_that.currentDailySugar,_that.sugarSources,_that.healthConditions,_that.hasSpecialDiet,_that.dietType,_that.reductionGoal,_that.primaryMotivation,_that.targetDays,_that.targetDailySugar,_that.dailyLimitsProgression,_that.startDate,_that.targetDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int age,  String gender,  double currentDailySugar,  SugarSourcesProfile sugarSources,  List<HealthCondition> healthConditions,  bool hasSpecialDiet,  String? dietType,  SugarReductionGoal reductionGoal,  String primaryMotivation,  int targetDays,  double targetDailySugar,  List<double> dailyLimitsProgression,  DateTime startDate,  DateTime targetDate)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
return $default(_that.name,_that.age,_that.gender,_that.currentDailySugar,_that.sugarSources,_that.healthConditions,_that.hasSpecialDiet,_that.dietType,_that.reductionGoal,_that.primaryMotivation,_that.targetDays,_that.targetDailySugar,_that.dailyLimitsProgression,_that.startDate,_that.targetDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingData extends OnboardingData {
  const _OnboardingData({required this.name, required this.age, required this.gender, required this.currentDailySugar, required this.sugarSources, required final  List<HealthCondition> healthConditions, required this.hasSpecialDiet, required this.dietType, required this.reductionGoal, required this.primaryMotivation, required this.targetDays, required this.targetDailySugar, required final  List<double> dailyLimitsProgression, required this.startDate, required this.targetDate}): _healthConditions = healthConditions,_dailyLimitsProgression = dailyLimitsProgression,super._();
  factory _OnboardingData.fromJson(Map<String, dynamic> json) => _$OnboardingDataFromJson(json);

// Personal info
@override final  String name;
@override final  int age;
@override final  String gender;
// Current sugar habits
@override final  double currentDailySugar;
@override final  SugarSourcesProfile sugarSources;
// Health conditions
 final  List<HealthCondition> _healthConditions;
// Health conditions
@override List<HealthCondition> get healthConditions {
  if (_healthConditions is EqualUnmodifiableListView) return _healthConditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_healthConditions);
}

@override final  bool hasSpecialDiet;
@override final  String? dietType;
// Goals and motivation
@override final  SugarReductionGoal reductionGoal;
@override final  String primaryMotivation;
@override final  int targetDays;
// Usually 60 days
// Calculated plan
@override final  double targetDailySugar;
 final  List<double> _dailyLimitsProgression;
@override List<double> get dailyLimitsProgression {
  if (_dailyLimitsProgression is EqualUnmodifiableListView) return _dailyLimitsProgression;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyLimitsProgression);
}

@override final  DateTime startDate;
@override final  DateTime targetDate;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingDataCopyWith<_OnboardingData> get copyWith => __$OnboardingDataCopyWithImpl<_OnboardingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingData&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.currentDailySugar, currentDailySugar) || other.currentDailySugar == currentDailySugar)&&(identical(other.sugarSources, sugarSources) || other.sugarSources == sugarSources)&&const DeepCollectionEquality().equals(other._healthConditions, _healthConditions)&&(identical(other.hasSpecialDiet, hasSpecialDiet) || other.hasSpecialDiet == hasSpecialDiet)&&(identical(other.dietType, dietType) || other.dietType == dietType)&&(identical(other.reductionGoal, reductionGoal) || other.reductionGoal == reductionGoal)&&(identical(other.primaryMotivation, primaryMotivation) || other.primaryMotivation == primaryMotivation)&&(identical(other.targetDays, targetDays) || other.targetDays == targetDays)&&(identical(other.targetDailySugar, targetDailySugar) || other.targetDailySugar == targetDailySugar)&&const DeepCollectionEquality().equals(other._dailyLimitsProgression, _dailyLimitsProgression)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,gender,currentDailySugar,sugarSources,const DeepCollectionEquality().hash(_healthConditions),hasSpecialDiet,dietType,reductionGoal,primaryMotivation,targetDays,targetDailySugar,const DeepCollectionEquality().hash(_dailyLimitsProgression),startDate,targetDate);

@override
String toString() {
  return 'OnboardingData(name: $name, age: $age, gender: $gender, currentDailySugar: $currentDailySugar, sugarSources: $sugarSources, healthConditions: $healthConditions, hasSpecialDiet: $hasSpecialDiet, dietType: $dietType, reductionGoal: $reductionGoal, primaryMotivation: $primaryMotivation, targetDays: $targetDays, targetDailySugar: $targetDailySugar, dailyLimitsProgression: $dailyLimitsProgression, startDate: $startDate, targetDate: $targetDate)';
}


}

/// @nodoc
abstract mixin class _$OnboardingDataCopyWith<$Res> implements $OnboardingDataCopyWith<$Res> {
  factory _$OnboardingDataCopyWith(_OnboardingData value, $Res Function(_OnboardingData) _then) = __$OnboardingDataCopyWithImpl;
@override @useResult
$Res call({
 String name, int age, String gender, double currentDailySugar, SugarSourcesProfile sugarSources, List<HealthCondition> healthConditions, bool hasSpecialDiet, String? dietType, SugarReductionGoal reductionGoal, String primaryMotivation, int targetDays, double targetDailySugar, List<double> dailyLimitsProgression, DateTime startDate, DateTime targetDate
});


@override $SugarSourcesProfileCopyWith<$Res> get sugarSources;

}
/// @nodoc
class __$OnboardingDataCopyWithImpl<$Res>
    implements _$OnboardingDataCopyWith<$Res> {
  __$OnboardingDataCopyWithImpl(this._self, this._then);

  final _OnboardingData _self;
  final $Res Function(_OnboardingData) _then;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? age = null,Object? gender = null,Object? currentDailySugar = null,Object? sugarSources = null,Object? healthConditions = null,Object? hasSpecialDiet = null,Object? dietType = freezed,Object? reductionGoal = null,Object? primaryMotivation = null,Object? targetDays = null,Object? targetDailySugar = null,Object? dailyLimitsProgression = null,Object? startDate = null,Object? targetDate = null,}) {
  return _then(_OnboardingData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,currentDailySugar: null == currentDailySugar ? _self.currentDailySugar : currentDailySugar // ignore: cast_nullable_to_non_nullable
as double,sugarSources: null == sugarSources ? _self.sugarSources : sugarSources // ignore: cast_nullable_to_non_nullable
as SugarSourcesProfile,healthConditions: null == healthConditions ? _self._healthConditions : healthConditions // ignore: cast_nullable_to_non_nullable
as List<HealthCondition>,hasSpecialDiet: null == hasSpecialDiet ? _self.hasSpecialDiet : hasSpecialDiet // ignore: cast_nullable_to_non_nullable
as bool,dietType: freezed == dietType ? _self.dietType : dietType // ignore: cast_nullable_to_non_nullable
as String?,reductionGoal: null == reductionGoal ? _self.reductionGoal : reductionGoal // ignore: cast_nullable_to_non_nullable
as SugarReductionGoal,primaryMotivation: null == primaryMotivation ? _self.primaryMotivation : primaryMotivation // ignore: cast_nullable_to_non_nullable
as String,targetDays: null == targetDays ? _self.targetDays : targetDays // ignore: cast_nullable_to_non_nullable
as int,targetDailySugar: null == targetDailySugar ? _self.targetDailySugar : targetDailySugar // ignore: cast_nullable_to_non_nullable
as double,dailyLimitsProgression: null == dailyLimitsProgression ? _self._dailyLimitsProgression : dailyLimitsProgression // ignore: cast_nullable_to_non_nullable
as List<double>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SugarSourcesProfileCopyWith<$Res> get sugarSources {
  
  return $SugarSourcesProfileCopyWith<$Res>(_self.sugarSources, (value) {
    return _then(_self.copyWith(sugarSources: value));
  });
}
}


/// @nodoc
mixin _$SugarSourcesProfile {

 int get sodaDrinks;// per week
 int get sweetSnacks;// per week
 int get desserts;// per week
 int get addedSugar;// teaspoons per day
 int get juiceDrinks;// per week
 List<String> get commonFoods;
/// Create a copy of SugarSourcesProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SugarSourcesProfileCopyWith<SugarSourcesProfile> get copyWith => _$SugarSourcesProfileCopyWithImpl<SugarSourcesProfile>(this as SugarSourcesProfile, _$identity);

  /// Serializes this SugarSourcesProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SugarSourcesProfile&&(identical(other.sodaDrinks, sodaDrinks) || other.sodaDrinks == sodaDrinks)&&(identical(other.sweetSnacks, sweetSnacks) || other.sweetSnacks == sweetSnacks)&&(identical(other.desserts, desserts) || other.desserts == desserts)&&(identical(other.addedSugar, addedSugar) || other.addedSugar == addedSugar)&&(identical(other.juiceDrinks, juiceDrinks) || other.juiceDrinks == juiceDrinks)&&const DeepCollectionEquality().equals(other.commonFoods, commonFoods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sodaDrinks,sweetSnacks,desserts,addedSugar,juiceDrinks,const DeepCollectionEquality().hash(commonFoods));

@override
String toString() {
  return 'SugarSourcesProfile(sodaDrinks: $sodaDrinks, sweetSnacks: $sweetSnacks, desserts: $desserts, addedSugar: $addedSugar, juiceDrinks: $juiceDrinks, commonFoods: $commonFoods)';
}


}

/// @nodoc
abstract mixin class $SugarSourcesProfileCopyWith<$Res>  {
  factory $SugarSourcesProfileCopyWith(SugarSourcesProfile value, $Res Function(SugarSourcesProfile) _then) = _$SugarSourcesProfileCopyWithImpl;
@useResult
$Res call({
 int sodaDrinks, int sweetSnacks, int desserts, int addedSugar, int juiceDrinks, List<String> commonFoods
});




}
/// @nodoc
class _$SugarSourcesProfileCopyWithImpl<$Res>
    implements $SugarSourcesProfileCopyWith<$Res> {
  _$SugarSourcesProfileCopyWithImpl(this._self, this._then);

  final SugarSourcesProfile _self;
  final $Res Function(SugarSourcesProfile) _then;

/// Create a copy of SugarSourcesProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sodaDrinks = null,Object? sweetSnacks = null,Object? desserts = null,Object? addedSugar = null,Object? juiceDrinks = null,Object? commonFoods = null,}) {
  return _then(_self.copyWith(
sodaDrinks: null == sodaDrinks ? _self.sodaDrinks : sodaDrinks // ignore: cast_nullable_to_non_nullable
as int,sweetSnacks: null == sweetSnacks ? _self.sweetSnacks : sweetSnacks // ignore: cast_nullable_to_non_nullable
as int,desserts: null == desserts ? _self.desserts : desserts // ignore: cast_nullable_to_non_nullable
as int,addedSugar: null == addedSugar ? _self.addedSugar : addedSugar // ignore: cast_nullable_to_non_nullable
as int,juiceDrinks: null == juiceDrinks ? _self.juiceDrinks : juiceDrinks // ignore: cast_nullable_to_non_nullable
as int,commonFoods: null == commonFoods ? _self.commonFoods : commonFoods // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SugarSourcesProfile].
extension SugarSourcesProfilePatterns on SugarSourcesProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SugarSourcesProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SugarSourcesProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SugarSourcesProfile value)  $default,){
final _that = this;
switch (_that) {
case _SugarSourcesProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SugarSourcesProfile value)?  $default,){
final _that = this;
switch (_that) {
case _SugarSourcesProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sodaDrinks,  int sweetSnacks,  int desserts,  int addedSugar,  int juiceDrinks,  List<String> commonFoods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SugarSourcesProfile() when $default != null:
return $default(_that.sodaDrinks,_that.sweetSnacks,_that.desserts,_that.addedSugar,_that.juiceDrinks,_that.commonFoods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sodaDrinks,  int sweetSnacks,  int desserts,  int addedSugar,  int juiceDrinks,  List<String> commonFoods)  $default,) {final _that = this;
switch (_that) {
case _SugarSourcesProfile():
return $default(_that.sodaDrinks,_that.sweetSnacks,_that.desserts,_that.addedSugar,_that.juiceDrinks,_that.commonFoods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sodaDrinks,  int sweetSnacks,  int desserts,  int addedSugar,  int juiceDrinks,  List<String> commonFoods)?  $default,) {final _that = this;
switch (_that) {
case _SugarSourcesProfile() when $default != null:
return $default(_that.sodaDrinks,_that.sweetSnacks,_that.desserts,_that.addedSugar,_that.juiceDrinks,_that.commonFoods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SugarSourcesProfile implements SugarSourcesProfile {
  const _SugarSourcesProfile({required this.sodaDrinks, required this.sweetSnacks, required this.desserts, required this.addedSugar, required this.juiceDrinks, required final  List<String> commonFoods}): _commonFoods = commonFoods;
  factory _SugarSourcesProfile.fromJson(Map<String, dynamic> json) => _$SugarSourcesProfileFromJson(json);

@override final  int sodaDrinks;
// per week
@override final  int sweetSnacks;
// per week
@override final  int desserts;
// per week
@override final  int addedSugar;
// teaspoons per day
@override final  int juiceDrinks;
// per week
 final  List<String> _commonFoods;
// per week
@override List<String> get commonFoods {
  if (_commonFoods is EqualUnmodifiableListView) return _commonFoods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commonFoods);
}


/// Create a copy of SugarSourcesProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SugarSourcesProfileCopyWith<_SugarSourcesProfile> get copyWith => __$SugarSourcesProfileCopyWithImpl<_SugarSourcesProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SugarSourcesProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SugarSourcesProfile&&(identical(other.sodaDrinks, sodaDrinks) || other.sodaDrinks == sodaDrinks)&&(identical(other.sweetSnacks, sweetSnacks) || other.sweetSnacks == sweetSnacks)&&(identical(other.desserts, desserts) || other.desserts == desserts)&&(identical(other.addedSugar, addedSugar) || other.addedSugar == addedSugar)&&(identical(other.juiceDrinks, juiceDrinks) || other.juiceDrinks == juiceDrinks)&&const DeepCollectionEquality().equals(other._commonFoods, _commonFoods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sodaDrinks,sweetSnacks,desserts,addedSugar,juiceDrinks,const DeepCollectionEquality().hash(_commonFoods));

@override
String toString() {
  return 'SugarSourcesProfile(sodaDrinks: $sodaDrinks, sweetSnacks: $sweetSnacks, desserts: $desserts, addedSugar: $addedSugar, juiceDrinks: $juiceDrinks, commonFoods: $commonFoods)';
}


}

/// @nodoc
abstract mixin class _$SugarSourcesProfileCopyWith<$Res> implements $SugarSourcesProfileCopyWith<$Res> {
  factory _$SugarSourcesProfileCopyWith(_SugarSourcesProfile value, $Res Function(_SugarSourcesProfile) _then) = __$SugarSourcesProfileCopyWithImpl;
@override @useResult
$Res call({
 int sodaDrinks, int sweetSnacks, int desserts, int addedSugar, int juiceDrinks, List<String> commonFoods
});




}
/// @nodoc
class __$SugarSourcesProfileCopyWithImpl<$Res>
    implements _$SugarSourcesProfileCopyWith<$Res> {
  __$SugarSourcesProfileCopyWithImpl(this._self, this._then);

  final _SugarSourcesProfile _self;
  final $Res Function(_SugarSourcesProfile) _then;

/// Create a copy of SugarSourcesProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sodaDrinks = null,Object? sweetSnacks = null,Object? desserts = null,Object? addedSugar = null,Object? juiceDrinks = null,Object? commonFoods = null,}) {
  return _then(_SugarSourcesProfile(
sodaDrinks: null == sodaDrinks ? _self.sodaDrinks : sodaDrinks // ignore: cast_nullable_to_non_nullable
as int,sweetSnacks: null == sweetSnacks ? _self.sweetSnacks : sweetSnacks // ignore: cast_nullable_to_non_nullable
as int,desserts: null == desserts ? _self.desserts : desserts // ignore: cast_nullable_to_non_nullable
as int,addedSugar: null == addedSugar ? _self.addedSugar : addedSugar // ignore: cast_nullable_to_non_nullable
as int,juiceDrinks: null == juiceDrinks ? _self.juiceDrinks : juiceDrinks // ignore: cast_nullable_to_non_nullable
as int,commonFoods: null == commonFoods ? _self._commonFoods : commonFoods // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
