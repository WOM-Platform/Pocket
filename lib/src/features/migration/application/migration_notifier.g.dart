// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MigrationNotifier)
final migrationProvider = MigrationNotifierProvider._();

final class MigrationNotifierProvider
    extends $NotifierProvider<MigrationNotifier, MigrationState> {
  MigrationNotifierProvider._()
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

String _$migrationNotifierHash() => r'7dfd7d2e79cc91546f3efbdf6097461b047cecf7';

abstract class _$MigrationNotifier extends $Notifier<MigrationState> {
  MigrationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MigrationState, MigrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MigrationState, MigrationState>,
              MigrationState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
