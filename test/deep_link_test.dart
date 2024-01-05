import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/totem_data.dart';

main() {
  test('Deep link', () {
    final link =
        "https://dev.wom.social/embedded/UNIURB/1d2076b3-8d29-44ca-b7e2-3e68f6e8e0af/5CprXtcNv47OjDDou25D/requestId";
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
            "https://dev.wom.social/embedded/providerId/eventId/totemId/"));
    expect(
        TotemData(
          providerId: 'providerId',
          eventId: 'eventId',
          totemId: 'totemId',
          requestId: null,
        ),
        validateTotemQrCodeWithRegex(
            "https://dev.wom.social/embedded/providerId/eventId/totemId"));
    expect(
        null,
        validateTotemQrCodeWithRegex(
            "https://dev.wom.social/embedded/providerId/eventId/"));
  });
}
