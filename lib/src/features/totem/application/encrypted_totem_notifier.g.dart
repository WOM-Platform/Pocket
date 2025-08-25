// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_totem_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$encryptedTotemNotifierHash() =>
    r'b99044ff92a428b30b00c80c7617bd45e34a25da';

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

abstract class _$EncryptedTotemNotifier
    extends BuildlessAutoDisposeNotifier<EncryptedTotemState?> {
  late final String link;

  EncryptedTotemState? build(
    String link,
  );
}

/// See also [EncryptedTotemNotifier].
@ProviderFor(EncryptedTotemNotifier)
const encryptedTotemNotifierProvider = EncryptedTotemNotifierFamily();

/// See also [EncryptedTotemNotifier].
class EncryptedTotemNotifierFamily extends Family<EncryptedTotemState?> {
  /// See also [EncryptedTotemNotifier].
  const EncryptedTotemNotifierFamily();

  /// See also [EncryptedTotemNotifier].
  EncryptedTotemNotifierProvider call(
    String link,
  ) {
    return EncryptedTotemNotifierProvider(
      link,
    );
  }

  @override
  EncryptedTotemNotifierProvider getProviderOverride(
    covariant EncryptedTotemNotifierProvider provider,
  ) {
    return call(
      provider.link,
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
  String? get name => r'encryptedTotemNotifierProvider';
}

/// See also [EncryptedTotemNotifier].
class EncryptedTotemNotifierProvider extends AutoDisposeNotifierProviderImpl<
    EncryptedTotemNotifier, EncryptedTotemState?> {
  /// See also [EncryptedTotemNotifier].
  EncryptedTotemNotifierProvider(
    String link,
  ) : this._internal(
          () => EncryptedTotemNotifier()..link = link,
          from: encryptedTotemNotifierProvider,
          name: r'encryptedTotemNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$encryptedTotemNotifierHash,
          dependencies: EncryptedTotemNotifierFamily._dependencies,
          allTransitiveDependencies:
              EncryptedTotemNotifierFamily._allTransitiveDependencies,
          link: link,
        );

  EncryptedTotemNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.link,
  }) : super.internal();

  final String link;

  @override
  EncryptedTotemState? runNotifierBuild(
    covariant EncryptedTotemNotifier notifier,
  ) {
    return notifier.build(
      link,
    );
  }

  @override
  Override overrideWith(EncryptedTotemNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: EncryptedTotemNotifierProvider._internal(
        () => create()..link = link,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        link: link,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EncryptedTotemNotifier,
      EncryptedTotemState?> createElement() {
    return _EncryptedTotemNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EncryptedTotemNotifierProvider && other.link == link;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, link.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EncryptedTotemNotifierRef
    on AutoDisposeNotifierProviderRef<EncryptedTotemState?> {
  /// The parameter `link` of this provider.
  String get link;
}

class _EncryptedTotemNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<EncryptedTotemNotifier,
        EncryptedTotemState?> with EncryptedTotemNotifierRef {
  _EncryptedTotemNotifierProviderElement(super.provider);

  @override
  String get link => (origin as EncryptedTotemNotifierProvider).link;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
