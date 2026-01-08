// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totem_dialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TotemResponse _$TotemResponseFromJson(Map<String, dynamic> json) =>
    _TotemResponse(
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

Map<String, dynamic> _$TotemResponseToJson(_TotemResponse instance) =>
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

_TotemMetadata _$TotemMetadataFromJson(Map<String, dynamic> json) =>
    _TotemMetadata(
      url: json['url'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$TotemMetadataToJson(_TotemMetadata instance) =>
    <String, dynamic>{
      'url': instance.url,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TotemNotifier)
final totemProvider = TotemNotifierFamily._();

final class TotemNotifierProvider
    extends $NotifierProvider<TotemNotifier, TotemDialogState> {
  TotemNotifierProvider._({
    required TotemNotifierFamily super.from,
    required (TotemData, {bool askGender}) super.argument,
  }) : super(
         retry: null,
         name: r'totemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$totemNotifierHash();

  @override
  String toString() {
    return r'totemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TotemNotifier create() => TotemNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TotemDialogState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TotemDialogState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TotemNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$totemNotifierHash() => r'79c5fadd510ac8722065c7937cad38cb87e306a2';

final class TotemNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TotemNotifier,
          TotemDialogState,
          TotemDialogState,
          TotemDialogState,
          (TotemData, {bool askGender})
        > {
  TotemNotifierFamily._()
    : super(
        retry: null,
        name: r'totemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TotemNotifierProvider call(TotemData totemData, {bool askGender = true}) =>
      TotemNotifierProvider._(
        argument: (totemData, askGender: askGender),
        from: this,
      );

  @override
  String toString() => r'totemProvider';
}

abstract class _$TotemNotifier extends $Notifier<TotemDialogState> {
  late final _$args = ref.$arg as (TotemData, {bool askGender});
  TotemData get totemData => _$args.$1;
  bool get askGender => _$args.askGender;

  TotemDialogState build(TotemData totemData, {bool askGender = true});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TotemDialogState, TotemDialogState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TotemDialogState, TotemDialogState>,
              TotemDialogState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(_$args.$1, askGender: _$args.askGender),
    );
  }
}
