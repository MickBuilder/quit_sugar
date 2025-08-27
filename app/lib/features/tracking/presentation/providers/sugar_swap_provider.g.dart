// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sugar_swap_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sugarSwapServiceHash() => r'aaf66c7615ce00323b4da971ea2a12f01aee9f66';

/// Provides the sugar swap service
///
/// Copied from [sugarSwapService].
@ProviderFor(sugarSwapService)
final sugarSwapServiceProvider = Provider<SugarSwapService>.internal(
  sugarSwapService,
  name: r'sugarSwapServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sugarSwapServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SugarSwapServiceRef = ProviderRef<SugarSwapService>;
String _$sugarSwapRecommendationsHash() =>
    r'ed7d0578769a23aaf215a5c7c24be66f6a593f0e';

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

/// Gets sugar swap recommendations for a specific product
///
/// Copied from [sugarSwapRecommendations].
@ProviderFor(sugarSwapRecommendations)
const sugarSwapRecommendationsProvider = SugarSwapRecommendationsFamily();

/// Gets sugar swap recommendations for a specific product
///
/// Copied from [sugarSwapRecommendations].
class SugarSwapRecommendationsFamily
    extends Family<AsyncValue<SugarSwapRecommendation?>> {
  /// Gets sugar swap recommendations for a specific product
  ///
  /// Copied from [sugarSwapRecommendations].
  const SugarSwapRecommendationsFamily();

  /// Gets sugar swap recommendations for a specific product
  ///
  /// Copied from [sugarSwapRecommendations].
  SugarSwapRecommendationsProvider call(ProductInfo product) {
    return SugarSwapRecommendationsProvider(product);
  }

  @override
  SugarSwapRecommendationsProvider getProviderOverride(
    covariant SugarSwapRecommendationsProvider provider,
  ) {
    return call(provider.product);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sugarSwapRecommendationsProvider';
}

/// Gets sugar swap recommendations for a specific product
///
/// Copied from [sugarSwapRecommendations].
class SugarSwapRecommendationsProvider
    extends AutoDisposeFutureProvider<SugarSwapRecommendation?> {
  /// Gets sugar swap recommendations for a specific product
  ///
  /// Copied from [sugarSwapRecommendations].
  SugarSwapRecommendationsProvider(ProductInfo product)
    : this._internal(
        (ref) => sugarSwapRecommendations(
          ref as SugarSwapRecommendationsRef,
          product,
        ),
        from: sugarSwapRecommendationsProvider,
        name: r'sugarSwapRecommendationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sugarSwapRecommendationsHash,
        dependencies: SugarSwapRecommendationsFamily._dependencies,
        allTransitiveDependencies:
            SugarSwapRecommendationsFamily._allTransitiveDependencies,
        product: product,
      );

  SugarSwapRecommendationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final ProductInfo product;

  @override
  Override overrideWith(
    FutureOr<SugarSwapRecommendation?> Function(
      SugarSwapRecommendationsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SugarSwapRecommendationsProvider._internal(
        (ref) => create(ref as SugarSwapRecommendationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SugarSwapRecommendation?> createElement() {
    return _SugarSwapRecommendationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SugarSwapRecommendationsProvider &&
        other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SugarSwapRecommendationsRef
    on AutoDisposeFutureProviderRef<SugarSwapRecommendation?> {
  /// The parameter `product` of this provider.
  ProductInfo get product;
}

class _SugarSwapRecommendationsProviderElement
    extends AutoDisposeFutureProviderElement<SugarSwapRecommendation?>
    with SugarSwapRecommendationsRef {
  _SugarSwapRecommendationsProviderElement(super.provider);

  @override
  ProductInfo get product =>
      (origin as SugarSwapRecommendationsProvider).product;
}

String _$shouldSuggestAlternativesHash() =>
    r'017e0290b90013e0d279790891f8ef53bdb9c3a4';

/// Checks if alternatives should be suggested for a product
///
/// Copied from [shouldSuggestAlternatives].
@ProviderFor(shouldSuggestAlternatives)
const shouldSuggestAlternativesProvider = ShouldSuggestAlternativesFamily();

/// Checks if alternatives should be suggested for a product
///
/// Copied from [shouldSuggestAlternatives].
class ShouldSuggestAlternativesFamily extends Family<AsyncValue<bool>> {
  /// Checks if alternatives should be suggested for a product
  ///
  /// Copied from [shouldSuggestAlternatives].
  const ShouldSuggestAlternativesFamily();

  /// Checks if alternatives should be suggested for a product
  ///
  /// Copied from [shouldSuggestAlternatives].
  ShouldSuggestAlternativesProvider call(ProductInfo product) {
    return ShouldSuggestAlternativesProvider(product);
  }

  @override
  ShouldSuggestAlternativesProvider getProviderOverride(
    covariant ShouldSuggestAlternativesProvider provider,
  ) {
    return call(provider.product);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shouldSuggestAlternativesProvider';
}

/// Checks if alternatives should be suggested for a product
///
/// Copied from [shouldSuggestAlternatives].
class ShouldSuggestAlternativesProvider
    extends AutoDisposeFutureProvider<bool> {
  /// Checks if alternatives should be suggested for a product
  ///
  /// Copied from [shouldSuggestAlternatives].
  ShouldSuggestAlternativesProvider(ProductInfo product)
    : this._internal(
        (ref) => shouldSuggestAlternatives(
          ref as ShouldSuggestAlternativesRef,
          product,
        ),
        from: shouldSuggestAlternativesProvider,
        name: r'shouldSuggestAlternativesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shouldSuggestAlternativesHash,
        dependencies: ShouldSuggestAlternativesFamily._dependencies,
        allTransitiveDependencies:
            ShouldSuggestAlternativesFamily._allTransitiveDependencies,
        product: product,
      );

  ShouldSuggestAlternativesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final ProductInfo product;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ShouldSuggestAlternativesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShouldSuggestAlternativesProvider._internal(
        (ref) => create(ref as ShouldSuggestAlternativesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ShouldSuggestAlternativesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShouldSuggestAlternativesProvider &&
        other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShouldSuggestAlternativesRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `product` of this provider.
  ProductInfo get product;
}

class _ShouldSuggestAlternativesProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with ShouldSuggestAlternativesRef {
  _ShouldSuggestAlternativesProviderElement(super.provider);

  @override
  ProductInfo get product =>
      (origin as ShouldSuggestAlternativesProvider).product;
}

String _$recommendedStrategyHash() =>
    r'3e3ce91d4111303beb788ca6581cf86c334a29fa';

/// Gets the recommended strategy for a product
///
/// Copied from [recommendedStrategy].
@ProviderFor(recommendedStrategy)
const recommendedStrategyProvider = RecommendedStrategyFamily();

/// Gets the recommended strategy for a product
///
/// Copied from [recommendedStrategy].
class RecommendedStrategyFamily extends Family<AsyncValue<SugarSwapStrategy>> {
  /// Gets the recommended strategy for a product
  ///
  /// Copied from [recommendedStrategy].
  const RecommendedStrategyFamily();

  /// Gets the recommended strategy for a product
  ///
  /// Copied from [recommendedStrategy].
  RecommendedStrategyProvider call(ProductInfo product) {
    return RecommendedStrategyProvider(product);
  }

  @override
  RecommendedStrategyProvider getProviderOverride(
    covariant RecommendedStrategyProvider provider,
  ) {
    return call(provider.product);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recommendedStrategyProvider';
}

/// Gets the recommended strategy for a product
///
/// Copied from [recommendedStrategy].
class RecommendedStrategyProvider
    extends AutoDisposeFutureProvider<SugarSwapStrategy> {
  /// Gets the recommended strategy for a product
  ///
  /// Copied from [recommendedStrategy].
  RecommendedStrategyProvider(ProductInfo product)
    : this._internal(
        (ref) => recommendedStrategy(ref as RecommendedStrategyRef, product),
        from: recommendedStrategyProvider,
        name: r'recommendedStrategyProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recommendedStrategyHash,
        dependencies: RecommendedStrategyFamily._dependencies,
        allTransitiveDependencies:
            RecommendedStrategyFamily._allTransitiveDependencies,
        product: product,
      );

  RecommendedStrategyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final ProductInfo product;

  @override
  Override overrideWith(
    FutureOr<SugarSwapStrategy> Function(RecommendedStrategyRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecommendedStrategyProvider._internal(
        (ref) => create(ref as RecommendedStrategyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SugarSwapStrategy> createElement() {
    return _RecommendedStrategyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecommendedStrategyProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecommendedStrategyRef
    on AutoDisposeFutureProviderRef<SugarSwapStrategy> {
  /// The parameter `product` of this provider.
  ProductInfo get product;
}

class _RecommendedStrategyProviderElement
    extends AutoDisposeFutureProviderElement<SugarSwapStrategy>
    with RecommendedStrategyRef {
  _RecommendedStrategyProviderElement(super.provider);

  @override
  ProductInfo get product => (origin as RecommendedStrategyProvider).product;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
