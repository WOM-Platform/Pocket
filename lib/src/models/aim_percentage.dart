import 'package:freezed_annotation/freezed_annotation.dart';

part 'aim_percentage.freezed.dart';
part 'aim_percentage.g.dart';

@freezed
class AimInPercentage with _$AimInPercentage {
  const factory AimInPercentage({
    required String aim,
    required int count,
    required double percentage,
  }) = _AimInPercentage;

  factory AimInPercentage.fromJson(Map<String, dynamic> json) =>
      _$AimInPercentageFromJson(json);
}