// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appRepository)
final appRepositoryProvider = AppRepositoryProvider._();

final class AppRepositoryProvider
    extends $FunctionalProvider<AppRepository, AppRepository, AppRepository>
    with $Provider<AppRepository> {
  AppRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRepository create(Ref ref) {
    return appRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRepository>(value),
    );
  }
}

String _$appRepositoryHash() => r'187c7775c4caed9d764898ff8c52f226b81cdce2';
