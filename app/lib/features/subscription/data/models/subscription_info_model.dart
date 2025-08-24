import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_info.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';

part 'subscription_info_model.freezed.dart';
part 'subscription_info_model.g.dart';

@freezed
abstract class SubscriptionInfoModel with _$SubscriptionInfoModel {
  const factory SubscriptionInfoModel({
    required SubscriptionStatus status,
    SubscriptionType? subscriptionType,
    required int trialDaysRemaining,
    required int remainingScans,
    required bool hasUnlimitedScans,
    DateTime? subscriptionExpiry,
  }) = _SubscriptionInfoModel;

  factory SubscriptionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionInfoModelFromJson(json);
}

extension SubscriptionInfoModelExtension on SubscriptionInfoModel {
  /// Convert data model to domain entity
  SubscriptionInfo toDomain() {
    return SubscriptionInfo(
      status: status,
      subscriptionType: subscriptionType,
      trialDaysRemaining: trialDaysRemaining,
      remainingScans: remainingScans,
      hasUnlimitedScans: hasUnlimitedScans,
      subscriptionExpiry: subscriptionExpiry,
    );
  }
}

extension SubscriptionInfoDomainExtension on SubscriptionInfo {
  /// Convert domain entity to data model
  SubscriptionInfoModel toModel() {
    return SubscriptionInfoModel(
      status: status,
      subscriptionType: subscriptionType,
      trialDaysRemaining: trialDaysRemaining,
      remainingScans: remainingScans,
      hasUnlimitedScans: hasUnlimitedScans,
      subscriptionExpiry: subscriptionExpiry,
    );
  }
}
