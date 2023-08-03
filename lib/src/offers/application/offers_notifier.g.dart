// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offersNotifierHash() => r'd1f59fb5a8166ae3587d45922d68bdb3ad9193fa';

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

abstract class _$OffersNotifier extends BuildlessAsyncNotifier<List<OfferPOS>> {
  late final LatLng? position;

  FutureOr<List<OfferPOS>> build(
    LatLng? position,
  );
}

/// See also [OffersNotifier].
@ProviderFor(OffersNotifier)
const offersNotifierProvider = OffersNotifierFamily();

/// See also [OffersNotifier].
class OffersNotifierFamily extends Family<AsyncValue<List<OfferPOS>>> {
  /// See also [OffersNotifier].
  const OffersNotifierFamily();

  /// See also [OffersNotifier].
  OffersNotifierProvider call(
    LatLng? position,
  ) {
    return OffersNotifierProvider(
      position,
    );
  }

  @override
  OffersNotifierProvider getProviderOverride(
    covariant OffersNotifierProvider provider,
  ) {
    return call(
      provider.position,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'offersNotifierProvider';
}

/// See also [OffersNotifier].
class OffersNotifierProvider
    extends AsyncNotifierProviderImpl<OffersNotifier, List<OfferPOS>> {
  /// See also [OffersNotifier].
  OffersNotifierProvider(
    this.position,
  ) : super.internal(
          () => OffersNotifier()..position = position,
          from: offersNotifierProvider,
          name: r'offersNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$offersNotifierHash,
          dependencies: OffersNotifierFamily._dependencies,
          allTransitiveDependencies:
              OffersNotifierFamily._allTransitiveDependencies,
        );

  final LatLng? position;

  @override
  bool operator ==(Object other) {
    return other is OffersNotifierProvider && other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<OfferPOS>> runNotifierBuild(
    covariant OffersNotifier notifier,
  ) {
    return notifier.build(
      position,
    );
  }
}

String _$locationNotifierHash() => r'4219d9e58833e81041499a11936629f489de60b0';

/// See also [LocationNotifier].
@ProviderFor(LocationNotifier)
final locationNotifierProvider =
    AsyncNotifierProvider<LocationNotifier, LatLng>.internal(
  LocationNotifier.new,
  name: r'locationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationNotifier = AsyncNotifier<LatLng>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
