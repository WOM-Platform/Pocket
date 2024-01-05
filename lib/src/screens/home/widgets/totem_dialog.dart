import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/location_notifier.dart';
import 'package:wom_pocket/src/application/transaction_notifier.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/offers/application/offers_notifier.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

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
  unknown;

  String get errorActionText {
    return switch (this) {
      gpsPermission => 'Concedi i permessi al GPS',
      gpsServiceDisabled => 'Abilita GPS',
      sessionExpired ||
      wrongRequestId ||
      sessionNotStarted ||
      outOfPolygon =>
      'Ok',
      _ => 'Riprova',
    };
  }

  String get description {
    return switch (this) {
      sessionExpired => 'Sembrerebbe che la sessione sia scaduta.',
      sessionNotStarted =>
      'Sembrerebbe che la sessione debba ancora iniziare, controlla la data di inzio',
      wrongRequestId => 'Richiesta non valida! Scansiona nuovamente il QR-Code',
      gpsTimeout => 'La richiesta ha impiegato troppo tempo.',
      gpsPermission =>
      'Abbiamo bisogno della tua posizione per verificare che tu sia fisicamente nel posto corretto',
      gpsServiceDisabled =>
      'Abbiamo bisogno della tua posizione per verificare che tu sia fisicamente nel posto corretto',
      outOfPolygon =>
      'La tua posizione non sembrerebbe rientrare in quella delimitata dall\'evento',
      _ => 'Si è verificato un errore imprevisto',
    };
  }
}

@freezed
class TotemResponse with _$TotemResponse {
  const factory TotemResponse({
    required String status,
    String? link,
    String? pin,
  }) = _TotemResponse;

  factory TotemResponse.fromJson(Map<String, dynamic> json) =>
      _$TotemResponseFromJson(json);
}

@freezed
class TotemDialogState with _$TotemDialogState {
  const factory TotemDialogState.complete({required DeepLinkModel deepLinkModel,
    required String password}) = TotemDialogComplete;

  const factory TotemDialogState.retrievingGPS() = TotemDialogRetrievingGPS;

  const factory TotemDialogState.serverCommunication() =
  TotemDialogCommunicationWithServer;

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

  StreamSubscription? subscription;

  Future action() async {
    subscription?.cancel();
    try {
      state = TotemDialogState.retrievingGPS();
      final currentPosition = await ref.refresh(
          locationNotifierProvider.future);
      final location = LatLng(
          currentPosition.latitude, currentPosition.longitude);
      state = TotemDialogCommunicationWithServer();
      final response = await ref
          .read(transactionRepositoryProvider)
          .getVoucherRequestFromEmbeddedQrCode(
          totemData,
          location,
          isMocked: currentPosition.isMocked
      );
      if (response.status == 'success') {
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
        subscription = Geolocator.getServiceStatusStream().listen((event) {
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
            builder: (context) =>
                TransactionScreen(
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
          if (state is TotemDialogStateError) ...[
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(height: 8),
            Text(state.totemError.description),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                switch (state.totemError) {
                  case TotemError.sessionNotStarted:
                  case TotemError.wrongRequestId:
                  case TotemError.outOfPolygon:
                  case TotemError.sessionExpired:
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
              child: Text(state.totemError.errorActionText),
            )
          ] else
            ...[
              CircularProgressIndicator(),
              switch (state) {
                TotemDialogRetrievingGPS() =>
                    Text('Stiamo acquisendo la tua posizione'),
                TotemDialogCommunicationWithServer() =>
                    Text('Stiamo comunicando con il server'),
                TotemDialogComplete() => Text('Completato'),
                _ => SizedBox.shrink(),
              },
            ],
        ],
      ),
    );
  }
}
