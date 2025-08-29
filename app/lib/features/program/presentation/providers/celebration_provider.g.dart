// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todayCelebrationHash() => r'1c3cf78fb25a0b4507aeed4089b0b93ff2562fde';

/// See also [todayCelebration].
@ProviderFor(todayCelebration)
final todayCelebrationProvider =
    AutoDisposeFutureProvider<Celebration?>.internal(
      todayCelebration,
      name: r'todayCelebrationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todayCelebrationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodayCelebrationRef = AutoDisposeFutureProviderRef<Celebration?>;
String _$shouldShowCelebrationHash() =>
    r'871e9f631dfe7f0cf07fc9ccf2b44bc61e65be59';

/// See also [shouldShowCelebration].
@ProviderFor(shouldShowCelebration)
final shouldShowCelebrationProvider = AutoDisposeFutureProvider<bool>.internal(
  shouldShowCelebration,
  name: r'shouldShowCelebrationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldShowCelebrationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShouldShowCelebrationRef = AutoDisposeFutureProviderRef<bool>;
String _$celebrationSeenHash() => r'881b93a2db9e7b1b70c317f65b2bdcef408ee5c3';

/// See also [CelebrationSeen].
@ProviderFor(CelebrationSeen)
final celebrationSeenProvider =
    AutoDisposeNotifierProvider<CelebrationSeen, Set<int>>.internal(
      CelebrationSeen.new,
      name: r'celebrationSeenProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$celebrationSeenHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CelebrationSeen = AutoDisposeNotifier<Set<int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
