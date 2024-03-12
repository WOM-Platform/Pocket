import 'dart:async';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/application/location_notifier.dart';
import 'package:wom_pocket/src/application/transaction_notifier.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/colors.dart';

part 'totem_dialog.g.dart';

part 'totem_dialog.freezed.dart';

enum TotemError {
  gpsPermission,
  gpsTimeout,
  gpsServiceDisabled,
  sessionNotStarted,
  wrongRequestId,
  sessionExpired,
  outOfPolygon,
  eventIsClosed,
  sessionAlreadyScanned,
  mockedLocation,
  totemDisabled,
  noWomForThisEvent,
  unknown;

  bool get hasCancel =>
      this == TotemError.gpsServiceDisabled ||
      this == TotemError.gpsPermission ||
      this == TotemError.gpsTimeout ||
      this == TotemError.unknown;

  String errorActionText(BuildContext context) {
    return switch (this) {
      gpsPermission => 'allowGPSPermission'.tr(),
      gpsServiceDisabled => 'enableGPS'.tr(),
      sessionExpired ||
      wrongRequestId ||
      sessionNotStarted ||
      eventIsClosed ||
      sessionAlreadyScanned ||
      mockedLocation ||
      totemDisabled ||
      noWomForThisEvent ||
      outOfPolygon =>
        'Ok',
      _ => 'try_again'.tr(),
    };
  }

  String description(BuildContext context) {
    return switch (this) {
      sessionExpired => 'totemErrorSessionExpired'.tr(),
      sessionNotStarted => 'totemErrorSessionNotStarted'.tr(),
      wrongRequestId => 'totemErrorWrongRequestId'.tr(),
      gpsTimeout => 'totemErrorGpsTimeout'.tr(),
      gpsPermission => 'totemErrorGpsPermission'.tr(),
      gpsServiceDisabled => 'totemErrorGpsServiceDisabled'.tr(),
      eventIsClosed => 'totemErrorEventIsClosed'.tr(),
      sessionAlreadyScanned => 'totemErrorSessionAlreadyScanned'.tr(),
      outOfPolygon => 'totemErrorOutOfPolygon'.tr(),
      totemDisabled => 'totemDisabled'.tr(),
      noWomForThisEvent => 'noWomForThisEvent'.tr(),
      _ => 'somethings_wrong'.tr(),
    };
  }
}

@freezed
class TotemResponse with _$TotemResponse {
  const factory TotemResponse({
    required String status,
    String? sessionId,
    String? eventId,
    String? link,
    String? pin,
  }) = _TotemResponse;

  factory TotemResponse.fromJson(Map<String, dynamic> json) =>
      _$TotemResponseFromJson(json);
}

@freezed
class TotemDialogState with _$TotemDialogState {
  const factory TotemDialogState.complete(
      {required DeepLinkModel deepLinkModel,
      required String password}) = TotemDialogComplete;

  const factory TotemDialogState.retrievingGPS() = TotemDialogRetrievingGPS;

  const factory TotemDialogState.serverCommunication() =
      TotemDialogCommunicationWithServer;

  const factory TotemDialogState.genderRequest() = TotemDialogGenderRequest;

  const factory TotemDialogState.error(TotemError totemError, Object error,
      {StackTrace? st}) = TotemDialogStateError;
}

@riverpod
class TotemNotifier extends _$TotemNotifier {
  @override
  TotemDialogState build(TotemData totemData) {
    action();
    return TotemDialogState.retrievingGPS();
  }

  StreamSubscription? _subscription;

  Future action() async {
    _subscription?.cancel();
    try {
      var gender = await Hive.box('settings').get('gender');
      if (gender == null) {
        state = TotemDialogState.genderRequest();
        return;
      }

      gender = gender == Gender.notAvailable ? null : gender;
      state = TotemDialogState.retrievingGPS();
      final currentPosition =
          await ref.refresh(locationNotifierProvider.future);
      if (currentPosition.isMocked) {
        state = TotemDialogStateError(TotemError.mockedLocation, "");
        return;
      }
      final location =
          LatLng(currentPosition.latitude, currentPosition.longitude);
      state = TotemDialogCommunicationWithServer();
      final verifyResponse =
          await ref.read(transactionRepositoryProvider).verifyTotem(totemData);

      if (verifyResponse.status == 'success') {
        final res = await ref.read(getDatabaseProvider).totemsDao.getLastScan(
              totemData.providerId,
              verifyResponse.eventId!,
            );

        final data =
            res == null ? <String, int>{} : <String, int>{res.$1: res.$2};

        final response = await ref
            .read(transactionRepositoryProvider)
            .getVoucherRequestFromEmbeddedQrCode2(
              totemData,
              location,
              res?.$1,
              res?.$2,
              gender,
              isMocked: currentPosition.isMocked,
            );

        if (response.status == 'success') {
          await ref.read(getDatabaseProvider).totemsDao.addTotem(
                totemData.providerId,
                response.eventId!,
                totemData.totemId,
                response.sessionId!,
              );
          final deepLink = DeepLinkModel.fromUri(Uri.parse(response.link!));
          state = TotemDialogComplete(
              deepLinkModel: deepLink, password: response.pin!);
        } else {
          handleError(response);
        }
      } else {
        handleError(verifyResponse);
      }
    } on MyLocationException catch (ex) {
      final error = switch (ex) {
        LocationDisabledException() => TotemError.gpsServiceDisabled,
        LocationPermissionException() => TotemError.gpsPermission,
        LocationTimeoutException() => TotemError.gpsTimeout,
        _ => TotemError.unknown
      };
      if (error == TotemError.gpsServiceDisabled) {
        _subscription = Geolocator.getServiceStatusStream().listen((event) {
          print('gps event: $event');
          if (event == ServiceStatus.enabled) {
            action();
          }
        });
      }
      state = TotemDialogStateError(error, ex);
    } catch (ex, st) {
      print(ex);
      print(st);
      state = TotemDialogStateError(TotemError.unknown, ex, st: st);
    }
  }

