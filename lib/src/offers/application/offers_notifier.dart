import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/offers/data/offer.dart';
import 'package:wom_pocket/src/offers/ui/carousel.dart';
import 'package:wom_pocket/src/offers/ui/map_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/location_utils.dart';

part 'offers_notifier.g.dart';

final paginatedVirtualOffersProvider = FutureProvider.autoDispose
    .family<OfferPagination, int>((ref, pageIndex) async {
  final offers =
      await ref.watch(pocketProvider).getVirtualPos(pageIndex + 1, pageSize: 4);

  return offers;
});

/// A provider exposing the total count of questions
final questionsCountProvider = Provider.autoDispose((ref) {
  return ref
      .watch(paginatedVirtualOffersProvider(0))
      .whenData((page) => page.totalCount);
});

/// A scoped provider, exposing the current question used by [QuestionItem].
///
/// This is used as a performance optimization to pass a [Question] to
/// [QuestionItem], while still instantiating [QuestionItem] using the `const`
/// keyword.
///
/// This allows [QuestionItem] to rebuild less often.
/// By doing so, even when using [QuestionItem] in a [ListView], even if new
/// questions are obtained, previously rendered [QuestionItem]s won't rebuild.
///
/// This is an optional step. Since scoping is a fairly advanced mechanism,
/// it's entirely fine to simply pass the [Question] to [QuestionItem] directly.
final currentQuestion = Provider<AsyncValue<VirtualPOS>>((ref) {
  throw UnimplementedError();
});

@Riverpod(keepAlive: true)
class OffersNotifier extends _$OffersNotifier {
  FutureOr<List<OfferPOS>> build(LatLng? position) async {
    var currentPosition = position;
    if (currentPosition == null) {
      currentPosition = await ref.watch(locationNotifierProvider.future);
    }

    final offers = await loadOffers(
      currentPosition: currentPosition,
    );
    logger.w('offers: ${offers.length}');
    return offers;
  }

  Future<List<OfferPOS>> loadOffers({
    LatLng? currentPosition,
  }) async {
    try {
      final tmp =
          currentPosition ?? await ref.refresh(locationNotifierProvider.future);

      if (tmp == null) throw Exception();

      final data = await ref.watch(pocketProvider).getOffers(
            // latitude: 43.72, longitude: 12.63,
            latitude: tmp.latitude,
            longitude: tmp.longitude,
          );
      return data
          .map(
            (e) => e.copyWith(
              distance: distance(tmp.latitude, tmp.longitude, e.position),
            ),
          )
          .toList();
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      rethrow;
    }
  }

  String distance(double lat, double long, OfferPosition position) {
    final d =
        distanceBetweenPoints(position.latitude, position.longitude, lat, long);
    if (d > 1000) return '${(d / 1000).toStringAsFixed(1)} km';
    return '${d.toStringAsFixed(0)} m';
  }
}


class MyLocationException implements Exception {}

class LocationDisabledException implements Exception {}

@Riverpod(keepAlive: true)
class LocationNotifier extends _$LocationNotifier {
  FutureOr<LatLng> build() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationDisabledException();
    }

    final loc = await _getCurrentLocation();
    return loc;
  }

  Future<LatLng> _getCurrentLocation() async {
    logger.w('_getCurrentLocation');
    try {
      if (await requestPermission()) {
        final currentPosition = await Geolocator.getCurrentPosition(
          timeLimit: Duration(seconds: 15),
        );
        logger.wtf(currentPosition);
        return LatLng(currentPosition.latitude, currentPosition.longitude);
      }
      logger.w('permissions are not granted');
      throw MyLocationException();
    } on LocationServiceDisabledException catch (ex) {
      logger.e(ex);
      throw MyLocationException();
    } on TimeoutException catch (ex) {
      logger.e(ex);
      throw MyLocationException();
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
      throw MyLocationException();
    }
  }
}
