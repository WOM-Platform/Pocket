import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker;
import 'package:meta/meta.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

@immutable
abstract class MapEvent extends Equatable {}

class UpdateMap extends MapEvent {
  final double? sliderValue;
  final Set<Marker>? markers;
  final List<WomGroupBy>? sources;
  final List<WomGroupBy>? aims;
  final bool forceFilterUpdate;
  final int? womCountWithoutLocation;

  UpdateMap({
    this.sliderValue,
    this.markers,
    this.forceFilterUpdate = false,
    this.sources,
    this.aims,
    this.womCountWithoutLocation,
  });

  @override
  String toString() => "UpdateMap: $womCountWithoutLocation";

  @override
  List<Object?> get props => [
        sliderValue,
        markers,
        forceFilterUpdate,
        sources,
        aims,
        womCountWithoutLocation,
      ];
}
