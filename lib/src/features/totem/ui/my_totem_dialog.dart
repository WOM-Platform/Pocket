import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/totem/application/encrypted_totem_notifier.dart';
import 'package:wom_pocket/src/features/totem/application/encrypted_totem_state.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';

class MyTotemDialog extends ConsumerWidget {
  final String link;

  const MyTotemDialog({
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(encryptedTotemNotifierProvider(link), (p, n) {
      if (n is EncryptedTotemStateCompleted) {
        context.maybePop();
        launchTotemDialog(context, n.totemData);
      }
    });

    final state = ref.watch(encryptedTotemNotifierProvider(link));

    final size = MediaQuery.sizeOf(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxWidth: size.width * 0.8,
        ),
        child: switch (state) {
          EncryptedTotemStateLoading() => LoadingWidget(),
          EncryptedTotemStateFailure() => ErrorWidget(
              errorState: state,
              onRetry: () {
                ref.invalidate(encryptedTotemNotifierProvider(link));
              }),
          _ => SizedBox.shrink(),
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        const SizedBox(height: 8),
        Text(
          'redeem_personal_totem.processing'.tr(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ErrorWidget extends ConsumerWidget {
  final EncryptedTotemStateFailure errorState;
  final Function()? onRetry;

  const ErrorWidget({
    required this.errorState,
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
        const SizedBox(height: 8),
        Text(
          errorState.failure.errorDescription(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (errorState.failure == PersonalTotemFailure.generic)
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
                switch (errorState.failure) {
                  case PersonalTotemFailure.gpsDisabled:
                    late final StreamSubscription sub;
                    sub = Geolocator.getServiceStatusStream().listen((status) {
                      if (status == ServiceStatus.enabled) {
                        sub.cancel();
                        onRetry?.call();
                      }
                    });
                    Geolocator.openLocationSettings();
                    break;
                  case PersonalTotemFailure.missingPermissions:
                    Geolocator.openAppSettings();
                    break;
                  case PersonalTotemFailure.outOfTime:
                  case PersonalTotemFailure.outOfDistance:
                    context.maybePop();
                    break;
                  case PersonalTotemFailure.generic:
                    onRetry?.call();
                    break;
                }
              },
              child: Text(errorState.failure.errorAction()),
            ),
          ],
        ),
      ],
    );
  }
}
