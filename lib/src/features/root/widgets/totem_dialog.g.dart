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
      eventName: json['eventName'] as String?,
      providerName: json['providerName'] as String?,
      sessionName: json['sessionName'] as String?,
      totemName: json['totemName'] as String?,
      metadata: json['metadata'] == null
          ? null
          : TotemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TotemResponseImplToJson(_$TotemResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sessionId': instance.sessionId,
      'eventId': instance.eventId,
      'link': instance.link,
      'pin': instance.pin,
      'eventName': instance.eventName,
      'providerName': instance.providerName,
      'sessionName': instance.sessionName,
      'totemName': instance.totemName,
      'metadata': instance.metadata,
    };

_$TotemMetadataImpl _$$TotemMetadataImplFromJson(Map<String, dynamic> json) =>
    _$TotemMetadataImpl(
      url: json['url'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$TotemMetadataImplToJson(_$TotemMetadataImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totemNotifierHash() => r'94bc3e622baec98ea18d019281862a78470bcb63';

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
  late final bool askGender;

  TotemDialogState build(
    TotemData totemData, {
    bool askGender = true,
  });
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
    TotemData totemData, {
    bool askGender = true,
  }) {
    return TotemNotifierProvider(
      totemData,
      askGender: askGender,
    );
  }

  @override
  TotemNotifierProvider getProviderOverride(
    covariant TotemNotifierProvider provider,
  ) {
    return call(
      provider.totemData,
      askGender: provider.askGender,
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
    TotemData totemData, {
    bool askGender = true,
  }) : this._internal(
          () => TotemNotifier()
            ..totemData = totemData
            ..askGender = askGender,
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
          askGender: askGender,
        );

  TotemNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.totemData,
    required this.askGender,
  }) : super.internal();

  final TotemData totemData;
  final bool askGender;

  @override
  TotemDialogState runNotifierBuild(
    covariant TotemNotifier notifier,
  ) {
    return notifier.build(
      totemData,
      askGender: askGender,
    );
  }

  @override
  Override overrideWith(TotemNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TotemNotifierProvider._internal(
        () => create()
          ..totemData = totemData
          ..askGender = askGender,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        totemData: totemData,
        askGender: askGender,
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
    return other is TotemNotifierProvider &&
        other.totemData == totemData &&
        other.askGender == askGender;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, totemData.hashCode);
    hash = _SystemHash.combine(hash, askGender.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TotemNotifierRef on AutoDisposeNotifierProviderRef<TotemDialogState> {
  /// The parameter `totemData` of this provider.
  TotemData get totemData;

  /// The parameter `askGender` of this provider.
  bool get askGender;
}

class _TotemNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TotemNotifier, TotemDialogState>
    with TotemNotifierRef {
  _TotemNotifierProviderElement(super.provider);

  @override
  TotemData get totemData => (origin as TotemNotifierProvider).totemData;
  @override
  bool get askGender => (origin as TotemNotifierProvider).askGender;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
