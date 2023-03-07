import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/new_home/ui/section_title.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
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
    final state = ref.watch(offersNotifierProvider);
    final c = ref.watch(refreshControllerProvider);
    return Scaffold(
      appBar: PocketAppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => OfferMapsScreen()));
            },
            child: Text(AppLocalizations.of(context)!.translate('showMap')),
          )
        ],
      ),
      body: state.when(
        data: (offers) {
          if (offers.isEmpty) {
            return PocketErrorWidget(
              errorText:
                  AppLocalizations.of(context)!.translate('noOffersOnLocation'),
              tryAgainText: AppLocalizations.of(context)!.translate('update'),
              tryAgain: () {
                ref.invalidate(locationNotifierProvider);
              },
            );
          }
          return SmartRefresher(
            controller: c,
            enablePullDown: true,
            onRefresh: () => _onRefresh(ref),
            child: state.when(
              data: (offers) {
                if (offers.isEmpty) {
                  return PocketErrorWidget(
                    errorText: AppLocalizations.of(context)!
                        .translate('noOffersOnLocation'),
                    tryAgainText:
                        AppLocalizations.of(context)!.translate('update'),
                    tryAgain: () {
                      ref.invalidate(locationNotifierProvider);
                    },
                  );
                }
                // return ListView.builder(
                //     padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                //     itemCount: offers.length,
                //     itemBuilder: (c, index) {
                //       final offer = offers[index];
                //       return OfferTile(
                //         offer: offer,
                //       );
                //     });
                return ListView(
                  // padding: EdgeInsets.all(16),
                  children: [
                    VirtualOfferList(),
                    SectionTitle(
                      title: 'Offerte sul territorio',
                      leftPadding: 16,
                    ),
                    for (int i = 0; i < offers.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: OfferTile(
                          posName: offers[i].name,
                          offers: offers[i].offers,
                          distance: offers[i].distance,
                          imageUrl: offers[i].cover?.midDensityFullWidthUrl,
                        ),
                      )
                  ],
                );
              },
              error: (ex, st) {
                if (ex is MyLocationException) {
                  return PocketErrorWidget(
                    errorText: AppLocalizations.of(context)!
                        .translate('noLocationPermission'),
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
                            title: AppLocalizations.of(context)!
                                .translate('locationPermissionDeniedForever'),
                            buttons: []).show();
                      } catch (ex, st) {
                        logger.e(ex);
                        logger.e(st);
                      }
                    },
                    tryAgainText: AppLocalizations.of(context)!
                        .translate('grantPermission'),
                    ex: ex,
                  );
                } else if (ex is LocationDisabledException) {
                  return PocketErrorWidget(
                    errorText: AppLocalizations.of(context)!
                        .translate('noLocationService'),
                    tryAgain: () {
                      ref.invalidate(locationNotifierProvider);
                    },
                    tryAgainText:
                        AppLocalizations.of(context)!.translate('try_again'),
                    ex: ex,
                  );
                }
                return PocketErrorWidget(
                  errorText: AppLocalizations.of(context)!
                      .translate('somethings_wrong'),
                  tryAgain: () {
                    ref.invalidate(offersNotifierProvider);
                  },
                  tryAgainText:
                      AppLocalizations.of(context)!.translate('try_again'),
                  ex: ex,
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
          // return Column(
          //   children: [
          //     SectionTitle(
          //       title: 'Offerte online',
          //       leftPadding: 16,
          //       text: 'Vedi tutte',
          //     ),
          //     SizedBox(
          //       height: 100,
          //       child: ListView.builder(
          //           padding: const EdgeInsets.only(left: 16),
          //           scrollDirection: Axis.horizontal,
          //           itemCount: 5,
          //           itemBuilder: (c, i) {
          //             return AspectRatio(
          //               aspectRatio: 1,
          //               child: Card(),
          //             );
          //           }),
          //     ),
          //     const SizedBox(height: 24),
          //     SectionTitle(
          //       title: 'Offerte sul territorio',
          //       leftPadding: 16,
          //     ),
          //     Expanded(
          //       child: OffersList(
          //         offers: list,
          //       ),
          //     ),
          //   ],
          // );
        },
        error: (ex, st) {
          if (ex is MyLocationException) {
            return PocketErrorWidget(
              errorText: AppLocalizations.of(context)!
                  .translate('noLocationPermission'),
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
                      title: AppLocalizations.of(context)!
                          .translate('locationPermissionDeniedForever'),
                      buttons: []).show();
                } catch (ex, st) {
                  logger.e(ex);
                  logger.e(st);
                }
              },
              tryAgainText:
                  AppLocalizations.of(context)!.translate('grantPermission'),
              ex: ex,
            );
          } else if (ex is LocationDisabledException) {
            return PocketErrorWidget(
              errorText:
                  AppLocalizations.of(context)!.translate('noLocationService'),
              tryAgain: () {
                ref.invalidate(locationNotifierProvider);
              },
              tryAgainText:
                  AppLocalizations.of(context)!.translate('try_again'),
              ex: ex,
            );
          }
          return PocketErrorWidget(
            errorText:
                AppLocalizations.of(context)!.translate('somethings_wrong'),
            tryAgain: () {
              ref.invalidate(offersNotifierProvider);
            },
            tryAgainText: AppLocalizations.of(context)!.translate('try_again'),
            ex: ex,
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
  final List<OfferPOS> offers;

  const OffersList({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        itemCount: offers.length,
        shrinkWrap: true,
        itemBuilder: (c, index) {
          final offer = offers[index];
          return OfferTile(
            posName: offer.name,
            offers: offer.offers,
            distance: offer.distance,
            imageUrl: offer.cover?.midDensityFullWidthUrl,
          );
        });
  }
}

class VirtualOfferList extends ConsumerWidget {
  const VirtualOfferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final offers = ref.watch(paginatedVirtualOffersProvider);
    final count = ref.watch(questionsCountProvider);

    if (count is! AsyncData) {
      return SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
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
        const SizedBox(height: 24),
      ],
    );
  }
}

class VirtualPOSCard extends ConsumerWidget {
  const VirtualPOSCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPOS = ref.watch(currentQuestion);
    return currentPOS.when(data: (virtual) {
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
                ),
              ),
            );
          },
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  virtual.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }, error: (es, st) {
      return Container();
    }, loading: () {
      return Container();
    });
  }
}
