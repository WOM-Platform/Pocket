import 'package:freezed_annotation/freezed_annotation.dart';

part 'totem_data.freezed.dart';

part 'totem_data.g.dart';

@freezed
class TotemData with _$TotemData {
  const factory TotemData({
    required String providerId,
    required String eventId,
    required String totemId,
    String? requestId,
  }) = _TotemData;

  factory TotemData.fromJson(Map<String, dynamic> json) =>
      _$TotemDataFromJson(json);
}

TotemData? validateTotemQrCodeWithRegex(String text) {
  final regExp = new RegExp(
    'https:\/\/dev\.wom\.social\/embedded\/([^\/]+)\/([^\/]+)\/([^\/]+)\/?([^\/]+)?',
    caseSensitive: false,
  );

  if (regExp.hasMatch(text)) {
    final match = regExp.firstMatch(text);
    print(match?[0]);

    final providerId = match?[1];
    final eventId = match?[2];
    final totemId = match?[3];
    final requestId = match?[4];

    if (providerId != null && eventId != null && totemId != null) {
      return TotemData(
        providerId: providerId,
        eventId: eventId,
        totemId: totemId,
        requestId: requestId,
      );
    }
    return null;
  }
  return null;
}
