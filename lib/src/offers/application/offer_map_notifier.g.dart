// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_map_notifier.dart';

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

String _$OffersMapNotifierHash() => r'df6c53a4a27d26a92346aefdd1e49cf48b673401';

/// See also [OffersMapNotifier].
class OffersMapNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    OffersMapNotifier, OffersMapData> {
  OffersMapNotifierProvider(
    this.position,
  ) : super(
          () => OffersMapNotifier()..position = position,
          from: offersMapNotifierProvider,
          name: r'offersMapNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$OffersMapNotifierHash,
        );

  final LatLng? position;

  @override
  bool operator ==(Object other) {
    return other is OffersMapNotifierProvider && other.position == position;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, position.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<OffersMapData> runNotifierBuild(
    covariant _$OffersMapNotifier notifier,
  ) {
    return notifier.build(
      position,
    );
  }
}

typedef OffersMapNotifierRef
    = AutoDisposeAsyncNotifierProviderRef<OffersMapData>;

/// See also [OffersMapNotifier].
final offersMapNotifierProvider = OffersMapNotifierFamily();

class OffersMapNotifierFamily extends Family<AsyncValue<OffersMapData>> {
  OffersMapNotifierFamily();

  OffersMapNotifierProvider call(
    LatLng? position,
  ) {
    return OffersMapNotifierProvider(
      position,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<OffersMapNotifier, OffersMapData>
      getProviderOverride(
    covariant OffersMapNotifierProvider provider,
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
  String? get name => r'offersMapNotifierProvider';
}

abstract class _$OffersMapNotifier
    extends BuildlessAutoDisposeAsyncNotifier<OffersMapData> {
  late final LatLng? position;

  FutureOr<OffersMapData> build(
    LatLng? position,
  );
}
