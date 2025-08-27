// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyLog _$DailyLogFromJson(Map<String, dynamic> json) => _DailyLog(
  date: json['date'] as String,
  totalSugar: (json['totalSugar'] as num).toDouble(),
  dailyLimit: (json['dailyLimit'] as num).toDouble(),
  remainingSugar: (json['remainingSugar'] as num).toDouble(),
  progressPercentage: (json['progressPercentage'] as num).toDouble(),
  limitExceeded: json['limitExceeded'] as bool,
  streakDay: json['streakDay'] as bool,
  streakCountAtEndOfDay: (json['streakCountAtEndOfDay'] as num).toInt(),
  entryCount: (json['entryCount'] as num).toInt(),
  topFoods: (json['topFoods'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$DailyLogToJson(_DailyLog instance) => <String, dynamic>{
  'date': instance.date,
  'totalSugar': instance.totalSugar,
  'dailyLimit': instance.dailyLimit,
  'remainingSugar': instance.remainingSugar,
  'progressPercentage': instance.progressPercentage,
  'limitExceeded': instance.limitExceeded,
  'streakDay': instance.streakDay,
  'streakCountAtEndOfDay': instance.streakCountAtEndOfDay,
  'entryCount': instance.entryCount,
  'topFoods': instance.topFoods,
  'timestamp': instance.timestamp.toIso8601String(),
};
