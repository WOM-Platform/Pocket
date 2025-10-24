// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationNotifier)
const locationProvider = LocationNotifierProvider._();

final class LocationNotifierProvider
    extends $AsyncNotifierProvider<LocationNotifier, Position> {
  const LocationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationNotifierHash();

  @$internal
  @override
  LocationNotifier create() => LocationNotifier();
}

String _$locationNotifierHash() => r'92ca4046f01f889752e6cdc494899c804f6c3341';

abstract class _$LocationNotifier extends $AsyncNotifier<Position> {
  FutureOr<Position> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Position>, Position>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Position>, Position>,
              AsyncValue<Position>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getPosition)
const getPositionProvider = GetPositionProvider._();

final class GetPositionProvider
    extends
        $FunctionalProvider<AsyncValue<Position>, Position, FutureOr<Position>>
    with $FutureModifier<Position>, $FutureProvider<Position> {
  const GetPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPositionHash();

  @$internal
  @override
  $FutureProviderElement<Position> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Position> create(Ref ref) {
    return getPosition(ref);
  }
}

String _$getPositionHash() => r'66f90c4c5cf459d3824e00dc43a1e04e5f693682';
