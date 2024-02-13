import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/models/totem_data.dart';

main() {
  test('Deep link', () {
    final link =
        "https://link.wom.social/cmi/UNIURB/1d2076b3-8d29-44ca-b7e2-3e68f6e8e0af/5CprXtcNv47OjDDou25D/requestId";
    expect(
        TotemData(
          providerId: 'UNIURB',
          eventId: '1d2076b3-8d29-44ca-b7e2-3e68f6e8e0af',
          totemId: '5CprXtcNv47OjDDou25D',
          requestId: 'requestId',
        ),
        validateTotemQrCodeWithRegex(link));
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
    final link2 =
        "https://link.wom.social/cmi/providerId/totemId";
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
        validateTotemQrCodeWithRegex(
            '$link2/'));
    expect(
        null,
        validateTotemQrCodeWithRegex(
            "https://link.wom.social/cmi/providerId/"));
  });
}
