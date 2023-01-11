/*
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/offers/data/offer.dart';

part 'offer.freezed.dart';

@freezed
class FlatOffer with _$FlatOffer {
  const factory FlatOffer({
    required String posId,
    required String posName,
    String? posDescription,
    OfferPicture? posPicture,
    String? posUrl,
    required OfferPosition position,
    // required double distanceInKms,
    required String offerId,
    required String title,
    String? description,
    OfferPicture? picture,
    required int cost,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FlatOffer;

  factory FlatOffer.fromOfferPOS(OfferPOS pos, Offer offer) {
    return FlatOffer(
      posId: pos.posId,
      posName: pos.name,
      posPicture: pos.picture,
      posUrl: pos.url,
      position: pos.position,
      // distanceInKms: pos.distanceInKms,
      offerId: offer.offerId,
      title: offer.title,
      description: offer.description,
      picture: offer.picture,
      cost: offer.cost,
      createdAt: offer.createdAt,
      updatedAt: offer.updatedAt,
    );
  }
}

extension FlatOfferX on FlatOffer {
  String get distance {
    return '${0 * 100} metri';
  }
}
*/
/*
@freezed
class OfferPicture with _$OfferPicture {
  const factory OfferPicture({
    required String fullSizeUrl,
    required String midDensityFullWidthUrl,
    required String highDensityFullWidthUrl,
    required String squareThumbnailUrl,
  }) = _OfferPicture;

  factory OfferPicture.fromJson(Map<String, dynamic> json) =>
      _$OfferPictureFromJson(json);
}

@freezed
class OfferPosition with _$OfferPosition {
  const factory OfferPosition({
    required double latitude,
    required double longitude,
  }) = _OfferPosition;

  factory OfferPosition.fromJson(Map<String, dynamic> json) =>
      _$OfferPositionFromJson(json);
}

extension OfferX on OfferPOS {
  String get distance {
    return '${distanceInKms * 100} metri';
  }
}

class OfferCluster with ClusterItem {
  final OfferPOS offer;

  OfferCluster({required this.offer});

  @override
  LatLng get location => LatLng(offer.position.latitude, offer.position.longitude);
}

@freezed
class OffersMapData with _$OffersMapData {
  const factory OffersMapData({
    // required List<Offer> offers,
    required Set<Marker> markers,
    @Default(false) bool isLoading,
  }) = _OffersMapData;

  factory OffersMapData.empty() => OffersMapData(markers: {});
}*/

