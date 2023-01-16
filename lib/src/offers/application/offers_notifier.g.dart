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

String _$OffersNotifierHash() => r'a6cb60cb715c817b2b1f14b5ccf0064523a2f245';

/// See also [OffersNotifier].
final offersNotifierProvider =
    AsyncNotifierProvider<OffersNotifier, List<OfferPOS>>(
  OffersNotifier.new,
  name: r'offersNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$OffersNotifierHash,
);
typedef OffersNotifierRef = AsyncNotifierProviderRef<List<OfferPOS>>;

abstract class _$OffersNotifier extends AsyncNotifier<List<OfferPOS>> {
  @override
  FutureOr<List<OfferPOS>> build();
}

String _$OffersMapNotifierHash() => r'482ca11b7b3aa26af6037b69aa11a44f269ec117';

/// See also [OffersMapNotifier].
final offersMapNotifierProvider =
    AutoDisposeAsyncNotifierProvider<OffersMapNotifier, OffersMapData>(
  OffersMapNotifier.new,
  name: r'offersMapNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$OffersMapNotifierHash,
);
typedef OffersMapNotifierRef
    = AutoDisposeAsyncNotifierProviderRef<OffersMapData>;

abstract class _$OffersMapNotifier
    extends AutoDisposeAsyncNotifier<OffersMapData> {
  @override
  FutureOr<OffersMapData> build();
}

String _$LocationNotifierHash() => r'd5fe30ba97de4f22832f5b4a9c040232ebd54a75';

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
