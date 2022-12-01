
import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'pos_map_data.freezed.dart';

@freezed
class PosMapData with _$PosMapData {
  const factory PosMapData({
    required List<POSMap> posList,
    required Set<Marker> markers,
    @Default(false) bool isLoading
  }) = _PosMapData;

  factory PosMapData.empty()=>PosMapData(posList: [], markers: {});
}