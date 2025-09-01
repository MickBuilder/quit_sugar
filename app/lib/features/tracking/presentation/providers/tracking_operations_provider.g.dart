// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_operations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trackingStorageServiceHash() =>
    r'19826ae2d6b2f4f3b3016977713533534f700fb0';

/// See also [trackingStorageService].
@ProviderFor(trackingStorageService)
final trackingStorageServiceProvider =
    AutoDisposeProvider<TrackingStorageService>.internal(
      trackingStorageService,
      name: r'trackingStorageServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$trackingStorageServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrackingStorageServiceRef =
    AutoDisposeProviderRef<TrackingStorageService>;
String _$trackingRepositoryHash() =>
    r'5062e98b2abf5b0d02124542aa9b95c0178274af';

/// See also [trackingRepository].
@ProviderFor(trackingRepository)
final trackingRepositoryProvider =
    AutoDisposeProvider<TrackingRepository>.internal(
      trackingRepository,
      name: r'trackingRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$trackingRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrackingRepositoryRef = AutoDisposeProviderRef<TrackingRepository>;
String _$sugarTrackingUsecaseHash() =>
    r'40f0f60b96a43524c4d880f76a9b69d561a06ec9';

/// See also [sugarTrackingUsecase].
@ProviderFor(sugarTrackingUsecase)
final sugarTrackingUsecaseProvider =
    AutoDisposeProvider<SugarTrackingUsecase>.internal(
      sugarTrackingUsecase,
      name: r'sugarTrackingUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sugarTrackingUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SugarTrackingUsecaseRef = AutoDisposeProviderRef<SugarTrackingUsecase>;
String _$sugarTrackingHash() => r'71a2f760d5157f80e6ce2d6a50106767a8602b2d';

/// See also [SugarTracking].
@ProviderFor(SugarTracking)
final sugarTrackingProvider =
    AutoDisposeAsyncNotifierProvider<
      SugarTracking,
      SugarTrackingUsecase
    >.internal(
      SugarTracking.new,
      name: r'sugarTrackingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sugarTrackingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SugarTracking = AutoDisposeAsyncNotifier<SugarTrackingUsecase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
