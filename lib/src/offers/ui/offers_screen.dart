import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/offers/data/offer.dart';
import 'package:wom_pocket/src/offers/domain/entities/offer.dart';
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
            child: Text('Vedi mappa'),
          )
        ],
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     appName,
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (c) => OfferMapsScreen()));
      //       },
      //       child: Text('Vedi mappa'),
      //     )
      //   ],
      //   backgroundColor: Theme.of(context).primaryColor,
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      //   iconTheme: IconThemeData(
      //     color: Colors.white,
      //   ),
      // ),
      body: state.when(
        data: (list) {
          if (list.isEmpty) {
            return Center(
                child: Text(
              'Non ci sono offerte basate sulla tua posizione!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ));
          }
          return OffersList(
            offers: list,
          );
        },
        error: (ex, st) {
          if (ex is MyLocationException) {
            return Text('non hai i permessi per la posizione');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Si è verificato un errore imprevisto!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.invalidate(offersNotifierProvider);
                  },
                  child: Text('Riprova')),
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
