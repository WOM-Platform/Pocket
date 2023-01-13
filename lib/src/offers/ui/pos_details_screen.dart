import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/offers/ui/offer_tile.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class POSDetailsScreen extends ConsumerWidget {
  final OfferPOS pos;

  const POSDetailsScreen({
    Key? key,
    required this.pos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettaglio POS'),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          if (pos.url != null)
            IconButton(
                icon: Icon(Icons.open_in_new),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SuggestionScreen(url: pos.url!)));
                }),
        ],
      ),
      body: SingleChildScrollView(
          child: OfferTile(
        offer: pos,
        withCard: false,
      )),
    );
  }
}
