// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionInfoModel _$SubscriptionInfoModelFromJson(
  Map<String, dynamic> json,
) => _SubscriptionInfoModel(
  status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
  subscriptionType: $enumDecodeNullable(
    _$SubscriptionTypeEnumMap,
    json['subscriptionType'],
  ),
  trialDaysRemaining: (json['trialDaysRemaining'] as num).toInt(),
  remainingScans: (json['remainingScans'] as num).toInt(),
  hasUnlimitedScans: json['hasUnlimitedScans'] as bool,
  subscriptionExpiry: json['subscriptionExpiry'] == null
      ? null
      : DateTime.parse(json['subscriptionExpiry'] as String),
);

Map<String, dynamic> _$SubscriptionInfoModelToJson(
  _SubscriptionInfoModel instance,
) => <String, dynamic>{
  'status': _$SubscriptionStatusEnumMap[instance.status]!,
  'subscriptionType': _$SubscriptionTypeEnumMap[instance.subscriptionType],
  'trialDaysRemaining': instance.trialDaysRemaining,
  'remainingScans': instance.remainingScans,
  'hasUnlimitedScans': instance.hasUnlimitedScans,
  'subscriptionExpiry': instance.subscriptionExpiry?.toIso8601String(),
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.free: 'free',
  SubscriptionStatus.trial: 'trial',
  SubscriptionStatus.premium: 'premium',
};

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.monthly: 'monthly',
  SubscriptionType.yearly: 'yearly',
};