  void handleError(TotemResponse response) {
    var totemError = TotemError.unknown;
    try {
      totemError = TotemError.values.byName(response.status);
    } catch (ex, st) {
      logger.e(ex);
      logger.e(st);
    }
    state = TotemDialogStateError(totemError, "");
  }
}

class TotemDialog extends ConsumerWidget {
  final TotemData totemData;

  const TotemDialog({Key? key, required this.totemData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(totemNotifierProvider(totemData), (previous, next) {
      if (next is TotemDialogComplete) {
        Navigator.pushReplacement(
          ref.context,
          MaterialPageRoute<bool>(
            builder: (context) => TransactionScreen(
              params:
                  TransactionNotifierParams(next.deepLinkModel, next.password),
            ),
          ),
        );
      }
    });
    final state = ref.watch(totemNotifierProvider(totemData));
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxWidth: size.width * 0.8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state is TotemDialogGenderRequest) ...[
            GenderSelectorWidget(
              onAction: () {
                ref.read(totemNotifierProvider(totemData).notifier).action();
              },
            ),
          ] else if (state is TotemDialogStateError) ...[
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(height: 8),
            Text(state.totemError.description(context)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (state.totemError.hasCancel)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('cancel'.tr()),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    switch (state.totemError) {
                      case TotemError.sessionNotStarted:
                      case TotemError.wrongRequestId:
                      case TotemError.outOfPolygon:
                      case TotemError.sessionAlreadyScanned:
                      case TotemError.sessionExpired:
                      case TotemError.eventIsClosed:
                      case TotemError.totemDisabled:
                      case TotemError.noWomForThisEvent:
                      case TotemError.mockedLocation:
                        Navigator.of(context).pop();
                        break;
                      case TotemError.gpsServiceDisabled:
                        Geolocator.openLocationSettings();
                        break;
                      case TotemError.gpsPermission:
                      case TotemError.gpsTimeout:
                      case TotemError.unknown:
                        ref
                            .read(totemNotifierProvider(totemData).notifier)
                            .action();
                    }
                  },
                  child: Text(state.totemError.errorActionText(context)),
                )
              ],
            ),
          ] else ...[
            CircularProgressIndicator(),
            switch (state) {
              TotemDialogRetrievingGPS() => Text('acquiringYourPosition'.tr()),
              TotemDialogCommunicationWithServer() =>
                Text('communicatingWithServer'.tr()),
              TotemDialogComplete() => Text('completed'.tr()),
              _ => SizedBox.shrink(),
            },
          ],
        ],
      ),
    );
  }
}

enum Gender {
  male,
  female,
  notBinary,
  notAvailable;

  String translate(BuildContext context) {
    return switch (this) {
      Gender.male => 'male'.tr(),
      Gender.female => 'female'.tr(),
      Gender.notBinary => 'notBinary'.tr(),
      Gender.notAvailable => 'preferNotAnswer'.tr(),
    };
  }
}

class GenderSelectorWidget extends HookConsumerWidget {
  final Function onAction;

  const GenderSelectorWidget({Key? key, required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = useState<Gender?>(null);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Text(
            'genderSelectionTitle'.tr(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            'genderSelectionDescription'.tr(),
            // style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          for (int i = 0; i < Gender.values.length; i++)
            RadioMenuButton(
              value: Gender.values[i],
              groupValue: gender.value,
              onChanged: (g) {
                gender.value = g;
              },
              child: Text(Gender.values[i].translate(context)),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('cancel'.tr())),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: gender.value != null
                    ? () async {
                        if (gender.value == null) return;
                        await Hive.box('settings')
                            .put('gender', gender.value!.name);
                        onAction();
                      }
                    : null,
                child: Text('continue'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
