import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:wom_pocket/src/offers/application/offer_map_notifier.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/offers/ui/pos_details_screen.dart';
import 'package:wom_pocket/src/offers/ui/search_button.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';

import '../../utils/colors.dart';

final carouselControllerProvider =
Provider.autoDispose<CarouselController>((ref) {
  return CarouselController();
});

final citiesCarouselControllerProvider =
Provider<CarouselController>((ref) {
  return CarouselController();
});

class ListingCarouselWidget extends ConsumerWidget {
  final LatLng? position;
  final Function(LatLng) onTapCity;

  //
  const ListingCarouselWidget({
    Key? key,
    this.position,
    required this.onTapCity,
  }) : super(key: key);

  void onPageChanged(OfferPOS item, int index, CarouselPageChangedReason reason,
      WidgetRef ref) {
    if (reason == CarouselPageChangedReason.manual) {
      final markerId = MarkerId(item.id);
      final controller = ref.read(mapControllerProvider);
      controller
          ?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(item.position.latitude, item.position.longitude),
        ),
      )
          .then((value) {
        controller.isMarkerInfoWindowShown(markerId).then(
              (value) {
            if (!value) {
              controller.showMarkerInfoWindow(markerId);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref
        .watch(offersMapNotifierProvider(position))
        .valueOrNull;
    final enabled = ref.watch(enableCarouselProvider);

    if (!enabled || data == null || data.isLoading || data.offers.isEmpty)
      return const SizedBox.shrink();

    final widgetHeight = 116.0;
    // if (enabled || data.offers.isEmpty) {
    //   return CarouselSlider.builder(
    //     key: ValueKey('cities'),
    //     carouselController: ref.watch(citiesCarouselControllerProvider),
    //     options: CarouselOptions(
    //       height: widgetHeight,
    //       viewportFraction: 0.8,
    //       initialPage: 0,
    //       enableInfiniteScroll: false,
    //       enlargeCenterPage: true,
    //       onPageChanged: (index, reason) {
    //         print('change carousel for $reason to $index');
    //         onTapCity(
    //           LatLng(
    //             cities[index].lat,
    //             cities[index].long,
    //           ),
    //         );
    //       },
    //     ),
    //     itemCount: cities.length,
    //     itemBuilder: (BuildContext context, int index, int realIndex) {
    //       return CityCard(
    //         fontSize: 28,
    //         city: cities[index],
    //         onTap: (){},
    //       );
    //     },
    //   );
    //   return SizedBox(
    //     height: widgetHeight,
    //     child: ListView.builder(
    //       padding: const EdgeInsets.symmetric(horizontal: 16),
    //       scrollDirection: Axis.horizontal,
    //       itemCount: cities.length,
    //       itemBuilder: (
    //         c,
    //         index,
    //       ) {
    //         return CityCard(
    //           city: cities[index],
    //           onTap: () => onTapCity(
    //             LatLng(
    //               cities[index].lat,
    //               cities[index].long,
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }
    print('ListingCarouselWidget there are ${data.offers}');
    return CarouselSlider.builder(
      key: ValueKey('offers'),
      carouselController: ref.watch(carouselControllerProvider),
      options: CarouselOptions(
        height: widgetHeight,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) =>
            onPageChanged(data.offers[index], index, reason, ref),
      ),
      itemCount: data.offers.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return CarouselItem(pos: data.offers[index]);
      },
    );
  }
}

class CarouselItem extends StatelessWidget {
  final OfferPOS pos;

  const CarouselItem({
    Key? key,
    required this.pos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const iconRadius = 14.0;
    // const iconSize = 18.0;

    return InkWell(
      // key: Key(store.storeId),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  POSDetailsScreen(
                    posName: pos.name,
                    description: pos.description,
                    distance: pos.distance,
                    url: pos.url,
                    offers: pos.offers,
                    imageUrl: pos.cover?.midDensityFullWidthUrl,
                    position: pos.position,
                  ),
            ),
          );
        },
        child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Row(
                children: [
                CircleAvatar(
                backgroundColor: lightBlue,
                  backgroundImage: pos.cover?.squareThumbnailUrl != null
                      ? CachedNetworkImageProvider(
                    pos.cover!.squareThumbnailUrl,
                  )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    // Characters(offer.name).toList().join('\u{200B}'),
                    pos.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                  '${pos.offers.length} ${pos.offers.length == 1
                      ? 'offer'.tr()
                      : 'offers'.tr().toLowerCase()} ${pos.offers.length == 1
                      ? 'active'.tr()
                      : 'activePlural'.tr()}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            if (pos.url != null)
        InkWell(
        onTap: ()
    {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SuggestionScreen(url: pos.url!)));
    },
    child: Flexible(
    child: Text(
    pos.url!,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    style:
    TextStyle(decoration: TextDecoration.underline),
    ),
    ),
    )
    ],
    ),
    ),
    ),
    ),
    );
  }
}
