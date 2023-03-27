import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/offers/ui/offer_tile.dart';
import 'package:wom_pocket/src/screens/suggestion/suggestion.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class POSDetailsScreen extends ConsumerWidget {
  final List<Offer> offers;
  final String posName;
  final String? imageUrl;
  final String? distance;
  final String? url;
  final bool isVirtual;
  final String? description;

  const POSDetailsScreen({
    Key? key,
    this.imageUrl,
    this.distance,
    this.description,
    this.isVirtual = false,
    this.offers = const [],
    required this.posName,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('posDetail')),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          if (!isVirtual && url != null)
            IconButton(
              icon: Icon(Icons.open_in_new),
              color: Colors.white,
              onPressed: () => goToExternalSite(context, url!),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OfferTile(
              offers: offers,
              posName: posName,
              distance: distance,
              imageUrl: imageUrl,
              withCard: false,
            ),
            if (isVirtual) ...[
              if (description != null && description!.isNotEmpty)
                Text(description!),
              if (url != null)
                ElevatedButton(
                  onPressed: () => goToExternalSite(context, url!),
                  child: Text('Vai alle offerte online'),
                ),
            ]
          ],
        ),
      ),
    );
  }

  goToExternalSite(BuildContext context, String url) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SuggestionScreen(url: url)));
  }
}
