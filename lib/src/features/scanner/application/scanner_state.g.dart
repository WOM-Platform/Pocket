// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScannerNotifier)
final scannerProvider = ScannerNotifierProvider._();

final class ScannerNotifierProvider
    extends $NotifierProvider<ScannerNotifier, ScannerState> {
  ScannerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scannerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scannerNotifierHash();

  @$internal
  @override
  ScannerNotifier create() => ScannerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScannerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScannerState>(value),
    );
  }
}

String _$scannerNotifierHash() => r'041d75693e70ed3f7e3d3e022e2181864d2929e9';

abstract class _$ScannerNotifier extends $Notifier<ScannerState> {
  ScannerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ScannerState, ScannerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScannerState, ScannerState>,
              ScannerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
