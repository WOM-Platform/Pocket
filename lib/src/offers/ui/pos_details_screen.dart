import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/offers/application/pos_notifier.dart';
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
  final String? posID;
  final OfferPosition? position;

  const POSDetailsScreen({
    Key? key,
    this.imageUrl,
    this.distance,
    this.description,
    this.posID,
    this.isVirtual = false,
    this.offers = const [],
    required this.posName,
    required this.position,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PhysicalPOS? pos;
    if (posID != null) {
      pos = ref.watch(getPosProvider(posID!)).valueOrNull;
    }

    final sectionStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('posDetail'),
        ),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          if (url != null)
            IconButton(
              icon: Icon(Icons.open_in_new),
              color: Colors.white,
              onPressed: () => goToExternalSite(context, url!),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PosBanner(
              posName: posName,
              imageUrl: imageUrl,
              isVirtual: isVirtual,
              distance: distance,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (description != null && description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(description!),
                    ),
                  const SizedBox(height: 16),
                  if (offers.isNotEmpty) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)!.translate('offers'),
                          style: sectionStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    for (int i = 0; i < offers.length; i++) ...[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OfferTile(
                            offer: offers[i],
                          ),
                        ),
                      ),
                      if (i < offers.length - 1) Divider(),
                    ],
                    const SizedBox(height: 8),
                    Divider(
                      height: 16,
                      thickness: 4,
                    ),
                  ],
                  /*PosTile(
                offers: offers,
                posName: posName,
                distance: distance,
                imageUrl: imageUrl,
                withCard: false,
                ),*/
                  // if (url != null)
                  //   ElevatedButton(
                  //     onPressed: () => goToExternalSite(context, url!),
                  //     child: Text('Vai alle offerte online'),
                  //   ),
                  if (position != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.map,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('whereFindUs'),
                                textAlign: TextAlign.start,
                                style: sectionStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: GoogleMap(
                              onTap: (_) async {
                                final uri = createCoordinatesUri(
                                  position!.latitude,
                                  position!.longitude,
                                );
                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri);
                                }
                              },
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: false,
                              minMaxZoomPreference:
                                  MinMaxZoomPreference(16, 20),
                              markers: {
                                Marker(
                                  markerId: MarkerId(posName),
                                  position: LatLng(
                                    position!.latitude,
                                    position!.longitude,
                                  ),
                                ),
                              },
                              onCameraMove: (pos) {
                                print(pos.zoom);
                              },
                              initialCameraPosition: CameraPosition(
                                zoom: 19,
                                target: LatLng(
                                  position!.latitude,
                                  position!.longitude,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (pos != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Text(pos.name),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            final uri = createQueryUri(pos!
                                    .address?.formattedAddress ??
                                'Via Enrico Fermi, 24 Sant\'Egidio alla Vibrata');
                            if (await canLaunchUrl(uri)) {
                              launchUrl(uri);
                            }
                          },
                          child: Text(
                            pos.address?.formattedAddress ??
                                'Via Enrico Fermi, 24 Sant\'Egidio alla Vibrata',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 24),
                  if (!isVirtual)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(context)
                                  ?.translate('howUseOffer') ?? '',
                              textAlign: TextAlign.start,
                              style: sectionStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)
                              ?.translate('howUseOfferDesc') ?? '',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Uri createQueryUri(String query) {
    Uri uri;

    if (kIsWeb) {
      uri = Uri.https(
          'www.google.com', '/maps/search/', {'api': '1', 'query': query});
    } else if (Platform.isAndroid) {
      uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});
    } else if (Platform.isIOS) {
      uri = Uri.https('maps.apple.com', '/', {'q': query});
    } else {
      uri = Uri.https(
          'www.google.com', '/maps/search/', {'api': '1', 'query': query});
    }

    return uri;
  }

  Uri createCoordinatesUri(double latitude, double longitude, [String? label]) {
    Uri uri;

    if (kIsWeb) {
      uri = Uri.https('www.google.com', '/maps/search/',
          {'api': '1', 'query': '$latitude,$longitude'});
    } else if (Platform.isAndroid) {
      var query = '$latitude,$longitude';

      if (label != null) query += '($label)';

      uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});
    } else if (Platform.isIOS) {
      var params = {
        'll': '$latitude,$longitude',
        'q': label ?? '$latitude, $longitude',
      };

      uri = Uri.https('maps.apple.com', '/', params);
    } else {
      uri = Uri.https('www.google.com', '/maps/search/',
          {'api': '1', 'query': '$latitude,$longitude'});
    }

    return uri;
  }

  goToExternalSite(BuildContext context, String url) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SuggestionScreen(url: url)));
  }
}
