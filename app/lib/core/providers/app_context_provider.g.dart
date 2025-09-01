// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_context_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appContextHash() => r'32dd58b5e39ff7ae92c2dc47c2e23691927396a7';

/// Global app context provider that centralizes all app state
/// This provides a single source of truth for all app-wide state
///
/// Copied from [appContext].
@ProviderFor(appContext)
final appContextProvider = AutoDisposeFutureProvider<AppContextState>.internal(
  appContext,
  name: r'appContextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appContextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppContextRef = AutoDisposeFutureProviderRef<AppContextState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
