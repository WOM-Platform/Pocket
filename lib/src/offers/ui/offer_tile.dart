import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

const loremIpsum =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";

class OfferTile extends ConsumerWidget {
  final OfferPOS offer;

  const OfferTile({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
        top: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: offer.cover.midDensityFullWidthUrl,
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
                          offer.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (offer.distance != null)
                        Text(
                          offer.distance!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < offer.offers.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    offer.offers[i].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  // if (offer.offers[i].description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ReadMoreText(
                      offer.offers[i].description ?? loremIpsum,
                      trimLines: 3,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'altro',
                      trimExpandedText: 'nascondi',
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '${offer.offers[i].cost}',
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
                  if (i < offer.offers.length - 1) Divider(),
                ],
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
