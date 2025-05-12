import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/features/new_home/ui/stats.dart';
import 'package:wom_pocket/src/features/totem/application/my_totem_notifier.dart';
import 'package:wom_pocket/src/features/totem/application/my_totem_state.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';

class MyTotemScreen extends ConsumerStatefulWidget {
  const MyTotemScreen({super.key});

  @override
  ConsumerState<MyTotemScreen> createState() => _MyTotemScreenState();
}

class _MyTotemScreenState extends ConsumerState<MyTotemScreen>
    with WidgetsBindingObserver {

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final currentState = ref.read(myTotemNotifierProvider);
      if (currentState is MyTotemStateError) {
        ref.invalidate(myTotemNotifierProvider);
        WidgetsBinding.instance.removeObserver(this);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myTotemNotifierProvider);

    return Scaffold(
      appBar: SecondLevelAppBar(
        title: 'personal_totem.title'.tr(),
        actions: [
          if (state is MyTotemStateLoaded)
            IconButton(
              onPressed: () {
                var link = '/totem/account/edit?name=${state.name}';
                if (state.email?.isNotEmpty ?? false) {
                  link = link + '&email=${state.email}';
                }

                if (state.phone?.isNotEmpty ?? false) {
                  link = link + '&phone=${state.phone}';
                }

                if (state.website?.isNotEmpty ?? false) {
                  link = link + '&website=${state.website}';
                }
                context.go(link);
              },
              icon: Icon(Icons.edit),
            ),
        ],
      ),
      body: switch (state) {
        MyTotemStateLoading() => Center(
            child: CircularProgressIndicator(),
          ),
        MyTotemStateLoaded(
          totemLink: final totemLink,
          name: final name,
          email: final email,
          phone: final phone,
          website: final website,
          isRefreshing: final isRefreshing
        ) =>
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: isRefreshing
                      ? Center(child: CircularProgressIndicator())
                      : QrImageView(
                          data: totemLink,
                          size: 200,
                        ),
                ),
              ),
              if (kDebugMode)
                Center(
                    child: TextButton(
                  child: Text(totemLink),
                  onPressed: () {
                    launchMyTotemDialog(context, totemLink);
                  },
                )),
              const SizedBox(height: 8),
              TextWithLabel(
                label: 'personal_totem.name'.tr(),
                text: name,
              ),
              const SizedBox(height: 8),
              TextWithLabel(
                label: 'personal_totem.email'.tr(),
                text: email,
              ),
              const SizedBox(height: 8),
              TextWithLabel(
                label: 'personal_totem.phone'.tr(),
                text: phone,
              ),
              const SizedBox(height: 8),
              TextWithLabel(
                label: 'personal_totem.url'.tr(),
                text: website,
              ),
            ],
          ),
        MyTotemStateError(error: final error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.warning,
                size: 80,
                color: Colors.orange,
              ),
              const SizedBox(height: 8),
              Text(
                error.translate,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Center(
                child: MyButton(
                  onPressed: () {
                    switch (error) {
                      case MyTotemError.generic:
                        ref.invalidate(myTotemNotifierProvider);
                        break;
                      case MyTotemError.gpsServiceDisabled:
                        late final StreamSubscription sub;
                        sub = Geolocator.getServiceStatusStream()
                            .listen((status) {
                          if (status == ServiceStatus.enabled) {
                            sub.cancel();
                            ref.invalidate(myTotemNotifierProvider);
                          }
                        });
                        Geolocator.openLocationSettings();
                        break;
                      case MyTotemError.missingPermissions:
                        WidgetsBinding.instance.addObserver(this);
                        Geolocator.openAppSettings();
                        break;
                    }
                  },
                  child: Text(error.action),
                ),
              ),
            ],
          ),
        _ => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('personal_totem.generate_desc'.tr()),
              Center(
                child: MyButton(
                  onPressed: () {
                    context.go('/totem/account/edit');
                  },
                  child: Text('personal_totem.generate_button'.tr()),
                ),
              ),
            ],
          ),
      },
    );
  }
}
