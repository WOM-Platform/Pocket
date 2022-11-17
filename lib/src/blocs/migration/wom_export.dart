import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wom_export.freezed.dart';
part 'wom_export.g.dart';

@freezed
class WomExport with _$WomExport {

  const factory WomExport({
    required Voucher wom,
    required String sourceId,
    required String sourceName,
  }) = _WomExport;

  factory WomExport.fromJson(Map<String, dynamic> json) =>
      _$WomExportFromJson(json);
}