// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sugar_tracking_provider.dart';

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
String _$openFoodFactsApiServiceHash() =>
    r'13f6d8f4e822fb6027ab87637e6ae19278a8bf46';

/// See also [openFoodFactsApiService].
@ProviderFor(openFoodFactsApiService)
final openFoodFactsApiServiceProvider =
    AutoDisposeProvider<OpenFoodFactsApiService>.internal(
      openFoodFactsApiService,
      name: r'openFoodFactsApiServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$openFoodFactsApiServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OpenFoodFactsApiServiceRef =
    AutoDisposeProviderRef<OpenFoodFactsApiService>;
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
String _$productByBarcodeHash() => r'93a00cad4d11a60ab4537f01f73ef36ceb529e0d';

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

/// See also [productByBarcode].
@ProviderFor(productByBarcode)
const productByBarcodeProvider = ProductByBarcodeFamily();

/// See also [productByBarcode].
class ProductByBarcodeFamily extends Family<AsyncValue<ProductInfo?>> {
  /// See also [productByBarcode].
  const ProductByBarcodeFamily();

  /// See also [productByBarcode].
  ProductByBarcodeProvider call(String barcode) {
    return ProductByBarcodeProvider(barcode);
  }

  @override
  ProductByBarcodeProvider getProviderOverride(
    covariant ProductByBarcodeProvider provider,
  ) {
    return call(provider.barcode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productByBarcodeProvider';
}

/// See also [productByBarcode].
class ProductByBarcodeProvider extends AutoDisposeFutureProvider<ProductInfo?> {
  /// See also [productByBarcode].
  ProductByBarcodeProvider(String barcode)
    : this._internal(
        (ref) => productByBarcode(ref as ProductByBarcodeRef, barcode),
        from: productByBarcodeProvider,
        name: r'productByBarcodeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productByBarcodeHash,
        dependencies: ProductByBarcodeFamily._dependencies,
        allTransitiveDependencies:
            ProductByBarcodeFamily._allTransitiveDependencies,
        barcode: barcode,
      );

  ProductByBarcodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.barcode,
  }) : super.internal();

  final String barcode;

  @override
  Override overrideWith(
    FutureOr<ProductInfo?> Function(ProductByBarcodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductByBarcodeProvider._internal(
        (ref) => create(ref as ProductByBarcodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        barcode: barcode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductInfo?> createElement() {
    return _ProductByBarcodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByBarcodeProvider && other.barcode == barcode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, barcode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductByBarcodeRef on AutoDisposeFutureProviderRef<ProductInfo?> {
  /// The parameter `barcode` of this provider.
  String get barcode;
}

class _ProductByBarcodeProviderElement
    extends AutoDisposeFutureProviderElement<ProductInfo?>
    with ProductByBarcodeRef {
  _ProductByBarcodeProviderElement(super.provider);

  @override
  String get barcode => (origin as ProductByBarcodeProvider).barcode;
}

String _$searchProductsHash() => r'e7afce497880686dfc434cf9035e8831fdb2bd5e';

/// See also [searchProducts].
@ProviderFor(searchProducts)
const searchProductsProvider = SearchProductsFamily();

/// See also [searchProducts].
class SearchProductsFamily extends Family<AsyncValue<List<ProductInfo>>> {
  /// See also [searchProducts].
  const SearchProductsFamily();

  /// See also [searchProducts].
  SearchProductsProvider call(String query) {
    return SearchProductsProvider(query);
  }

  @override
  SearchProductsProvider getProviderOverride(
    covariant SearchProductsProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchProductsProvider';
}

/// See also [searchProducts].
class SearchProductsProvider
    extends AutoDisposeFutureProvider<List<ProductInfo>> {
  /// See also [searchProducts].
  SearchProductsProvider(String query)
    : this._internal(
        (ref) => searchProducts(ref as SearchProductsRef, query),
        from: searchProductsProvider,
        name: r'searchProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$searchProductsHash,
        dependencies: SearchProductsFamily._dependencies,
        allTransitiveDependencies:
            SearchProductsFamily._allTransitiveDependencies,
        query: query,
      );

  SearchProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<ProductInfo>> Function(SearchProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchProductsProvider._internal(
        (ref) => create(ref as SearchProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductInfo>> createElement() {
    return _SearchProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProductsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchProductsRef on AutoDisposeFutureProviderRef<List<ProductInfo>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductInfo>>
    with SearchProductsRef {
  _SearchProductsProviderElement(super.provider);

  @override
  String get query => (origin as SearchProductsProvider).query;
}

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
    r'019c4834018f1497bffb3c7c158e5fb108a2f378';

/// See also [recentDailySummaries].
@ProviderFor(recentDailySummaries)
const recentDailySummariesProvider = RecentDailySummariesFamily();

/// See also [recentDailySummaries].
class RecentDailySummariesFamily
    extends Family<AsyncValue<List<DailySummaryHistory>>> {
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
    extends AutoDisposeFutureProvider<List<DailySummaryHistory>> {
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
    FutureOr<List<DailySummaryHistory>> Function(
      RecentDailySummariesRef provider,
    )
    create,
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
  AutoDisposeFutureProviderElement<List<DailySummaryHistory>> createElement() {
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
mixin RecentDailySummariesRef
    on AutoDisposeFutureProviderRef<List<DailySummaryHistory>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _RecentDailySummariesProviderElement
    extends AutoDisposeFutureProviderElement<List<DailySummaryHistory>>
    with RecentDailySummariesRef {
  _RecentDailySummariesProviderElement(super.provider);

  @override
  int get count => (origin as RecentDailySummariesProvider).count;
}

String _$dailySummariesInRangeHash() =>
    r'3ded4ef67cfb5b7868da2bbb7cf66faa8db40fb4';

/// See also [dailySummariesInRange].
@ProviderFor(dailySummariesInRange)
const dailySummariesInRangeProvider = DailySummariesInRangeFamily();

/// See also [dailySummariesInRange].
class DailySummariesInRangeFamily
    extends Family<AsyncValue<List<DailySummaryHistory>>> {
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
    extends AutoDisposeFutureProvider<List<DailySummaryHistory>> {
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
    FutureOr<List<DailySummaryHistory>> Function(
      DailySummariesInRangeRef provider,
    )
    create,
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
  AutoDisposeFutureProviderElement<List<DailySummaryHistory>> createElement() {
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
mixin DailySummariesInRangeRef
    on AutoDisposeFutureProviderRef<List<DailySummaryHistory>> {
  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;
}

class _DailySummariesInRangeProviderElement
    extends AutoDisposeFutureProviderElement<List<DailySummaryHistory>>
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
