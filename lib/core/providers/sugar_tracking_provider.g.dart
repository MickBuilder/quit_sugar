// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sugar_tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productByBarcodeHash() => r'760eee59da68fbbab99026328d6810646b8673f2';

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

String _$searchProductsHash() => r'237ddaf1fb07eac02ff4304c0c7f47816f5ed1f0';

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

String _$sugarTrackingHash() => r'2d1cc586f62f055b4d83ceb44afde75709f81bfa';

/// See also [SugarTracking].
@ProviderFor(SugarTracking)
final sugarTrackingProvider =
    AutoDisposeNotifierProvider<SugarTracking, SugarTrackingService>.internal(
      SugarTracking.new,
      name: r'sugarTrackingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sugarTrackingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SugarTracking = AutoDisposeNotifier<SugarTrackingService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
