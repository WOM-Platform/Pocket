// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDatabase)
const getDatabaseProvider = GetDatabaseProvider._();

final class GetDatabaseProvider
    extends $FunctionalProvider<MyDatabase, MyDatabase, MyDatabase>
    with $Provider<MyDatabase> {
  const GetDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDatabaseHash();

  @$internal
  @override
  $ProviderElement<MyDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MyDatabase create(Ref ref) {
    return getDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyDatabase>(value),
    );
  }
}

String _$getDatabaseHash() => r'f61cd54c3ca32a99707391f0e315e0a1a1e8d1cf';

@ProviderFor(AimNotifier)
const aimProvider = AimNotifierProvider._();

final class AimNotifierProvider
    extends $AsyncNotifierProvider<AimNotifier, List<Aim>> {
  const AimNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aimProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aimNotifierHash();

  @$internal
  @override
  AimNotifier create() => AimNotifier();
}

String _$aimNotifierHash() => r'3fbcdc3f465164bb327782491cefd796c5ff8a5d';

abstract class _$AimNotifier extends $AsyncNotifier<List<Aim>> {
  FutureOr<List<Aim>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Aim>>, List<Aim>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Aim>>, List<Aim>>,
              AsyncValue<List<Aim>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
