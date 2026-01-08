// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OffersMapNotifier)
final offersMapProvider = OffersMapNotifierFamily._();

final class OffersMapNotifierProvider
    extends $AsyncNotifierProvider<OffersMapNotifier, OffersMapData> {
  OffersMapNotifierProvider._({
    required OffersMapNotifierFamily super.from,
    required LatLng? super.argument,
  }) : super(
         retry: null,
         name: r'offersMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$offersMapNotifierHash();

  @override
  String toString() {
    return r'offersMapProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OffersMapNotifier create() => OffersMapNotifier();

  @override
  bool operator ==(Object other) {
    return other is OffersMapNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$offersMapNotifierHash() => r'8319d95386bab526496035dccdfcd0778d4c6f46';

final class OffersMapNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          OffersMapNotifier,
          AsyncValue<OffersMapData>,
          OffersMapData,
          FutureOr<OffersMapData>,
          LatLng?
        > {
  OffersMapNotifierFamily._()
    : super(
        retry: null,
        name: r'offersMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OffersMapNotifierProvider call(LatLng? position) =>
      OffersMapNotifierProvider._(argument: position, from: this);

  @override
  String toString() => r'offersMapProvider';
}

abstract class _$OffersMapNotifier extends $AsyncNotifier<OffersMapData> {
  late final _$args = ref.$arg as LatLng?;
  LatLng? get position => _$args;

  FutureOr<OffersMapData> build(LatLng? position);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<OffersMapData>, OffersMapData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OffersMapData>, OffersMapData>,
              AsyncValue<OffersMapData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
