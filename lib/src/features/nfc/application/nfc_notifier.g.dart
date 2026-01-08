// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NFCNotifier)
final nFCProvider = NFCNotifierProvider._();

final class NFCNotifierProvider
    extends $NotifierProvider<NFCNotifier, NFCState> {
  NFCNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nFCProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nFCNotifierHash();

  @$internal
  @override
  NFCNotifier create() => NFCNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NFCState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NFCState>(value),
    );
  }
}

String _$nFCNotifierHash() => r'59c0c9d94ad9e63685b644f234284bc25f0da082';

abstract class _$NFCNotifier extends $Notifier<NFCState> {
  NFCState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NFCState, NFCState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NFCState, NFCState>,
              NFCState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
