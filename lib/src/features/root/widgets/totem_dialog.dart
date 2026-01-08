import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/application/location_notifier.dart';
import 'package:wom_pocket/src/core/exceptions/location_exception.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/services/transaction_repository.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/transaction/application/transaction_notifier.dart';

part 'totem_dialog.freezed.dart';
part 'totem_dialog.g.dart';

enum TotemError {
  gpsPermission,
  gpsPermissionDeniedForever,
  gpsTimeout,
  gpsServiceDisabled,
  sessionNotStarted,
  totemSessionInactive,
  wrongRequestId,
  sessionExpired,
  outOfPolygon,
  eventIsClosed,
  sessionAlreadyScanned,
  sessionAlreadyScannedForThisTotem,
  mockedLocation,
  totemDisabled,
  noWomForThisEvent,
  unknown;

  bool get hasCancel =>
      this == TotemError.gpsServiceDisabled ||
      this == TotemError.gpsPermission ||
      this == TotemError.gpsPermissionDeniedForever ||
      this == TotemError.gpsTimeout ||
      this == TotemError.unknown;

  String errorActionText(BuildContext context) {
    return switch (this) {
      gpsPermission => 'allowGPSPermission'.tr(),
      gpsPermissionDeniedForever => 'open_permission_settings'.tr(),
      gpsServiceDisabled => 'enableGPS'.tr(),
      sessionExpired ||
      wrongRequestId ||
      sessionNotStarted ||
      eventIsClosed ||
      sessionAlreadyScanned ||
      sessionAlreadyScannedForThisTotem ||
      mockedLocation ||
      totemDisabled ||
      noWomForThisEvent ||
      totemSessionInactive ||
      outOfPolygon => 'Ok',
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
      sessionAlreadyScannedForThisTotem =>
        'totemErrorSessionAlreadyScannedForThisTotem'.tr(),
      totemSessionInactive => 'totemSessionInactive'.tr(),
      outOfPolygon => 'totemErrorOutOfPolygon'.tr(),
      totemDisabled => 'totemDisabled'.tr(),
      noWomForThisEvent => 'noWomForThisEvent'.tr(),
      _ => 'somethings_wrong'.tr(),
    };
  }
}

@freezed
abstract class TotemResponse with _$TotemResponse {
  const factory TotemResponse({
    required String status,
    String? sessionId,
    String? eventId,
    String? link,
    String? pin,
    String? eventName,
    String? providerName,
    String? sessionName,
    String? totemName,
    TotemMetadata? metadata,
  }) = _TotemResponse;

  factory TotemResponse.fromJson(Map<String, dynamic> json) =>
      _$TotemResponseFromJson(json);
}

@freezed
abstract class TotemMetadata with _$TotemMetadata {
  const factory TotemMetadata({
    String? url,
    String? email,
    String? phoneNumber,
  }) = _TotemMetadata;

  factory TotemMetadata.fromJson(Map<String, dynamic> json) =>
      _$TotemMetadataFromJson(json);
}

@freezed
class TotemDialogState with _$TotemDialogState {
  const factory TotemDialogState.complete({
    required DeepLinkModel deepLinkModel,
    required String password,
  }) = TotemDialogComplete;

  const factory TotemDialogState.retrievingGPS() = TotemDialogRetrievingGPS;

  const factory TotemDialogState.serverCommunication() =
      TotemDialogCommunicationWithServer;

  const factory TotemDialogState.genderRequest() = TotemDialogGenderRequest;

  const factory TotemDialogState.initialLoading() = TotemDialogInitialLoading;

  const factory TotemDialogState.error(
    TotemError totemError,
    Object error, {
    StackTrace? st,
  }) = TotemDialogStateError;
}

@riverpod
class TotemNotifier extends _$TotemNotifier {
  // final bool askGender;
  // final TotemData totemData;
  //
  // TotemNotifier(this.totemData, this.askGender);

  @override
  TotemDialogState build(TotemData totemData, {bool askGender = true}) {
    ref.onDispose(() {
      _subscription?.cancel();
    });
    action();
    return TotemDialogState.initialLoading();
  }

  StreamSubscription? _subscription;

