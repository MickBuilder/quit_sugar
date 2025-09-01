// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingRepositoryHash() =>
    r'57aaf8d5e5f9d5bb2bb4ee54a7aa6daabf3658e0';

/// See also [onboardingRepository].
@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = Provider<OnboardingRepository>.internal(
  onboardingRepository,
  name: r'onboardingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnboardingRepositoryRef = ProviderRef<OnboardingRepository>;
String _$saveOnboardingDataUseCaseHash() =>
    r'5d0cf4d7cf13b2c5773bb668e8bed95bb69da182';

/// See also [saveOnboardingDataUseCase].
@ProviderFor(saveOnboardingDataUseCase)
final saveOnboardingDataUseCaseProvider =
    Provider<SaveOnboardingDataUseCase>.internal(
      saveOnboardingDataUseCase,
      name: r'saveOnboardingDataUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$saveOnboardingDataUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SaveOnboardingDataUseCaseRef = ProviderRef<SaveOnboardingDataUseCase>;
String _$getCurrentDailyLimitUseCaseHash() =>
    r'80a3af0d1481e255aa03bc7540c2a4d9b1a8216a';

/// See also [getCurrentDailyLimitUseCase].
@ProviderFor(getCurrentDailyLimitUseCase)
final getCurrentDailyLimitUseCaseProvider =
    Provider<GetCurrentDailyLimitUseCase>.internal(
      getCurrentDailyLimitUseCase,
      name: r'getCurrentDailyLimitUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getCurrentDailyLimitUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentDailyLimitUseCaseRef =
    ProviderRef<GetCurrentDailyLimitUseCase>;
String _$checkOnboardingStatusUseCaseHash() =>
    r'9e9c9603fb11cccfe1bbf8650f3a9b05647ff5d1';

/// See also [checkOnboardingStatusUseCase].
@ProviderFor(checkOnboardingStatusUseCase)
final checkOnboardingStatusUseCaseProvider =
    Provider<CheckOnboardingStatusUseCase>.internal(
      checkOnboardingStatusUseCase,
      name: r'checkOnboardingStatusUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkOnboardingStatusUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CheckOnboardingStatusUseCaseRef =
    ProviderRef<CheckOnboardingStatusUseCase>;
String _$onboardingStatusHash() => r'42aafa5fbb735ae940e207d407641bc8af7ceff5';

/// See also [onboardingStatus].
@ProviderFor(onboardingStatus)
final onboardingStatusProvider = AutoDisposeFutureProvider<bool>.internal(
  onboardingStatus,
  name: r'onboardingStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnboardingStatusRef = AutoDisposeFutureProviderRef<bool>;
String _$currentDailyLimitHash() => r'12ef3e960aef8179f7b48c60341bf15a5df3e2b4';

/// See also [currentDailyLimit].
@ProviderFor(currentDailyLimit)
final currentDailyLimitProvider = AutoDisposeFutureProvider<double>.internal(
  currentDailyLimit,
  name: r'currentDailyLimitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDailyLimitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentDailyLimitRef = AutoDisposeFutureProviderRef<double>;
String _$onboardingDataHash() => r'6530edc1b2f96518afcb5d8644fae9e291d5acd4';

/// See also [onboardingData].
@ProviderFor(onboardingData)
final onboardingDataProvider =
    AutoDisposeFutureProvider<OnboardingData?>.internal(
      onboardingData,
      name: r'onboardingDataProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$onboardingDataHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnboardingDataRef = AutoDisposeFutureProviderRef<OnboardingData?>;
String _$onboardingFlowHash() => r'3d6dc1263b7c3880c3591fb47273b19440c34f79';

/// See also [OnboardingFlow].
@ProviderFor(OnboardingFlow)
final onboardingFlowProvider =
    AutoDisposeNotifierProvider<OnboardingFlow, OnboardingData>.internal(
      OnboardingFlow.new,
      name: r'onboardingFlowProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$onboardingFlowHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OnboardingFlow = AutoDisposeNotifier<OnboardingData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
