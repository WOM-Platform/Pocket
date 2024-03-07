// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totem_dialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotemResponseImpl _$$TotemResponseImplFromJson(Map<String, dynamic> json) =>
    _$TotemResponseImpl(
      status: json['status'] as String,
      sessionId: json['sessionId'] as String?,
      eventId: json['eventId'] as String?,
      link: json['link'] as String?,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$$TotemResponseImplToJson(_$TotemResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sessionId': instance.sessionId,
      'eventId': instance.eventId,
      'link': instance.link,
      'pin': instance.pin,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totemNotifierHash() => r'65f66a9e491d839edbe2e8fde2f0581181897e02';

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

abstract class _$TotemNotifier
    extends BuildlessAutoDisposeNotifier<TotemDialogState> {
  late final TotemData totemData;

  TotemDialogState build(
    TotemData totemData,
  );
}

/// See also [TotemNotifier].
@ProviderFor(TotemNotifier)
const totemNotifierProvider = TotemNotifierFamily();

/// See also [TotemNotifier].
class TotemNotifierFamily extends Family<TotemDialogState> {
  /// See also [TotemNotifier].
  const TotemNotifierFamily();

  /// See also [TotemNotifier].
  TotemNotifierProvider call(
    TotemData totemData,
  ) {
    return TotemNotifierProvider(
      totemData,
    );
  }

  @override
  TotemNotifierProvider getProviderOverride(
    covariant TotemNotifierProvider provider,
  ) {
    return call(
      provider.totemData,
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
  String? get name => r'totemNotifierProvider';
}

/// See also [TotemNotifier].
class TotemNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TotemNotifier, TotemDialogState> {
  /// See also [TotemNotifier].
  TotemNotifierProvider(
    TotemData totemData,
  ) : this._internal(
          () => TotemNotifier()..totemData = totemData,
          from: totemNotifierProvider,
          name: r'totemNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$totemNotifierHash,
          dependencies: TotemNotifierFamily._dependencies,
          allTransitiveDependencies:
              TotemNotifierFamily._allTransitiveDependencies,
          totemData: totemData,
        );

  TotemNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.totemData,
  }) : super.internal();

  final TotemData totemData;

  @override
  TotemDialogState runNotifierBuild(
    covariant TotemNotifier notifier,
  ) {
    return notifier.build(
      totemData,
    );
  }

  @override
  Override overrideWith(TotemNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TotemNotifierProvider._internal(
        () => create()..totemData = totemData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        totemData: totemData,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TotemNotifier, TotemDialogState>
      createElement() {
    return _TotemNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotemNotifierProvider && other.totemData == totemData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, totemData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TotemNotifierRef on AutoDisposeNotifierProviderRef<TotemDialogState> {
  /// The parameter `totemData` of this provider.
  TotemData get totemData;
}

class _TotemNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TotemNotifier, TotemDialogState>
    with TotemNotifierRef {
  _TotemNotifierProviderElement(super.provider);

  @override
  TotemData get totemData => (origin as TotemNotifierProvider).totemData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
