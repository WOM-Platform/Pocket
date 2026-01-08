// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(carouselController)
final carouselControllerProvider = CarouselControllerProvider._();

final class CarouselControllerProvider
    extends
        $FunctionalProvider<
          CarouselSliderController,
          CarouselSliderController,
          CarouselSliderController
        >
    with $Provider<CarouselSliderController> {
  CarouselControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'carouselControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$carouselControllerHash();

  @$internal
  @override
  $ProviderElement<CarouselSliderController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CarouselSliderController create(Ref ref) {
    return carouselController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CarouselSliderController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CarouselSliderController>(value),
    );
  }
}

String _$carouselControllerHash() =>
    r'70f93e4192213b7c62de7f05d8f28ca3cf38cb5a';
