import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker;
import 'package:pocket/src/models/source_group_wom.dart';

@immutable
abstract class MapEvent extends Equatable {
  MapEvent([List props = const []]) : super(props);
}

class UpdateMap extends MapEvent {
  final double sliderValue;
  final Set<Marker> markers;
  final List<WomGroupBy> sources;
  final bool forceFilterUpdate;

  UpdateMap({
    this.sliderValue,
    this.markers,
    this.forceFilterUpdate = false,
    this.sources,
  }) : super([sliderValue, markers, forceFilterUpdate, sources]);

  @override
  String toString() => "UpdateMap";
}
