import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_status.dart';
import 'package:quit_suggar/features/subscription/domain/entities/subscription_type.dart';

part 'subscription_info.freezed.dart';

@freezed
abstract class SubscriptionInfo with _$SubscriptionInfo {
  const factory SubscriptionInfo({
    required SubscriptionStatus status,
    SubscriptionType? subscriptionType,
    required int trialDaysRemaining,
    required int remainingScans,
    required bool hasUnlimitedScans,
    DateTime? subscriptionExpiry,
  }) = _SubscriptionInfo;

  const SubscriptionInfo._();

  String get displayStatus {
    switch (status) {
      case SubscriptionStatus.free:
        return 'Free';
      case SubscriptionStatus.trial:
        return 'Trial ($trialDaysRemaining days left)';
      case SubscriptionStatus.premium:
        return 'Premium';
    }
  }

  String get scanLimitDisplay {
    if (hasUnlimitedScans) return 'Unlimited scans';
    return '$remainingScans scans remaining today';
  }
}
