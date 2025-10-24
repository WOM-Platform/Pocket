// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_totem_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyTotemNotifier)
const myTotemProvider = MyTotemNotifierProvider._();

final class MyTotemNotifierProvider
    extends $NotifierProvider<MyTotemNotifier, MyTotemState> {
  const MyTotemNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myTotemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myTotemNotifierHash();

  @$internal
  @override
  MyTotemNotifier create() => MyTotemNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyTotemState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyTotemState>(value),
    );
  }
}

String _$myTotemNotifierHash() => r'55a156d275460906528d3d3398753d99f7add56b';

abstract class _$MyTotemNotifier extends $Notifier<MyTotemState> {
  MyTotemState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MyTotemState, MyTotemState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MyTotemState, MyTotemState>,
              MyTotemState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
