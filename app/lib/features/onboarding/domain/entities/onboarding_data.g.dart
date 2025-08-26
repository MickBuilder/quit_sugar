// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) =>
    _OnboardingData(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      currentDailySugar: (json['currentDailySugar'] as num).toDouble(),
      sugarSources: SugarSourcesProfile.fromJson(
        json['sugarSources'] as Map<String, dynamic>,
      ),
      healthConditions: (json['healthConditions'] as List<dynamic>)
          .map((e) => $enumDecode(_$HealthConditionEnumMap, e))
          .toList(),
      hasSpecialDiet: json['hasSpecialDiet'] as bool,
      dietType: json['dietType'] as String?,
      reductionGoal: $enumDecode(
        _$SugarReductionGoalEnumMap,
        json['reductionGoal'],
      ),
      primaryMotivation: json['primaryMotivation'] as String,
      targetDays: (json['targetDays'] as num).toInt(),
      targetDailySugar: (json['targetDailySugar'] as num).toDouble(),
      dailyLimitsProgression: (json['dailyLimitsProgression'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      startDate: DateTime.parse(json['startDate'] as String),
      targetDate: DateTime.parse(json['targetDate'] as String),
    );

Map<String, dynamic> _$OnboardingDataToJson(_OnboardingData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'currentDailySugar': instance.currentDailySugar,
      'sugarSources': instance.sugarSources,
      'healthConditions': instance.healthConditions
          .map((e) => _$HealthConditionEnumMap[e]!)
          .toList(),
      'hasSpecialDiet': instance.hasSpecialDiet,
      'dietType': instance.dietType,
      'reductionGoal': _$SugarReductionGoalEnumMap[instance.reductionGoal]!,
      'primaryMotivation': instance.primaryMotivation,
      'targetDays': instance.targetDays,
      'targetDailySugar': instance.targetDailySugar,
      'dailyLimitsProgression': instance.dailyLimitsProgression,
      'startDate': instance.startDate.toIso8601String(),
      'targetDate': instance.targetDate.toIso8601String(),
    };

const _$HealthConditionEnumMap = {
  HealthCondition.diabetes: 'diabetes',
  HealthCondition.prediabetes: 'prediabetes',
  HealthCondition.heartDisease: 'heartDisease',
  HealthCondition.weightConcerns: 'weightConcerns',
  HealthCondition.dentalIssues: 'dentalIssues',
  HealthCondition.energyCrashes: 'energyCrashes',
  HealthCondition.none: 'none',
};

const _$SugarReductionGoalEnumMap = {
  SugarReductionGoal.eliminate: 'eliminate',
  SugarReductionGoal.minimal: 'minimal',
  SugarReductionGoal.moderate: 'moderate',
  SugarReductionGoal.healthy: 'healthy',
};

_SugarSourcesProfile _$SugarSourcesProfileFromJson(Map<String, dynamic> json) =>
    _SugarSourcesProfile(
      sodaDrinks: (json['sodaDrinks'] as num).toInt(),
      sweetSnacks: (json['sweetSnacks'] as num).toInt(),
      desserts: (json['desserts'] as num).toInt(),
      addedSugar: (json['addedSugar'] as num).toInt(),
      juiceDrinks: (json['juiceDrinks'] as num).toInt(),
      commonFoods: (json['commonFoods'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SugarSourcesProfileToJson(
  _SugarSourcesProfile instance,
) => <String, dynamic>{
  'sodaDrinks': instance.sodaDrinks,
  'sweetSnacks': instance.sweetSnacks,
  'desserts': instance.desserts,
  'addedSugar': instance.addedSugar,
  'juiceDrinks': instance.juiceDrinks,
  'commonFoods': instance.commonFoods,
};
