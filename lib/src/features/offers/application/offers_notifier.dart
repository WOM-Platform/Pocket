import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/location_notifier.dart';
import 'package:wom_pocket/src/core/application/pocket_notifier.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/offers/data/offer.dart';

part 'offers_notifier.g.dart';

final paginatedVirtualOffersProvider = FutureProvider.autoDispose
    .family<VirtualPosPagination, int>((ref, pageIndex) async {
      final offers = await ref
          .watch(pocketProvider)
          .getVirtualPos(pageIndex + 1, pageSize: 4);

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
      final position = await ref.watch(locationProvider.future);
      currentPosition = LatLng(position.latitude, position.longitude);
    }
    final location = LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );
    final offers = await loadOffers(currentPosition: location);
    logger.w('offers: ${offers.length}');
    return offers;
  }

  Future<List<OfferPOS>> loadOffers({LatLng? currentPosition}) async {
    try {
      final tmp =
          currentPosition ??
          (await ref.refresh(locationProvider.future)).toLocation();

      if (tmp == null) throw Exception();

      final data = await ref
          .watch(pocketProvider)
          .getOffers(
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
      logger.e('Load offers', error: ex, stackTrace: st);
      rethrow;
    }
  }

  String distance(double lat, double long, OfferPosition position) {
    final d = distanceBetweenPoints(
      position.latitude,
      position.longitude,
      lat,
      long,
    );
    if (d > 1000) return '${(d / 1000).toStringAsFixed(1)} km';
    return '${d.toStringAsFixed(0)} m';
  }
}
