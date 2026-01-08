// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pocket)
final pocketProvider = PocketProvider._();

final class PocketProvider extends $FunctionalProvider<Pocket, Pocket, Pocket>
    with $Provider<Pocket> {
  PocketProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pocketProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pocketHash();

  @$internal
  @override
  $ProviderElement<Pocket> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Pocket create(Ref ref) {
    return pocket(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Pocket value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Pocket>(value),
    );
  }
}

String _$pocketHash() => r'700046a232d0452fa0942490a1724d226b4d0775';
