// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WithdrawalSymptom _$WithdrawalSymptomFromJson(Map<String, dynamic> json) =>
    _WithdrawalSymptom(
      id: json['id'] as String,
      type: $enumDecode(_$SymptomTypeEnumMap, json['type']),
      intensity: (json['intensity'] as num).toInt(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$WithdrawalSymptomToJson(_WithdrawalSymptom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SymptomTypeEnumMap[instance.type]!,
      'intensity': instance.intensity,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'notes': instance.notes,
    };

const _$SymptomTypeEnumMap = {
  SymptomType.headaches: 'headaches',
  SymptomType.cravings: 'cravings',
  SymptomType.energy: 'energy',
  SymptomType.mood: 'mood',
};

_DailySymptomLog _$DailySymptomLogFromJson(Map<String, dynamic> json) =>
    _DailySymptomLog(
      date: DateTime.parse(json['date'] as String),
      symptoms: (json['symptoms'] as List<dynamic>)
          .map((e) => WithdrawalSymptom.fromJson(e as Map<String, dynamic>))
          .toList(),
      generalNotes: json['generalNotes'] as String?,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$DailySymptomLogToJson(_DailySymptomLog instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'symptoms': instance.symptoms,
      'generalNotes': instance.generalNotes,
      'completed': instance.completed,
    };
