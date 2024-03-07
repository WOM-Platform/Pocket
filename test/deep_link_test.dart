import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/models/totem_data.dart';

main() {
  test('Deep link', () {

    expect(
        TotemData(
          providerId: 'providerId',
          eventId: 'eventId',
          totemId: 'totemId',
          requestId: 'requestId',
        ),
        validateTotemQrCodeWithRegex("https://link.wom.social/cmi/providerId/eventId/totemId/requestId"));
    expect(
        TotemData(
          providerId: 'providerId',
          eventId: 'eventId',
          totemId: 'totemId',
          requestId: null,
        ),
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/eventId/totemId/"));
    expect(
        TotemData(
          providerId: 'providerId',
          eventId: 'eventId',
          totemId: 'totemId',
          requestId: null,
        ),
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/eventId/totemId"));
    expect(
        null,
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/eventId/"));
  });

  test('Deep link 2', () {
    final link2 = "https://link.wom.social/cmi/providerId/totemId";
    expect(
        TotemData(
          providerId: 'providerId',
          totemId: 'totemId',
          eventId: null,
          requestId: null,
        ),
        validateTotemQrCodeWithRegex(link2));
    expect(
        TotemData(
          providerId: 'providerId',
          totemId: 'totemId',
          eventId: null,
          requestId: null,
        ),
        validateTotemQrCodeWithRegex('$link2/'));
    expect(
        null,
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/"));
    expect(
        TotemData(
          providerId: 'providerId',
          totemId: 'totemId',
          eventId: null,
          requestId: 'requestId',
        ),
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/totemId?token=requestId"));
  });
}
