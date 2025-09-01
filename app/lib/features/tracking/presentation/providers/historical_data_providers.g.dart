// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historicalDataServiceHash() =>
    r'34d11cb5f6512a2d832efb9c7e4d4e514b5f2957';

/// See also [historicalDataService].
@ProviderFor(historicalDataService)
final historicalDataServiceProvider =
    AutoDisposeProvider<HistoricalDataService>.internal(
      historicalDataService,
      name: r'historicalDataServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historicalDataServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoricalDataServiceRef =
    AutoDisposeProviderRef<HistoricalDataService>;
String _$historicalDataRepositoryHash() =>
    r'677ac5f4a339be619535e635c9434de00dc9fc5f';

/// See also [historicalDataRepository].
@ProviderFor(historicalDataRepository)
final historicalDataRepositoryProvider =
    AutoDisposeProvider<HistoricalDataRepository>.internal(
      historicalDataRepository,
      name: r'historicalDataRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historicalDataRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoricalDataRepositoryRef =
    AutoDisposeProviderRef<HistoricalDataRepository>;
String _$recentDailySummariesHash() =>
    r'cfc3e645b65882d1861cd9e63f84a55c09cc6cf6';

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

/// See also [recentDailySummaries].
@ProviderFor(recentDailySummaries)
const recentDailySummariesProvider = RecentDailySummariesFamily();

/// See also [recentDailySummaries].
class RecentDailySummariesFamily extends Family<AsyncValue<List<DailyLog>>> {
  /// See also [recentDailySummaries].
  const RecentDailySummariesFamily();

  /// See also [recentDailySummaries].
  RecentDailySummariesProvider call(int count) {
    return RecentDailySummariesProvider(count);
  }

  @override
  RecentDailySummariesProvider getProviderOverride(
    covariant RecentDailySummariesProvider provider,
  ) {
    return call(provider.count);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recentDailySummariesProvider';
}

/// See also [recentDailySummaries].
class RecentDailySummariesProvider
    extends AutoDisposeFutureProvider<List<DailyLog>> {
  /// See also [recentDailySummaries].
  RecentDailySummariesProvider(int count)
    : this._internal(
        (ref) => recentDailySummaries(ref as RecentDailySummariesRef, count),
        from: recentDailySummariesProvider,
        name: r'recentDailySummariesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recentDailySummariesHash,
        dependencies: RecentDailySummariesFamily._dependencies,
        allTransitiveDependencies:
            RecentDailySummariesFamily._allTransitiveDependencies,
        count: count,
      );

  RecentDailySummariesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  Override overrideWith(
    FutureOr<List<DailyLog>> Function(RecentDailySummariesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentDailySummariesProvider._internal(
        (ref) => create(ref as RecentDailySummariesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DailyLog>> createElement() {
    return _RecentDailySummariesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentDailySummariesProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecentDailySummariesRef on AutoDisposeFutureProviderRef<List<DailyLog>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _RecentDailySummariesProviderElement
    extends AutoDisposeFutureProviderElement<List<DailyLog>>
    with RecentDailySummariesRef {
  _RecentDailySummariesProviderElement(super.provider);

  @override
  int get count => (origin as RecentDailySummariesProvider).count;
}

String _$dailySummariesInRangeHash() =>
    r'52e71060f91260bcbe0af8a9c186ee9025434ea2';

/// See also [dailySummariesInRange].
@ProviderFor(dailySummariesInRange)
const dailySummariesInRangeProvider = DailySummariesInRangeFamily();

/// See also [dailySummariesInRange].
class DailySummariesInRangeFamily extends Family<AsyncValue<List<DailyLog>>> {
  /// See also [dailySummariesInRange].
  const DailySummariesInRangeFamily();

  /// See also [dailySummariesInRange].
  DailySummariesInRangeProvider call(String startDate, String endDate) {
    return DailySummariesInRangeProvider(startDate, endDate);
  }

  @override
  DailySummariesInRangeProvider getProviderOverride(
    covariant DailySummariesInRangeProvider provider,
  ) {
    return call(provider.startDate, provider.endDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailySummariesInRangeProvider';
}

/// See also [dailySummariesInRange].
class DailySummariesInRangeProvider
    extends AutoDisposeFutureProvider<List<DailyLog>> {
  /// See also [dailySummariesInRange].
  DailySummariesInRangeProvider(String startDate, String endDate)
    : this._internal(
        (ref) => dailySummariesInRange(
          ref as DailySummariesInRangeRef,
          startDate,
          endDate,
        ),
        from: dailySummariesInRangeProvider,
        name: r'dailySummariesInRangeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dailySummariesInRangeHash,
        dependencies: DailySummariesInRangeFamily._dependencies,
        allTransitiveDependencies:
            DailySummariesInRangeFamily._allTransitiveDependencies,
        startDate: startDate,
        endDate: endDate,
      );

  DailySummariesInRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final String startDate;
  final String endDate;

  @override
  Override overrideWith(
    FutureOr<List<DailyLog>> Function(DailySummariesInRangeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailySummariesInRangeProvider._internal(
        (ref) => create(ref as DailySummariesInRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DailyLog>> createElement() {
    return _DailySummariesInRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySummariesInRangeProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailySummariesInRangeRef on AutoDisposeFutureProviderRef<List<DailyLog>> {
  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;
}

class _DailySummariesInRangeProviderElement
    extends AutoDisposeFutureProviderElement<List<DailyLog>>
    with DailySummariesInRangeRef {
  _DailySummariesInRangeProviderElement(super.provider);

  @override
  String get startDate => (origin as DailySummariesInRangeProvider).startDate;
  @override
  String get endDate => (origin as DailySummariesInRangeProvider).endDate;
}

String _$historicalStatsHash() => r'3329b804df804ab3d5189a2d4650be6a33c649e6';

/// See also [historicalStats].
@ProviderFor(historicalStats)
final historicalStatsProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
      historicalStats,
      name: r'historicalStatsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historicalStatsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoricalStatsRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
