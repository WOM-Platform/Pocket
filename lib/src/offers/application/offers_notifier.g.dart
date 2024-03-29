// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$OffersNotifierHash() => r'd1f59fb5a8166ae3587d45922d68bdb3ad9193fa';

/// See also [OffersNotifier].
class OffersNotifierProvider
    extends AsyncNotifierProviderImpl<OffersNotifier, List<OfferPOS>> {
  OffersNotifierProvider(
    this.position,
  ) : super(
          () => OffersNotifier()..position = position,
          from: offersNotifierProvider,
          name: r'offersNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$OffersNotifierHash,
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
    covariant _$OffersNotifier notifier,
  ) {
    return notifier.build(
      position,
    );
  }
}

typedef OffersNotifierRef = AsyncNotifierProviderRef<List<OfferPOS>>;

/// See also [OffersNotifier].
final offersNotifierProvider = OffersNotifierFamily();

class OffersNotifierFamily extends Family<AsyncValue<List<OfferPOS>>> {
  OffersNotifierFamily();

  OffersNotifierProvider call(
    LatLng? position,
  ) {
    return OffersNotifierProvider(
      position,
    );
  }

  @override
  AsyncNotifierProviderImpl<OffersNotifier, List<OfferPOS>> getProviderOverride(
    covariant OffersNotifierProvider provider,
  ) {
    return call(
      provider.position,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'offersNotifierProvider';
}

abstract class _$OffersNotifier extends BuildlessAsyncNotifier<List<OfferPOS>> {
  late final LatLng? position;

  FutureOr<List<OfferPOS>> build(
    LatLng? position,
  );
}

String _$LocationNotifierHash() => r'4219d9e58833e81041499a11936629f489de60b0';

/// See also [LocationNotifier].
final locationNotifierProvider =
    AsyncNotifierProvider<LocationNotifier, LatLng>(
  LocationNotifier.new,
  name: r'locationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$LocationNotifierHash,
);
typedef LocationNotifierRef = AsyncNotifierProviderRef<LatLng>;

abstract class _$LocationNotifier extends AsyncNotifier<LatLng> {
  @override
  FutureOr<LatLng> build();
}
