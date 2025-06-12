import 'package:flutter_test/flutter_test.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';

main() {
  test('Deep link', () {
    expect(
      TotemData(
        providerId: 'providerId',
        eventId: 'eventId',
        totemId: 'totemId',
        requestId: 'requestId',
      ),
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/providerId/eventId/totemId/requestId',
      ),
    );
    expect(
      TotemData(
        providerId: 'providerId',
        eventId: 'eventId',
        totemId: 'totemId',
        requestId: null,
      ),
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/providerId/eventId/totemId/',
      ),
    );
    expect(
      TotemData(
        providerId: 'providerId',
        eventId: 'eventId',
        totemId: 'totemId',
        requestId: null,
      ),
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/providerId/eventId/totemId',
      ),
    );
  });

  test('Deep link 2', () {
    final link2 = 'https://link.wom.social/cmi/providerId/totemId';
    expect(
      TotemData(
        providerId: 'providerId',
        totemId: 'totemId',
        eventId: null,
        requestId: null,
      ),
      validateTotemQrCodeWithRegex(link2),
    );
    expect(
      TotemData(
        providerId: 'providerId',
        totemId: 'totemId',
        eventId: null,
        requestId: null,
      ),
      validateTotemQrCodeWithRegex('$link2/'),
    );
    expect(
      null,
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/providerId/',
      ),
    );
    expect(
      TotemData(
        providerId: 'providerId',
        totemId: 'totemId',
        eventId: null,
        requestId: 'requestId',
      ),
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/providerId/totemId?token=requestId',
      ),
    );

    final now = DateTime.now();
    final data = ConnectionTotemData(
      lat: 0.0,
      long: 0.0,
      totemId: 'totemId',
      timestamp: now,
    );

    expect(data.toLink,
        'https://link.wom.social/connection/v1/totemId?timestamp=${now.millisecondsSinceEpoch}&latitude=0.0&longitude=0.0');

    expect(
      validateTotemQrCodeWithRegex(
        'https://link.wom.social/connection/v1/',
      ),
      isNull,
    );

    expect(
      validateChallenge('https://link.wom.social/challenge/v1/abcde'),
      'https://link.wom.social/challenge/v1/abcde',
    );

    expect(
      validateChallenge(
        'wom://challenge/v1/6846f4d0b51528e329a9da79',
      ),
      'https://link.wom.social/challenge/v1/6846f4d0b51528e329a9da79',
    );
  });
}
