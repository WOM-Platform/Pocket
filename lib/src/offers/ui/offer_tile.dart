import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:wom_pocket/localization/app_localizations.dart';

const loremIpsum =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";

class PosTile extends ConsumerWidget {

  final bool withCard;
  final List<Offer> offers;
  final String posName;
  final String? imageUrl;
  final String? distance;

  const PosTile({
    Key? key,
    this.withCard = true,
    this.imageUrl,
    this.distance,
    this.offers = const [],
    required this.posName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PosBanner(
          posName: posName,
          imageUrl: imageUrl,
          distance: distance,
        ),
        for (int i = 0; i < offers.length; i++) ...[
          OfferTile(
            offer: offers[i],
          ),
          if (i < offers.length - 1) Divider(),
        ],
        const SizedBox(height: 16),
      ],
    );
    if (!withCard) {
      return body;
    }
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
        top: 8,
      ),
      child: body,
    );
  }
}

class PosBanner extends StatelessWidget {
  final String posName;
  final String? imageUrl;
  final String? distance;
  final bool isVirtual;

  const PosBanner({
    Key? key,
    this.imageUrl,
    this.isVirtual = false,
    this.distance,
    required this.posName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl != null)
            CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.cover,
            ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black54,
                  Colors.black12,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    posName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                if (distance != null)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      distance!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (isVirtual)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Container( decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text('Virtual'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OfferTile extends StatelessWidget {
  final Offer offer;

  const OfferTile({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            offer.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          if (offer.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ReadMoreText(
                offer.description!,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText:
                    AppLocalizations.of(context)!.translate('other'),
                trimExpandedText:
                    AppLocalizations.of(context)!.translate('hide'),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              Spacer(),
              Text(
                '${offer.cost}',
                style: TextStyle(
                    color: Color(0xFF2A69FF),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Image.asset(
                "assets/images/logo_1.png",
                height: 26,
              )
            ],
          ),
        ],
      ),
    );
  }
}
