// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionStorageServiceHash() =>
    r'cebf589a715f6fda9c4988b4585cbefbac1d9bfd';

/// See also [subscriptionStorageService].
@ProviderFor(subscriptionStorageService)
final subscriptionStorageServiceProvider =
    AutoDisposeProvider<SubscriptionStorageService>.internal(
      subscriptionStorageService,
      name: r'subscriptionStorageServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionStorageServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionStorageServiceRef =
    AutoDisposeProviderRef<SubscriptionStorageService>;
String _$revenueCatApiServiceHash() =>
    r'8a7a973c223bdff8fa8cbe33ccfe484435ed33d1';

/// See also [revenueCatApiService].
@ProviderFor(revenueCatApiService)
final revenueCatApiServiceProvider =
    AutoDisposeProvider<RevenueCatApiService>.internal(
      revenueCatApiService,
      name: r'revenueCatApiServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$revenueCatApiServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RevenueCatApiServiceRef = AutoDisposeProviderRef<RevenueCatApiService>;
String _$subscriptionRepositoryHash() =>
    r'e7ca843623de1e645e54482738a81ea164d8c183';

/// See also [subscriptionRepository].
@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider =
    AutoDisposeProvider<SubscriptionRepository>.internal(
      subscriptionRepository,
      name: r'subscriptionRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionRepositoryRef =
    AutoDisposeProviderRef<SubscriptionRepository>;
String _$subscriptionUsecaseHash() =>
    r'1ebbfefac515c868ad98e0f2780866cbc30862fa';

/// See also [subscriptionUsecase].
@ProviderFor(subscriptionUsecase)
final subscriptionUsecaseProvider =
    AutoDisposeProvider<SubscriptionUsecase>.internal(
      subscriptionUsecase,
      name: r'subscriptionUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionUsecaseRef = AutoDisposeProviderRef<SubscriptionUsecase>;
String _$subscriptionHash() => r'e92f46953c650c1abf3e2655ad4d256d6a854298';

/// See also [Subscription].
@ProviderFor(Subscription)
final subscriptionProvider =
    AutoDisposeAsyncNotifierProvider<
      Subscription,
      SubscriptionUsecase
    >.internal(
      Subscription.new,
      name: r'subscriptionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Subscription = AutoDisposeAsyncNotifier<SubscriptionUsecase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
