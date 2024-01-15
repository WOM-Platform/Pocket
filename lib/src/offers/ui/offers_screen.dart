import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:wom_pocket/src/application/location_notifier.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/domain/entities/static_cities.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/offers/ui/offer_tile.dart';
import 'package:wom_pocket/src/offers/ui/pos_details_screen.dart';
import 'package:wom_pocket/src/utils/location_exception.dart';
import 'package:wom_pocket/src/utils/location_utils.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

final refreshControllerProvider = Provider<RefreshController>((ref) {
  final c = RefreshController(initialRefresh: false);
  ref.onDispose(() {
    c.dispose();
  });
  return c;
});

class OffersListScreen extends ConsumerWidget {
  const OffersListScreen({Key? key}) : super(key: key);

  void _onRefresh(WidgetRef ref) async {
    ref.invalidate(paginatedVirtualOffersProvider(0));
    ref.invalidate(locationNotifierProvider);
    await ref.read(paginatedVirtualOffersProvider(0).future);
    await ref.read(locationNotifierProvider.future);
    ref.read(refreshControllerProvider).refreshCompleted();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(refreshControllerProvider);
    return Scaffold(
      appBar: PocketAppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => OfferMapsScreen()));
            },
            child: Text('showMap'.tr()),
          )
        ],
      ),
      body: SmartRefresher(
        controller: c,
        enablePullDown: true,
        onRefresh: () => _onRefresh(ref),
        child: ListView(
          // padding: EdgeInsets.all(16),
          children: [
            VirtualOfferList(),
            OffersList(),
          ],
        ),
      ),
    );
  }
}

class PocketErrorWidget extends StatelessWidget {
  final Function()? tryAgain;
  final Object? ex;
  final String? tryAgainText;
  final String errorText;

  const PocketErrorWidget({
    Key? key,
    this.ex,
    this.tryAgain,
    this.tryAgainText,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              errorText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (tryAgain != null) ...[
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  tryAgain?.call();
                },
                child: Text(
                  tryAgainText ?? '-',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          if (ex != null && kDebugMode) Text(ex.toString()),
        ],
      ),
    );
  }
}

class OffersList extends ConsumerWidget {
  const OffersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offersNotifierProvider(null));
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          SectionTitle(
            title: 'offersOnEarth'.tr(),
            leftPadding: 16,
          ),
          state.when(
            data: (offers) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                // padding: EdgeInsets.all(16),
                children: [
                  if (offers.isEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('noOffersOnLocation'.tr()),
                    ),
                    const SizedBox(height: 16),
                    SectionTitle(
                      title:
                          'whereWeAre'.tr(),
                      leftPadding: 16,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16),
                        itemCount: cities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return AspectRatio(
                            aspectRatio: 16 / 9,
                            child: CityCard(
                              city: cities[index],
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (c) => OfferMapsScreen(
                                      position: LatLng(cities[index].lat,
                                          cities[index].long),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ] else
                    for (int i = 0; i < offers.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => POSDetailsScreen(
                                  posName: offers[i].name,
                                  isVirtual: false,
                                  imageUrl:
                                      offers[i].cover?.midDensityFullWidthUrl,
                                  distance: offers[i].distance,
                                  url: offers[i].url,
                                  offers: offers[i].offers,
                                  posID: offers[i].id,
                                  position: offers[i].position,
                                ),
                              ),
                            );
                          },
                          child: PosTile(
                            posName: offers[i].name,
                            offers: offers[i].offers,
                            distance: offers[i].distance,
                            imageUrl: offers[i].cover?.midDensityFullWidthUrl,
                          ),
                        ),
                      ),
                  SizedBox(
                    height: 60,
                  )
                ],
              );
            },
            error: (ex, st) {
              if (ex is MyLocationException) {
                return PocketErrorWidget(
                  errorText: 'noLocationPermission'.tr(),
                  tryAgain: () async {
                    try {
                      final res = await requestPermission();
                      if (res) {
                        ref.invalidate(locationNotifierProvider);
                      }
                    } on LocationPermissionDeniedForever {
                      Alert(
                          context: context,
                          type: AlertType.error,
                          title: 'locationPermissionDeniedForever'.tr(),
                          buttons: []).show();
                    } catch (ex, st) {
                      logger.e(ex);
                      logger.e(st);
                    }
                  },
                  tryAgainText: 'grantPermission'.tr(),
                  ex: ex,
                );
              } else if (ex is LocationDisabledException) {
                return PocketErrorWidget(
                  errorText: 'noLocationService'.tr(),
                  tryAgain: () {
                    ref.invalidate(locationNotifierProvider);
                  },
                  tryAgainText:
                      'try_again'.tr(),
                  ex: ex,
                );
              }
              return PocketErrorWidget(
                errorText:
                    'somethings_wrong'.tr(),
                tryAgain: () {
                  ref.invalidate(offersNotifierProvider);
                },
                tryAgainText:
                    'try_again'.tr(),
                ex: ex,
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}

class VirtualOfferList extends ConsumerWidget {
  const VirtualOfferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final offers = ref.watch(paginatedVirtualOffersProvider);
    final count = ref.watch(questionsCountProvider);

    if (count is! AsyncData || count.valueOrNull == 0) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionTitle(
            title: 'Offerte online',
            leftPadding: 16,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: count.valueOrNull ?? 0,
                itemBuilder: (c, index) {
                  return ProviderScope(
                    overrides: [
                      currentQuestion.overrideWithValue(
                        ref
                            .watch(paginatedVirtualOffersProvider(index ~/ 10))
                            .whenData((page) => page.data[index % 10]),
                      ),
                    ],
                    child: VirtualPOSCard(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final City city;
  final Function() onTap;
  final double? fontSize;

  const CityCard({
    Key? key,
    required this.city,
    required this.onTap,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(city.imageAsset), fit: BoxFit.cover),
              ),
            ),
            Container(color: Colors.black.withOpacity(0.3)),
            Center(
              child: Text(
                city.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualPOSCard extends ConsumerWidget {
  const VirtualPOSCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPOS = ref.watch(currentQuestion);
    return currentPOS.when(
      data: (virtual) {
        return AspectRatio(
          aspectRatio: 3 / 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => POSDetailsScreen(
                    posName: virtual.name,
                    isVirtual: true,
                    url: virtual.url,
                    imageUrl: virtual.cover?.midDensityFullWidthUrl,
                    position: null,
                  ),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  if (virtual.cover?.midDensityFullWidthUrl != null)
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: virtual.cover!.midDensityFullWidthUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Center(
                      child: Icon(
                        Icons.store,
                        color: Colors.grey,
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        virtual.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (es, st) {
        return Container();
      },
      loading: () {
        return Container();
      },
    );
  }
}
