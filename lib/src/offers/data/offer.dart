import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

part 'offer.freezed.dart';

// part 'offer.g.dart';
/*
@freezed
class OfferPagination with _$OfferPagination {
  const factory OfferPagination({
    required List<OfferPOS> data,
    required int totalCount,
    required int page,
    required int pageSize,
    required bool hasPrevious,
    required bool hasNext,
  }) = _OfferPagination;

  factory OfferPagination.fromJson(Map<String, dynamic> json) =>
      _$OfferPaginationFromJson(json);
}

@freezed
class OfferPOS with _$OfferPOS {
  const factory OfferPOS({
    required String posId,
    required String name,
    String? description,
    OfferPicture? picture,
    String? url,
    required OfferPosition position,
    required double distanceInKms,
    required List<Offer> offers,
  }) = _OfferPOS;

  factory OfferPOS.fromJson(Map<String, dynamic> json) =>
      _$OfferPOSFromJson(json);
}

@freezed
class Offer with _$Offer {
  const factory Offer({
    required String offerId,
    required String title,
    required String description,
    OfferPicture? picture,
    required int cost,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}

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
}*/

/*
     /// <summary>
        /// Computes the approximate distance in kilometers between two geographical points.
        /// Uses a "Haversine" great circle calculation, on an ideal sphere. Not exact close to equator and poles.
        /// </summary>
        /// <returns>Distance in kilometers.</returns>
        /// <param name="lat1">Latitude of first point.</param>
        /// <param name="lng1">Longitude of first point.</param>
        /// <param name="lat2">Latitude of second point.</param>
        /// <param name="lng2">Longitude of second point.</param>
        public static double DistanceBetweenPoints(double lat1, double lng1, double lat2, double lng2) {
            double dLng = FromDegreesToRadians(lng2 - lng1);
            double dLat = FromDegreesToRadians(lat2 - lat1);

            double radLat1 = FromDegreesToRadians(lat1);
            double radLat2 = FromDegreesToRadians(lat2);

            double a = (Math.Sin(dLat / 2) * Math.Sin(dLat / 2)) + Math.Cos(radLat1) * Math.Cos(radLat2) * (Math.Sin(dLng / 2) * Math.Sin(dLng / 2));
            double angle = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));

            return angle * MeanEarthRadius;
        }

    }*/

const meanEarthRadius = 6357000;

double fromDegreesToRadians(double d) {
  return d * math.pi / 180.0;
}

double distanceBetweenPoints(
    double lat1, double lng1, double lat2, double lng2) {
  double dLng = fromDegreesToRadians(lng2 - lng1);
  double dLat = fromDegreesToRadians(lat2 - lat1);

  double radLat1 = fromDegreesToRadians(lat1);
  double radLat2 = fromDegreesToRadians(lat2);

  double a = (math.sin(dLat / 2) * math.sin(dLat / 2)) +
      math.cos(radLat1) *
          math.cos(radLat2) *
          (math.sin(dLng / 2) * math.sin(dLng / 2));
  double angle = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return angle * meanEarthRadius;
}

// extension OfferX on OfferPOS {
//   String distance(double lat, double long) {
//     final d = distanceBetweenPoints(position.latitude, position.longitude, lat, long) ;
//     return '$d m';
//   }
// }

class OfferCluster with ClusterItem {
  final OfferPOS offer;

  OfferCluster({required this.offer});

  @override
  LatLng get location =>
      LatLng(offer.position.latitude, offer.position.longitude);
}

@freezed
class OffersMapData with _$OffersMapData {
  const factory OffersMapData({
    required List<OfferPOS> offers,
    required Set<Marker> markers,
    @Default(false) bool isLoading,
  }) = _OffersMapData;

  factory OffersMapData.empty() => OffersMapData(markers: {}, offers: []);
}
