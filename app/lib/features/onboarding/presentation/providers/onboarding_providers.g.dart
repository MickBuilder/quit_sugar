// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingRepositoryHash() =>
    r'59d2f2a3b244a09c54c7641fe8ae90eb2b0eeae4';

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
    r'02a5a54beffa383dd4091c2f0d300dfb6dbf6a43';

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
    r'd9d7d47f6072217ec9b3fdde93e51b15b033b91a';

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
    r'8fd201bccf71e23d33f05d6bb75ed1d063671e00';

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
String _$onboardingStatusHash() => r'3cc00de2aed9491ea99cccb3ea915ea71db95c88';

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
String _$currentDailyLimitHash() => r'f87f148d693ea48921bfe2f131b5d79b2f2d9c56';

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
String _$onboardingDataHash() => r'c24a080a7a957209c8a4248867fc1b0aaf22059e';

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
String _$onboardingFlowHash() => r'89754f5ecf00aec902e5f291b3c8e8cb1e55d2c6';

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
