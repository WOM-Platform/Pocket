import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/offers/ui/pos_details_screen.dart';
import 'package:wom_pocket/src/offers/ui/search_button.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';

import '../../utils/colors.dart';

final carouselControllerProvider =
    Provider.autoDispose<CarouselController>((ref) {
  return CarouselController();
});

class ListingCarouselWidget extends ConsumerWidget {
  //
  const ListingCarouselWidget({Key? key}) : super(key: key);

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
    final data = ref.watch(offersMapNotifierProvider).valueOrNull;
    final enabled = ref.watch(enableCarouselProvider);

    if (!enabled || data == null || data.isLoading || data.offers.isEmpty)
      return const SizedBox.shrink();
    print('ListingCarouselWidget there are ${data.offers}');
    return CarouselSlider.builder(
      carouselController: ref.watch(carouselControllerProvider),
      options: CarouselOptions(
        height: 116,
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
            builder: (_) => POSDetailsScreen(
              posName: pos.name,
              distance: pos.distance,
              url: pos.url,
              offers: pos.offers,
              imageUrl: pos.cover?.midDensityFullWidthUrl,
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
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
                  '${pos.offers.length} ${pos.offers.length == 1 ? AppLocalizations.of(context)!.translate('offer') : AppLocalizations.of(context)!.translate('offers').toLowerCase()} ${pos.offers.length == 1 ? AppLocalizations.of(context)!.translate('active') : AppLocalizations.of(context)!.translate('activePlural')}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                if (pos.url != null)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SuggestionScreen(url: pos.url!)));
                        },
                        child: Text(
                          pos.url!,
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
