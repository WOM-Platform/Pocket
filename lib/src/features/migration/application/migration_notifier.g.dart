// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MigrationNotifier)
const migrationProvider = MigrationNotifierProvider._();

final class MigrationNotifierProvider
    extends $NotifierProvider<MigrationNotifier, MigrationState> {
  const MigrationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'migrationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$migrationNotifierHash();

  @$internal
  @override
  MigrationNotifier create() => MigrationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MigrationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MigrationState>(value),
    );
  }
}

String _$migrationNotifierHash() => r'bf8eaabba9d36566ed6918d5c4d7e888bb3f506b';

abstract class _$MigrationNotifier extends $Notifier<MigrationState> {
  MigrationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MigrationState, MigrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MigrationState, MigrationState>,
              MigrationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
