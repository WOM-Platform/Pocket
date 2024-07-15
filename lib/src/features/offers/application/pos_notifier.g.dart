// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPosHash() => r'9e5c572fc4d70a340a1f1e3a63be0d0ef669f3bb';

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

/// See also [getPos].
@ProviderFor(getPos)
const getPosProvider = GetPosFamily();

/// See also [getPos].
class GetPosFamily extends Family<AsyncValue<PhysicalPOS>> {
  /// See also [getPos].
  const GetPosFamily();

  /// See also [getPos].
  GetPosProvider call(
    String posID,
  ) {
    return GetPosProvider(
      posID,
    );
  }

  @override
  GetPosProvider getProviderOverride(
    covariant GetPosProvider provider,
  ) {
    return call(
      provider.posID,
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
  String? get name => r'getPosProvider';
}

/// See also [getPos].
class GetPosProvider extends FutureProvider<PhysicalPOS> {
  /// See also [getPos].
  GetPosProvider(
    String posID,
  ) : this._internal(
          (ref) => getPos(
            ref as GetPosRef,
            posID,
          ),
          from: getPosProvider,
          name: r'getPosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPosHash,
          dependencies: GetPosFamily._dependencies,
          allTransitiveDependencies: GetPosFamily._allTransitiveDependencies,
          posID: posID,
        );

  GetPosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.posID,
  }) : super.internal();

  final String posID;

  @override
  Override overrideWith(
    FutureOr<PhysicalPOS> Function(GetPosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPosProvider._internal(
        (ref) => create(ref as GetPosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        posID: posID,
      ),
    );
  }

  @override
  FutureProviderElement<PhysicalPOS> createElement() {
    return _GetPosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPosProvider && other.posID == posID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, posID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPosRef on FutureProviderRef<PhysicalPOS> {
  /// The parameter `posID` of this provider.
  String get posID;
}

class _GetPosProviderElement extends FutureProviderElement<PhysicalPOS>
    with GetPosRef {
  _GetPosProviderElement(super.provider);

  @override
  String get posID => (origin as GetPosProvider).posID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
