// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailySummary _$DailySummaryFromJson(Map<String, dynamic> json) =>
    _DailySummary(
      totalSugar: (json['totalSugar'] as num).toDouble(),
      dailyLimit: (json['dailyLimit'] as num).toDouble(),
      remainingSugar: (json['remainingSugar'] as num).toDouble(),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      status: $enumDecode(_$SugarStatusEnumMap, json['status']),
      entries: (json['entries'] as List<dynamic>)
          .map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      motivationalMessage: json['motivationalMessage'] as String,
      streak: (json['streak'] as num).toInt(),
    );

Map<String, dynamic> _$DailySummaryToJson(_DailySummary instance) =>
    <String, dynamic>{
      'totalSugar': instance.totalSugar,
      'dailyLimit': instance.dailyLimit,
      'remainingSugar': instance.remainingSugar,
      'progressPercentage': instance.progressPercentage,
      'status': _$SugarStatusEnumMap[instance.status]!,
      'entries': instance.entries,
      'motivationalMessage': instance.motivationalMessage,
      'streak': instance.streak,
    };

const _$SugarStatusEnumMap = {
  SugarStatus.green: 'green',
  SugarStatus.yellow: 'yellow',
  SugarStatus.red: 'red',
  SugarStatus.overLimit: 'overLimit',
};
