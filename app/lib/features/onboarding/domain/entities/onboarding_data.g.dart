// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) =>
    _OnboardingData(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      currentDailySugar: (json['currentDailySugar'] as num).toDouble(),
      sugarSources: SugarSourcesProfile.fromJson(
        json['sugarSources'] as Map<String, dynamic>,
      ),
      reductionGoal: $enumDecode(
        _$SugarReductionGoalEnumMap,
        json['reductionGoal'],
      ),
      targetDays: (json['targetDays'] as num).toInt(),
      targetDailySugar: (json['targetDailySugar'] as num).toDouble(),
      motivation: json['motivation'] as String,
      lifeImpacts: (json['lifeImpacts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      analysisResults: json['analysisResults'] as Map<String, dynamic>,
      vowSigned: json['vowSigned'] as bool,
    );

Map<String, dynamic> _$OnboardingDataToJson(_OnboardingData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'currentDailySugar': instance.currentDailySugar,
      'sugarSources': instance.sugarSources,
      'reductionGoal': _$SugarReductionGoalEnumMap[instance.reductionGoal]!,
      'targetDays': instance.targetDays,
      'targetDailySugar': instance.targetDailySugar,
      'motivation': instance.motivation,
      'lifeImpacts': instance.lifeImpacts,
      'analysisResults': instance.analysisResults,
      'vowSigned': instance.vowSigned,
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
