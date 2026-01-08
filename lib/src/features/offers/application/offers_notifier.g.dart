// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OffersNotifier)
final offersProvider = OffersNotifierFamily._();

final class OffersNotifierProvider
    extends $AsyncNotifierProvider<OffersNotifier, List<OfferPOS>> {
  OffersNotifierProvider._({
    required OffersNotifierFamily super.from,
    required LatLng? super.argument,
  }) : super(
         retry: null,
         name: r'offersProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$offersNotifierHash();

  @override
  String toString() {
    return r'offersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OffersNotifier create() => OffersNotifier();

  @override
  bool operator ==(Object other) {
    return other is OffersNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$offersNotifierHash() => r'31ffacb274da87e418c4d92a81be5f1b70d17df1';

final class OffersNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          OffersNotifier,
          AsyncValue<List<OfferPOS>>,
          List<OfferPOS>,
          FutureOr<List<OfferPOS>>,
          LatLng?
        > {
  OffersNotifierFamily._()
    : super(
        retry: null,
        name: r'offersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  OffersNotifierProvider call(LatLng? position) =>
      OffersNotifierProvider._(argument: position, from: this);

  @override
  String toString() => r'offersProvider';
}

abstract class _$OffersNotifier extends $AsyncNotifier<List<OfferPOS>> {
  late final _$args = ref.$arg as LatLng?;
  LatLng? get position => _$args;

  FutureOr<List<OfferPOS>> build(LatLng? position);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<OfferPOS>>, List<OfferPOS>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<OfferPOS>>, List<OfferPOS>>,
              AsyncValue<List<OfferPOS>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
