import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/core/models/transaction_model.dart';

part 'badge.freezed.dart';
part 'badge.g.dart';

@freezed
abstract class BadgeData with _$BadgeData {
  const factory BadgeData({
    required String id,
    required bool isPublic,
    required Map<String, String> name,
    String? challengeId,
    Map<String, String>? description,
    @JsonKey(name: 'image') ImageData? image,
    @Default(false) bool seen,
    @Default(false) bool achieved,
    @DateTimeConverter() DateTime? achievedAt,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? lastUpdate,
    String? informationUri,
    BadgeSimpleFilter? simpleFilter,
  }) = _BadgeData;

  factory BadgeData.fromJson(Map<String, dynamic> json) =>
      _$BadgeDataFromJson(json);
}

@freezed
abstract class BadgeSimpleFilter with _$BadgeSimpleFilter {
  const factory BadgeSimpleFilter({
    required int count,
    String? aim,
    String? sourceId,
    Bounds? bounds,
    Interval? interval,
  }) = _BadgeSimpleFilter;

  factory BadgeSimpleFilter.fromJson(Map<String, dynamic> json) =>
      _$BadgeSimpleFilterFromJson(json);
}

@freezed
abstract class Interval with _$Interval {
  const factory Interval({
    @DateTimeConverter() required DateTime start,
    @DateTimeConverter() required DateTime end,
  }) = _Interval;

  factory Interval.fromJson(Map<String, dynamic> json) =>
      _$IntervalFromJson(json);
}

@freezed
abstract class ImageData with _$ImageData {
  const factory ImageData({
    required String fullSizeUrl,
    required String midDensityFullWidthUrl,
    required String highDensityFullWidthUrl,
    required String squareThumbnailUrl,
    required String blurHash,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}
