// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offersMapNotifierHash() => r'a6d33873e2e51c267a7a69bb256d818761695b79';

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

abstract class _$OffersMapNotifier
    extends BuildlessAutoDisposeAsyncNotifier<OffersMapData> {
  late final LatLng? position;

  FutureOr<OffersMapData> build(
    LatLng? position,
  );
}

/// See also [OffersMapNotifier].
@ProviderFor(OffersMapNotifier)
const offersMapNotifierProvider = OffersMapNotifierFamily();

/// See also [OffersMapNotifier].
class OffersMapNotifierFamily extends Family<AsyncValue<OffersMapData>> {
  /// See also [OffersMapNotifier].
  const OffersMapNotifierFamily();

  /// See also [OffersMapNotifier].
  OffersMapNotifierProvider call(
    LatLng? position,
  ) {
    return OffersMapNotifierProvider(
      position,
    );
  }

  @override
  OffersMapNotifierProvider getProviderOverride(
    covariant OffersMapNotifierProvider provider,
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
  String? get name => r'offersMapNotifierProvider';
}

/// See also [OffersMapNotifier].
class OffersMapNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    OffersMapNotifier, OffersMapData> {
  /// See also [OffersMapNotifier].
  OffersMapNotifierProvider(
    this.position,
  ) : super.internal(
          () => OffersMapNotifier()..position = position,
          from: offersMapNotifierProvider,
          name: r'offersMapNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$offersMapNotifierHash,
          dependencies: OffersMapNotifierFamily._dependencies,
          allTransitiveDependencies:
              OffersMapNotifierFamily._allTransitiveDependencies,
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
    covariant OffersMapNotifier notifier,
  ) {
    return notifier.build(
      position,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
