// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getNFCBackground)
final getNFCBackgroundProvider = GetNFCBackgroundProvider._();

final class GetNFCBackgroundProvider
    extends $FunctionalProvider<NfcBackground, NfcBackground, NfcBackground>
    with $Provider<NfcBackground> {
  GetNFCBackgroundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNFCBackgroundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNFCBackgroundHash();

  @$internal
  @override
  $ProviderElement<NfcBackground> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NfcBackground create(Ref ref) {
    return getNFCBackground(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NfcBackground value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NfcBackground>(value),
    );
  }
}

String _$getNFCBackgroundHash() => r'2901de39a46e5a088ecbdf703de96b6ecd576e95';

@ProviderFor(getNfcIntent)
final getNfcIntentProvider = GetNfcIntentProvider._();

final class GetNfcIntentProvider
    extends
        $FunctionalProvider<AsyncValue<TotemData>, TotemData, Stream<TotemData>>
    with $FutureModifier<TotemData>, $StreamProvider<TotemData> {
  GetNfcIntentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNfcIntentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNfcIntentHash();

  @$internal
  @override
  $StreamProviderElement<TotemData> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<TotemData> create(Ref ref) {
    return getNfcIntent(ref);
  }
}

String _$getNfcIntentHash() => r'2b2f8f892c939532433b39fe831fad8174b3004a';

@ProviderFor(NfcBackgroundNotifier)
final nfcBackgroundProvider = NfcBackgroundNotifierProvider._();

final class NfcBackgroundNotifierProvider
    extends $AsyncNotifierProvider<NfcBackgroundNotifier, TotemData?> {
  NfcBackgroundNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nfcBackgroundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nfcBackgroundNotifierHash();

  @$internal
  @override
  NfcBackgroundNotifier create() => NfcBackgroundNotifier();
}

String _$nfcBackgroundNotifierHash() =>
    r'282b755e1856d3ccdf339e908fb3679c5137434b';

abstract class _$NfcBackgroundNotifier extends $AsyncNotifier<TotemData?> {
  FutureOr<TotemData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TotemData?>, TotemData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TotemData?>, TotemData?>,
              AsyncValue<TotemData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
