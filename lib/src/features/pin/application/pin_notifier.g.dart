// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinNotifier)
const pinProvider = PinNotifierProvider._();

final class PinNotifierProvider
    extends $NotifierProvider<PinNotifier, PinState> {
  const PinNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinNotifierHash();

  @$internal
  @override
  PinNotifier create() => PinNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinState>(value),
    );
  }
}

String _$pinNotifierHash() => r'1eed27a6a671dad26dc3b6d5b7a8a6ec57f103cc';

abstract class _$PinNotifier extends $Notifier<PinState> {
  PinState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PinState, PinState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PinState, PinState>,
              PinState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
