// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(aimRepository)
final aimRepositoryProvider = AimRepositoryProvider._();

final class AimRepositoryProvider
    extends $FunctionalProvider<AimRepository, AimRepository, AimRepository>
    with $Provider<AimRepository> {
  AimRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aimRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aimRepositoryHash();

  @$internal
  @override
  $ProviderElement<AimRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AimRepository create(Ref ref) {
    return aimRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AimRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AimRepository>(value),
    );
  }
}

String _$aimRepositoryHash() => r'bc08454f4e0c5cea482fbf81be3dec4213edfa57';
