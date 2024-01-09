import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';
import 'package:wom_pocket/src/utils/my_extensions.dart';

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
  unknown;

  String errorActionText(BuildContext context) {
    return switch (this) {
      gpsPermission => context.translate('allowGPSPermission')!,
      gpsServiceDisabled => context.translate('enableGPS')!,
      sessionExpired ||
      wrongRequestId ||
      sessionNotStarted ||
      eventIsClosed ||
      sessionAlreadyScanned ||
      mockedLocation ||
      outOfPolygon =>
        'Ok',
      _ => context.translate('try_again')!,
    };
  }

  String description(BuildContext context) {
    return switch (this) {
      sessionExpired => context.translate('totemErrorSessionExpired')!,
      sessionNotStarted => context.translate('totemErrorSessionNotStarted')!,
      wrongRequestId => context.translate('totemErrorWrongRequestId')!,
      gpsTimeout => context.translate('totemErrorGpsTimeout')!,
      gpsPermission => context.translate('totemErrorGpsPermission')!,
      gpsServiceDisabled => context.translate('totemErrorGpsServiceDisabled')!,
      eventIsClosed => context.translate('totemErrorEventIsClosed')!,
      sessionAlreadyScanned =>
        context.translate('totemErrorSessionAlreadyScanned')!,
      outOfPolygon => context.translate('totemErrorOutOfPolygon')!,
      _ => context.translate('try_again')!,
    };
  }
}

@freezed
class TotemResponse with _$TotemResponse {
  const factory TotemResponse({
    required String status,
    String? sessionId,
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

      gender = gender == Gender.notDefined ? null : gender;
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
      final sessionId =
          await ref.read(getDatabaseProvider).totemsDao.getLastScan(
                totemData.providerId,
                totemData.eventId,
                totemData.totemId,
              );
      final response = await ref
          .read(transactionRepositoryProvider)
          .getVoucherRequestFromEmbeddedQrCode(
            totemData,
            location,
            sessionId,
            gender,
            isMocked: currentPosition.isMocked,
          );
      if (response.status == 'success') {
        await ref.read(getDatabaseProvider).totemsDao.addTotem(
              totemData.providerId,
              totemData.eventId,
              totemData.totemId,
              response.sessionId!,
            );
        final deepLink = DeepLinkModel.fromUri(Uri.parse(response.link!));
        state = TotemDialogComplete(
            deepLinkModel: deepLink, password: response.pin!);
      } else {
        final totemError = TotemError.values.byName(response.status);
        state = TotemDialogStateError(totemError, "");
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
            ElevatedButton(
              onPressed: () {
                switch (state.totemError) {
                  case TotemError.sessionNotStarted:
                  case TotemError.wrongRequestId:
                  case TotemError.outOfPolygon:
                  case TotemError.sessionAlreadyScanned:
                  case TotemError.sessionExpired:
                  case TotemError.eventIsClosed:
                  case TotemError.mockedLocation:
                    Navigator.of(context).pop();
                    break;
                  case TotemError.gpsServiceDisabled:
                    Geolocator.openLocationSettings();
                    break;
                  case TotemError.gpsPermission:
                  case TotemError.gpsTimeout:
                  case TotemError.unknown:
                  default:
                    ref
                        .read(totemNotifierProvider(totemData).notifier)
                        .action();
                }
              },
              child: Text(state.totemError.errorActionText(context)),
            )
          ] else ...[
            CircularProgressIndicator(),
            switch (state) {
              TotemDialogRetrievingGPS() =>
                Text(context.translate('acquiringYourPosition')!),
              TotemDialogCommunicationWithServer() =>
                Text(context.translate('communicatingWithServer')!),
              TotemDialogComplete() => Text('Completato'),
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
  notDefined;

  String get translate {
    return switch (this) {
      Gender.male => 'Maschio',
      Gender.female => 'Femmina',
      Gender.notBinary => 'Non binario',
      Gender.notDefined => 'Preferisco non rispondere',
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
            context.translate('genderSelectionTitle')!,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            context.translate('genderSelectionDescription')!,
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
              child: Text(Gender.values[i].translate),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Annulla')),
              ElevatedButton(
                onPressed: gender.value != null
                    ? () async {
                        if (gender.value == null) return;
                        await Hive.box('settings')
                            .put('gender', gender.value!.name);
                        onAction();
                      }
                    : null,
                child: Text('Continua'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
