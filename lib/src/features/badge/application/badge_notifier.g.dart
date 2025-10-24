// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BadgeNotifier)
const badgeProvider = BadgeNotifierProvider._();

final class BadgeNotifierProvider
    extends $AsyncNotifierProvider<BadgeNotifier, BadgeState> {
  const BadgeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'badgeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$badgeNotifierHash();

  @$internal
  @override
  BadgeNotifier create() => BadgeNotifier();
}

String _$badgeNotifierHash() => r'018d2f4dc212485dd7774856fc14d436d6e05ad1';

abstract class _$BadgeNotifier extends $AsyncNotifier<BadgeState> {
  FutureOr<BadgeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BadgeState>, BadgeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BadgeState>, BadgeState>,
              AsyncValue<BadgeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
