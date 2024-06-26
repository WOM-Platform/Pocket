import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';

part 'carousel.g.dart';

@riverpod
CarouselController getCarouselController(GetCarouselControllerRef ref) {
  return CarouselController();
}

class ListingCarouselWidget extends ConsumerWidget {
  final List<POSMap> items;

  const ListingCarouselWidget(this.items, {Key? key}) : super(key: key);

  void onPageChanged(
      POSMap item, int index, CarouselPageChangedReason reason, WidgetRef ref) {
    if (reason == CarouselPageChangedReason.manual) {
      final markerId = MarkerId(item.id);
      print(ref.read(mapControllerNotifierProvider));
      ref.read(mapControllerNotifierProvider)?.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(item.position.latitude, item.position.longitude),
            ),
          );
      // ref.read(markerNotifierProvider.notifier).selectMarker(markerId);
      ref
          .read(mapControllerNotifierProvider)
          ?.isMarkerInfoWindowShown(markerId)
          .then(
        (value) {
          if (!value) {
            ref
                .read(mapControllerNotifierProvider)
                ?.showMarkerInfoWindow(markerId);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final items = ref.watch(filteredStoresProvider).asData?.value ?? [];

    // final items = ref.watch(filterListProvider);
    if (items.isEmpty) return const SizedBox.shrink();
    print('ListingCarouselWidget there are ${items.length}');
    return CarouselSlider.builder(
      carouselController: ref.watch(getCarouselControllerProvider),
      options: CarouselOptions(
        height: 116,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) =>
            onPageChanged(items[index], index, reason, ref),
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return CarouselItem(store: items[index]);
      },
    );
  }
}

class CarouselItem extends StatelessWidget {
  final POSMap store;

  const CarouselItem({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 8.0),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        Characters(store.name).toList().join('\u{200B}'),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      if (store.url != null)
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Utils.launchUrl(store.url!);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        SuggestionScreen(url: store.url!)));
                              },
                              child: Text(
                                store.url!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
