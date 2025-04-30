// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$importNotifierHash() => r'3d0a680639d9bee98d35aa538e5bacb34ad1d74b';

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

abstract class _$ImportNotifier
    extends BuildlessAutoDisposeNotifier<ImportState> {
  late final DeepLinkModel deepLinkModel;

  ImportState build(
    DeepLinkModel deepLinkModel,
  );
}

/// See also [ImportNotifier].
@ProviderFor(ImportNotifier)
const importNotifierProvider = ImportNotifierFamily();

/// See also [ImportNotifier].
class ImportNotifierFamily extends Family<ImportState> {
  /// See also [ImportNotifier].
  const ImportNotifierFamily();

  /// See also [ImportNotifier].
  ImportNotifierProvider call(
    DeepLinkModel deepLinkModel,
  ) {
    return ImportNotifierProvider(
      deepLinkModel,
    );
  }

  @override
  ImportNotifierProvider getProviderOverride(
    covariant ImportNotifierProvider provider,
  ) {
    return call(
      provider.deepLinkModel,
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
  String? get name => r'importNotifierProvider';
}

/// See also [ImportNotifier].
class ImportNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ImportNotifier, ImportState> {
  /// See also [ImportNotifier].
  ImportNotifierProvider(
    DeepLinkModel deepLinkModel,
  ) : this._internal(
          () => ImportNotifier()..deepLinkModel = deepLinkModel,
          from: importNotifierProvider,
          name: r'importNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$importNotifierHash,
          dependencies: ImportNotifierFamily._dependencies,
          allTransitiveDependencies:
              ImportNotifierFamily._allTransitiveDependencies,
          deepLinkModel: deepLinkModel,
        );

  ImportNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deepLinkModel,
  }) : super.internal();

  final DeepLinkModel deepLinkModel;

  @override
  ImportState runNotifierBuild(
    covariant ImportNotifier notifier,
  ) {
    return notifier.build(
      deepLinkModel,
    );
  }

  @override
  Override overrideWith(ImportNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImportNotifierProvider._internal(
        () => create()..deepLinkModel = deepLinkModel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deepLinkModel: deepLinkModel,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ImportNotifier, ImportState>
      createElement() {
    return _ImportNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportNotifierProvider &&
        other.deepLinkModel == deepLinkModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deepLinkModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ImportNotifierRef on AutoDisposeNotifierProviderRef<ImportState> {
  /// The parameter `deepLinkModel` of this provider.
  DeepLinkModel get deepLinkModel;
}

class _ImportNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ImportNotifier, ImportState>
    with ImportNotifierRef {
  _ImportNotifierProviderElement(super.provider);

  @override
  DeepLinkModel get deepLinkModel =>
      (origin as ImportNotifierProvider).deepLinkModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
