import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker;
import 'package:meta/meta.dart';
import 'package:pocket/src/models/source_group_wom.dart';

@immutable
abstract class MapState extends Equatable {
  final double sliderValue;
  final Set<Marker> markers;
  final List<WomGroupBy> sources;
  final List<WomGroupBy> aims;

  MapState(this.sliderValue, this.markers, this.sources, this.aims);

  @override
  List<Object> get props => [sliderValue, markers, sources, aims];
}

class InitialMapState extends MapState {
  InitialMapState(
      {double sliderValue = 0.0,
      Set<Marker> markers = const {},
      List<WomGroupBy> sources = const [],
      List<WomGroupBy> aims = const []})
      : super(sliderValue, markers, sources, aims);
}

class MapUpdated extends MapState {
  MapUpdated(
      {Set<Marker> markers,
      double sliderValue,
      List<WomGroupBy> sources = const [],
      List<WomGroupBy> aims = const []})
      : super(sliderValue, markers, sources, aims);

  MapUpdated copyWith(Set<Marker> markers, double sliderValue,
      List<WomGroupBy> sources, List<WomGroupBy> aims) {
    return MapUpdated(
        markers: markers ?? this.markers,
        sliderValue: sliderValue ?? this.sliderValue,
        sources: sources ?? this.sources,
        aims: aims ?? this.aims);
  }

  @override
  String toString() => "MapUpdate";
}
