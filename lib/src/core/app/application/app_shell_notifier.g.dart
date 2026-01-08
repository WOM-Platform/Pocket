// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shell_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppShellNotifier)
final appShellProvider = AppShellNotifierProvider._();

final class AppShellNotifierProvider
    extends $NotifierProvider<AppShellNotifier, AppShellState> {
  AppShellNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appShellProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appShellNotifierHash();

  @$internal
  @override
  AppShellNotifier create() => AppShellNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppShellState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppShellState>(value),
    );
  }
}

String _$appShellNotifierHash() => r'018eede1bde52912922bc7005e8fddd64407924c';

abstract class _$AppShellNotifier extends $Notifier<AppShellState> {
  AppShellState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppShellState, AppShellState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppShellState, AppShellState>,
              AppShellState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
