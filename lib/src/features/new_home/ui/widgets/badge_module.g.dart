// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BadgeModuleNotifier)
const badgeModuleProvider = BadgeModuleNotifierProvider._();

final class BadgeModuleNotifierProvider
    extends $NotifierProvider<BadgeModuleNotifier, int> {
  const BadgeModuleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'badgeModuleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$badgeModuleNotifierHash();

  @$internal
  @override
  BadgeModuleNotifier create() => BadgeModuleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$badgeModuleNotifierHash() =>
    r'8d2d5024e3e7eaccc537fb53d246d56e25c0ad9b';

abstract class _$BadgeModuleNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
