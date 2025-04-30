import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/location_notifier.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/exceptions/location_exception.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/totem/application/encrypted_totem_state.dart';

part 'encrypted_totem_notifier.g.dart';

@riverpod
class EncryptedTotemNotifier extends _$EncryptedTotemNotifier {
  @override
  EncryptedTotemState? build(String link) {
    _init();
    return EncryptedTotemState.loading();
  }

  Future _init() async {
    try {
      await Future.delayed(Duration.zero);

      final data = createTotemLinkFromConnection(link);

      if (data == null) {
        state = EncryptedTotemStateInvalid();
        return;
      }

      // validate time
      final now = DateTime.now();
      if (now.difference(data.timestamp).inSeconds > maxTimeRangeInSeconds) {
        state = EncryptedTotemStateFailure(
          failure: PersonalTotemFailure.outOfTime,
        );
        return;
      }

      // validate position
      final myPosition = await ref.refresh(getPositionProvider.future);

      final distanceFromMainPosition = Geolocator.distanceBetween(
        data.lat,
        data.long,
        myPosition.latitude,
        myPosition.longitude,
      );

      if (distanceFromMainPosition > maxPersonalDistanceInMeters) {
        state = EncryptedTotemStateFailure(
          failure: PersonalTotemFailure.outOfDistance,
        );
        return;
      }

      // complete launching as a normal cmi deep link
      final totemId = data.totemId;
      final totemData = validateTotemQrCodeWithRegex(
        'https://link.wom.social/cmi/$digitProviderId/$totemId',
      );

      if (totemData == null) {
        state = state = EncryptedTotemStateFailure(
          failure: PersonalTotemFailure.generic,
        );
        return;
      }
      state = EncryptedTotemStateCompleted(totemData: totemData);
    } on ServiceGPSDisabled {
      state =
          EncryptedTotemStateFailure(failure: PersonalTotemFailure.gpsDisabled);
    } on LocationPermissionDenied {
      state = EncryptedTotemStateFailure(
          failure: PersonalTotemFailure.missingPermissions);
    } catch (ex, st) {
      state = EncryptedTotemStateFailure(
        failure: PersonalTotemFailure.generic,
      );

      logger.e('EncryptedTotemNotifier: init', error: ex, stackTrace: st);
    }
  }
}
