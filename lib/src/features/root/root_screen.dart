import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wom_pocket/src/core/services/app_repository.dart';
import 'package:wom_pocket/src/features/exchange/ui/screens/exchange.dart';
import 'package:wom_pocket/src/features/offers/ui/offers_screen.dart';

import 'package:wom_pocket/src/features/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/features/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/features/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/features/nfc/utils.dart';
import 'package:wom_pocket/src/features/scanner/ui/scan_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:wom_pocket/src/core/application/app_notifier.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/features/pin/pin_screen.dart';
import 'package:wom_pocket/src/features/settings/settings.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class RootScreen extends StatefulHookConsumerWidget {
  static const String path = '/home';

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  void initState() {
    super.initState();

    checkVersion();
  }

  Future checkVersion() async {
    final status = await ref.read(appNotifierProvider.notifier).getAppStatus();
    logger.i(status);
    if (!status.isOk) {
      // SchedulerBinding.instance?.addPostFrameCallback((Duration duration) {
      final actionText = status.isOutOfService
          ? 'try_again'.tr().toUpperCase()
          : 'update'.tr().toUpperCase();

      Alert(
        context: context,
        title: getTitle(status.status),
        onWillPopActive: !status.isCanUpdate,
        closeFunction: () {},
        closeIcon: const SizedBox.shrink(),
        buttons: [
          DialogButton(
            child: Text(actionText),
            onPressed: () {
              if (status.isOutOfService) {
                Navigator.of(context).pop();
                checkVersion();
              } else {
                StoreRedirect.redirect(
                  androidAppId: 'social.wom.pocket',
                  iOSAppId: '1466969163',
                );
              }
            },
          ),
        ],
      ).show();
      // });
    }
  }

  String getTitle(AppStatusEnum status) {
    switch (status) {
      case AppStatusEnum.mustUpdate:
        return 'appMustUpdateDesc'.tr();
      case AppStatusEnum.shouldUpdate:
        return 'appShouldUpdateDesc'.tr();
      case AppStatusEnum.outOfService:
      default:
        return 'appOutOfService'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = useState<int>(0);

    final titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    final descStyle = TextStyle(
      fontSize: 20,
    );
    return Scaffold(
      body: IndexedStack(
        index: index.value,
        children: [
          NewHome(),
          OffersListScreen(),
          ExchangeScreen(),
          // BadgeScreen(),
          SettingsScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        label: Text(
          'scan'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.camera_enhance,
          color: Colors.white,
        ),
        onPressed: () => _startScan(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFF96BBD9),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'offers'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.handCoin),
            label: 'exchange'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings_title'.tr(),
          ),
        ],
        currentIndex: index.value,
        onTap: (i) {
          if (index.value == i) return;
          if (i == 0) {
            logEvent('open_home');
          } else if (i == 1) {
            logEvent('open_offers');
          } else if (i == 2) {
            logEvent('open_settings');
          }
          index.value = i;
        },
      ),
    );
  }

  _startScan(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection) {
      logEvent('open_wom_scan');
      try {
        final link = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ScanScreen(),
          ),
        );
        logger.w('_startScan: $link');
        if (link == null) return;
        final totemData = validateTotemQrCodeWithRegex(link);
        if (totemData != null) {
          launchTotemDialog(context, totemData);
        } else {
          final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));
          logger.i('wom_scan_done $link');
          logEvent('wom_scan_done');
          if (deepLinkModel.type == TransactionType.MIGRATION_IMPORT) {
            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (context) => ProviderScope(
                  overrides: [
                    deeplinkProvider.overrideWithValue(deepLinkModel),
                    importNotifierProvider,
                  ],
                  child: ImportScreen(),
                ),
              ),
            );
          } else {
            logger.i('go to pin screen $deepLinkModel');
            await Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (context) => ProviderScope(
                  overrides: [
                    deeplinkProvider.overrideWithValue(deepLinkModel),
                  ],
                  child: PinScreen(),
                ),
              ),
            );
          }
        }
      } on PlatformException {
        rethrow;
      } on FormatException {
        throw FormatException('scanError'.tr());
      } catch (ex, st) {
        logger.e(st);
        throw ex;
      }
    } else {
      Alert(
        context: context,
        style: AlertStyle(),
        type: AlertType.warning,
        title: 'no_connection_title'.tr(),
        desc: 'no_connection_desc'.tr(),
        buttons: [
          DialogButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ).show();
    }
  }
}
