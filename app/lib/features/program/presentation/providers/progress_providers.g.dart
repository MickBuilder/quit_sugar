// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$progressRepositoryHash() =>
    r'440fd0d7290aeb304d53833079eba9667d72623e';

/// See also [progressRepository].
@ProviderFor(progressRepository)
final progressRepositoryProvider =
    AutoDisposeProvider<ProgressRepository>.internal(
      progressRepository,
      name: r'progressRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$progressRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressRepositoryRef = AutoDisposeProviderRef<ProgressRepository>;
String _$progressOverviewHash() => r'3410ecf988f89d0070f7d2ee582f3f4b7e4243de';

/// See also [progressOverview].
@ProviderFor(progressOverview)
final progressOverviewProvider =
    AutoDisposeFutureProvider<ProgressOverview>.internal(
      progressOverview,
      name: r'progressOverviewProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$progressOverviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressOverviewRef = AutoDisposeFutureProviderRef<ProgressOverview>;
String _$weeklyProgressHash() => r'd082b3d5a7e935cce5054d36585f71d57a6b5ec5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [weeklyProgress].
@ProviderFor(weeklyProgress)
const weeklyProgressProvider = WeeklyProgressFamily();

/// See also [weeklyProgress].
class WeeklyProgressFamily extends Family<AsyncValue<List<WeeklyProgress>>> {
  /// See also [weeklyProgress].
  const WeeklyProgressFamily();

  /// See also [weeklyProgress].
  WeeklyProgressProvider call({int weeks = 8}) {
    return WeeklyProgressProvider(weeks: weeks);
  }

  @override
  WeeklyProgressProvider getProviderOverride(
    covariant WeeklyProgressProvider provider,
  ) {
    return call(weeks: provider.weeks);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weeklyProgressProvider';
}

/// See also [weeklyProgress].
class WeeklyProgressProvider
    extends AutoDisposeFutureProvider<List<WeeklyProgress>> {
  /// See also [weeklyProgress].
  WeeklyProgressProvider({int weeks = 8})
    : this._internal(
        (ref) => weeklyProgress(ref as WeeklyProgressRef, weeks: weeks),
        from: weeklyProgressProvider,
        name: r'weeklyProgressProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weeklyProgressHash,
        dependencies: WeeklyProgressFamily._dependencies,
        allTransitiveDependencies:
            WeeklyProgressFamily._allTransitiveDependencies,
        weeks: weeks,
      );

  WeeklyProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weeks,
  }) : super.internal();

  final int weeks;

  @override
  Override overrideWith(
    FutureOr<List<WeeklyProgress>> Function(WeeklyProgressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeeklyProgressProvider._internal(
        (ref) => create(ref as WeeklyProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weeks: weeks,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WeeklyProgress>> createElement() {
    return _WeeklyProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeeklyProgressProvider && other.weeks == weeks;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weeks.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeeklyProgressRef on AutoDisposeFutureProviderRef<List<WeeklyProgress>> {
  /// The parameter `weeks` of this provider.
  int get weeks;
}

class _WeeklyProgressProviderElement
    extends AutoDisposeFutureProviderElement<List<WeeklyProgress>>
    with WeeklyProgressRef {
  _WeeklyProgressProviderElement(super.provider);

  @override
  int get weeks => (origin as WeeklyProgressProvider).weeks;
}

String _$monthlyStatsHash() => r'897f9e7b723bee7b60e1f0e90cf3fbf477497534';

/// See also [monthlyStats].
@ProviderFor(monthlyStats)
final monthlyStatsProvider =
    AutoDisposeFutureProvider<Map<String, int>>.internal(
      monthlyStats,
      name: r'monthlyStatsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$monthlyStatsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MonthlyStatsRef = AutoDisposeFutureProviderRef<Map<String, int>>;
String _$totalSugarSavedHash() => r'91e3dfcd1f6d13b6e63ab93f1ce1cb7ba5fa54b9';

/// See also [totalSugarSaved].
@ProviderFor(totalSugarSaved)
final totalSugarSavedProvider = AutoDisposeFutureProvider<double>.internal(
  totalSugarSaved,
  name: r'totalSugarSavedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalSugarSavedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalSugarSavedRef = AutoDisposeFutureProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
