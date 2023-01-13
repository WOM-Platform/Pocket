import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/offers/ui/offer_tile.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

class OffersListScreen extends ConsumerWidget {
  const OffersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offersNotifierProvider);
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
            return Center(
                child: Text(
              AppLocalizations.of(context)!.translate('noOffersOnLocation'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ));
          }
          return OffersList(offers: offers);
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
            return Text(AppLocalizations.of(context)!
                .translate('noLocationPermission'));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.translate('somethings_wrong'),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(offersNotifierProvider);
                },
                child: Text(
                  AppLocalizations.of(context)!.translate('try_again'),
                ),
              ),
              if (kDebugMode) Text(ex.toString()),
            ],
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

class OffersList extends ConsumerWidget {
  final List<OfferPOS> offers;

  const OffersList({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        itemCount: offers.length,
        itemBuilder: (c, index) {
          final offer = offers[index];
          return OfferTile(
            offer: offer,
          );
        });
  }
}
