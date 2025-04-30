import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';

part 'totem_data.freezed.dart';

part 'totem_data.g.dart';

@freezed
class TotemData with _$TotemData {
  const factory TotemData({
    required String providerId,
    required String totemId,
    String? eventId,
    String? requestId,
  }) = _TotemData;

  factory TotemData.fromJson(Map<String, dynamic> json) =>
      _$TotemDataFromJson(json);
}

extension TotemDataX on TotemData {
  bool get isDedicated => eventId != null;
}

@freezed
class ConnectionTotemData with _$ConnectionTotemData {
  const factory ConnectionTotemData({
    required String totemId,
    required DateTime timestamp,
    required double lat,
    required double long,
  }) = _ConnectionTotemData;
}

extension ConnectionTotemDataX on ConnectionTotemData {
  String get toLink =>
      '$connectionBaseUrl/$totemId?timestamp=${timestamp.millisecondsSinceEpoch}&latitude=$lat&longitude=$long';
}

// https://link.wom.social/cmi/e3441c34-b02c-4bd9-8de5-9e312468ca69/d67c6e3a-053a-4cb7-b4ce-d1d0427c6cad
// https://link.wom.social/cmi/e3441c34-b02c-4bd9-8de5-9e312468ca69/4212d1b0-e2c5-491c-b6d8-c84f4957d074
TotemData? validateTotemQrCodeWithRegex(String text) {
  final regExp = new RegExp(
    'https:\/\/link\.wom\.social\/cmi\/([^\/]+)\/([^\/]+)\/([^\/]+)\/?([^\/]+)?',
    caseSensitive: false,
  );

  final regExp2 = RegExp(
    r'https:\/\/link\.wom\.social\/cmi\/([^\/]+)\/([^\/^\?]+)\??(?:token=([a-zA-Z0-9]+))?',
    caseSensitive: false,
  );

  if (regExp.hasMatch(text)) {
    final match = regExp.firstMatch(text);
    logger.i(match?[0]);

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

  if (regExp2.hasMatch(text)) {
    final match = regExp2.firstMatch(text);
    logger.i(match?[0]);

    final providerId = match?[1];
    final totemId = match?[2];
    final requestId = match?[3];

    if (providerId != null && totemId != null) {
      return TotemData(
        providerId: providerId,
        totemId: totemId,
        requestId: requestId,
      );
    }
    return null;
  }

  return null;
}

String? validatePersonalConnection(String text) {
  final connectionRegExp = new RegExp(
    'https:\/\/link\.wom\.social\/connection\/([a-zA-Z0-9]+)',
    caseSensitive: false,
  );

  if (connectionRegExp.hasMatch(text)) {
    final match = connectionRegExp.firstMatch(text);

    final encryptedData = match?[1];

    if (encryptedData != null) {
      return encryptedData;
    }
  }

  return null;
}