  Future action() async {
    _subscription?.cancel();
    try {
      var gender = await Hive.box('settings').get('gender');

      if (gender == null && askGender) {
        state = TotemDialogState.genderRequest();
        return;
      }

      gender = gender == Gender.notAvailable ? null : gender;

      state = TotemDialogState.retrievingGPS();
      final currentPosition = await ref.refresh(getPositionProvider.future);
      if (currentPosition.isMocked) {
        state = TotemDialogStateError(TotemError.mockedLocation, '');
        return;
      }

      final location = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      state = TotemDialogCommunicationWithServer();
      final verifyResponse = await ref
          .read(transactionRepositoryProvider)
          .verifyTotem(totemData);

      if (verifyResponse.status == 'success') {
        final res = await ref
            .read(getDatabaseProvider)
            .totemsDao
            .getLastScan(
              totemData.providerId,
              verifyResponse.eventId!,
              totemData.totemId,
            );

        final lastSessionIdScanned = res?.$1;
        final eventParticipationCount = res?.$2;
        final userHasAlreadyScannedThisTotemForLastSessionScanned =
            res?.$3 ?? false;

        final response = await ref
            .read(transactionRepositoryProvider)
            .getVoucherRequestFromEmbeddedQrCode2(
              totemData,
              location,
              lastSessionIdScanned,
              eventParticipationCount,
              gender,
              isMocked: false,
              userHasAlreadyScannedThisTotemForLastSessionScanned:
                  userHasAlreadyScannedThisTotemForLastSessionScanned,
              // source:source,
            );

        if (response.status == 'success') {
          await ref
              .read(getDatabaseProvider)
              .totemsDao
              .addTotem(
                totemData.providerId,
                response.providerName ?? '',
                response.eventId!,
                totemData.totemId,
                response.sessionId!,
                response.totemName,
                response.link,
                response.pin,
                response.eventName,
                response.sessionName,
                response.metadata?.email,
                response.metadata?.url,
                response.metadata?.phoneNumber,
                location.latitude,
                location.longitude,
              );
          final deepLink = DeepLinkModel.fromUri(Uri.parse(response.link!));
          state = TotemDialogComplete(
            deepLinkModel: deepLink,
            password: response.pin!,
          );
        } else {
          handleError(response);
        }
      } else {
        handleError(verifyResponse);
      }
    } on LocationException catch (ex, st) {
      final error = switch (ex) {
        ServiceGPSDisabled() => TotemError.gpsServiceDisabled,
        GetLocationTimeout() => TotemError.gpsTimeout,
        LocationPermissionDenied() => TotemError.gpsPermission,
        LocationPermissionDeniedForever() =>
          TotemError.gpsPermissionDeniedForever,
        _ => TotemError.unknown,
      };
      if (error == TotemError.gpsServiceDisabled) {
        _subscription = Geolocator.getServiceStatusStream().listen((event) {
          logger.i('GPS event: $event');
          if (event == ServiceStatus.enabled) {
            action();
          }
        });
      }
      state = TotemDialogStateError(error, ex);
      logger.e('MyLocationException', error: ex, stackTrace: st);
    } catch (ex, st) {
      logger.e('Unknown error', error: ex, stackTrace: st);
      state = TotemDialogStateError(TotemError.unknown, ex, st: st);
    }
  }

  void handleError(TotemResponse response) {
    var totemError = TotemError.unknown;
    try {
      totemError = TotemError.values.byName(response.status);
    } catch (ex, st) {
      logger.e('handleError', error: ex, stackTrace: st);
    }
    state = TotemDialogStateError(totemError, '');
  }
}

class TotemDialog extends ConsumerWidget {
  final TotemData totemData;
  final bool askGender;
  final bool askPosition;

  // final TotemSource? source;

  const TotemDialog({
    required this.totemData,
    Key? key,
    // this.source,
    this.askGender = true,
    this.askPosition = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(totemProvider(totemData, askGender: askGender), (
      previous,
      next,
    ) {
      if (next is TotemDialogComplete) {
        context.pushReplacement(
          '/transaction',
          extra: TransactionNotifierParams(next.deepLinkModel, next.password),
        );
      }
    });
    final state = ref.watch(totemProvider(totemData, askGender: askGender));
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8),
        constraints: BoxConstraints(maxWidth: size.width * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state is TotemDialogGenderRequest) ...[
              GenderSelectorWidget(
                onAction: () {
                  ref
                      .read(
                        totemProvider(totemData, askGender: askGender).notifier,
                      )
                      .action();
                },
              ),
            ] else if (state is TotemDialogStateError) ...[
              Icon(Icons.error, color: Colors.red, size: 50),
              const SizedBox(height: 8),
              Text(
                state.totemError.description(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (state.totemError.hasCancel)
                    TextButton(
                      onPressed: () {
                        context.maybePop();
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
                        case TotemError.sessionAlreadyScannedForThisTotem:
                        case TotemError.sessionExpired:
                        case TotemError.eventIsClosed:
                        case TotemError.totemDisabled:
                        case TotemError.noWomForThisEvent:
                        case TotemError.totemSessionInactive:
                        case TotemError.mockedLocation:
                          context.maybePop();
                          break;
                        case TotemError.gpsServiceDisabled:
                          Geolocator.openLocationSettings();
                          break;
                        case TotemError.gpsPermission:
                        case TotemError.gpsPermissionDeniedForever:
                          context.maybePop();
                          Geolocator.openAppSettings();
                          break;
                        case TotemError.gpsTimeout:
                        case TotemError.unknown:
                          ref
                              .read(
                                totemProvider(
                                  totemData,
                                  askGender: askGender,
                                ).notifier,
                              )
                              .action();
                      }
                    },
                    child: Text(state.totemError.errorActionText(context)),
                  ),
                ],
              ),
            ] else ...[
              CircularProgressIndicator(),
              const SizedBox(height: 8),
              switch (state) {
                TotemDialogRetrievingGPS() => Text(
                  'acquiringYourPosition'.tr(),
                ),
                TotemDialogCommunicationWithServer() => Text(
                  'communicatingWithServer'.tr(),
                ),
                TotemDialogComplete() => Text('completed'.tr()),
                _ => SizedBox.shrink(),
              },
            ],
          ],
        ),
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

  const GenderSelectorWidget({required this.onAction, Key? key})
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
                  context.maybePop();
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
                onPressed: gender.value != null
                    ? () async {
                        if (gender.value == null) return;
                        await Hive.box(
                          'settings',
                        ).put('gender', gender.value!.name);
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
