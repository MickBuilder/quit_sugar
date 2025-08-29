// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Celebration _$CelebrationFromJson(Map<String, dynamic> json) => _Celebration(
  type: $enumDecode(_$CelebrationTypeEnumMap, json['type']),
  day: (json['day'] as num).toInt(),
  week: (json['week'] as num).toInt(),
  phase: $enumDecode(_$ProgramPhaseEnumMap, json['phase']),
  title: json['title'] as String,
  message: json['message'] as String,
  badge: json['badge'] as String,
  achievements: (json['achievements'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CelebrationToJson(_Celebration instance) =>
    <String, dynamic>{
      'type': _$CelebrationTypeEnumMap[instance.type]!,
      'day': instance.day,
      'week': instance.week,
      'phase': _$ProgramPhaseEnumMap[instance.phase]!,
      'title': instance.title,
      'message': instance.message,
      'badge': instance.badge,
      'achievements': instance.achievements,
    };

const _$CelebrationTypeEnumMap = {
  CelebrationType.weeklyCompletion: 'weeklyCompletion',
  CelebrationType.majorMilestone: 'majorMilestone',
};

const _$ProgramPhaseEnumMap = {
  ProgramPhase.initialReduction: 'initialReduction',
  ProgramPhase.deepElimination: 'deepElimination',
  ProgramPhase.zeroSugar: 'zeroSugar',
};
