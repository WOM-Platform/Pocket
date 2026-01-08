// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_totem_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EncryptedTotemNotifier)
final encryptedTotemProvider = EncryptedTotemNotifierFamily._();

final class EncryptedTotemNotifierProvider
    extends $NotifierProvider<EncryptedTotemNotifier, EncryptedTotemState?> {
  EncryptedTotemNotifierProvider._({
    required EncryptedTotemNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'encryptedTotemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$encryptedTotemNotifierHash();

  @override
  String toString() {
    return r'encryptedTotemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EncryptedTotemNotifier create() => EncryptedTotemNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EncryptedTotemState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EncryptedTotemState?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EncryptedTotemNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$encryptedTotemNotifierHash() =>
    r'b99044ff92a428b30b00c80c7617bd45e34a25da';

final class EncryptedTotemNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EncryptedTotemNotifier,
          EncryptedTotemState?,
          EncryptedTotemState?,
          EncryptedTotemState?,
          String
        > {
  EncryptedTotemNotifierFamily._()
    : super(
        retry: null,
        name: r'encryptedTotemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EncryptedTotemNotifierProvider call(String link) =>
      EncryptedTotemNotifierProvider._(argument: link, from: this);

  @override
  String toString() => r'encryptedTotemProvider';
}

abstract class _$EncryptedTotemNotifier
    extends $Notifier<EncryptedTotemState?> {
  late final _$args = ref.$arg as String;
  String get link => _$args;

  EncryptedTotemState? build(String link);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EncryptedTotemState?, EncryptedTotemState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EncryptedTotemState?, EncryptedTotemState?>,
              EncryptedTotemState?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
