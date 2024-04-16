import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wom_pocket/constants.dart';

import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/models/totem_data.dart';
import 'package:wom_pocket/src/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/offers/ui/offers_screen.dart';
import 'package:wom_pocket/src/screens/home/scan_screen.dart';
import 'package:wom_pocket/src/screens/home/widgets/totem_dialog.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:store_redirect/store_redirect.dart';
import '../../models/deep_link_model.dart';
import '../../my_logger.dart';
import '../../screens/pin/pin_screen.dart';
import '../../screens/settings/settings.dart';
import '../../utils/colors.dart';

class HomeScreen2 extends StatefulHookConsumerWidget {
  static const String path = '/home';

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends ConsumerState<HomeScreen2> {
  @override
  void initState() {
    super.initState();
    FeatureDiscovery.hasPreviouslyCompleted(context, t_scan).then((value) {
      if (!value) {
        SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
          _showTutorial(context);
        });
      }
    });

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
                child: Text(actionText ?? '-'),
                onPressed: () {
                  if (status.isOutOfService) {
                    Navigator.of(context).pop();
                    checkVersion();
                  } else {
                    StoreRedirect.redirect(
                        androidAppId: 'social.wom.pocket',
                        iOSAppId: '1466969163');
                  }
                }),
          ]).show();
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
      floatingActionButton: DescribedFeatureOverlay(
        featureId: t_scan,
        contentLocation: ContentLocation.above,
        overflowMode: OverflowMode.extendBackground,
        // enablePulsingAnimation: false,
        tapTarget: SizedBox(
          // width: 200,
          child: Row(
            // crossAxisAlignment: ,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.camera_enhance,
                color: primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                'Scan',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
        // The widget that will be displayed as the tap target.
        title: Text(
          'homeTutorialTitle1'.tr(),
          style: titleStyle,
        ),
        description: Text('homeTutorialDesc1'.tr()),
        child: FloatingActionButton.extended(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFF96BBD9),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_home,
              title: Text(
                'homeTutorialTitle2'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'homeTutorialDesc2'.tr(),
                style: TextStyle(fontSize: 20),
              ),
              backgroundColor: primaryColor,
              // targetColor: lightBlue,
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_balance_wallet, color: primaryColor),
                  Text('Home'),
                ],
              ),
              child: Icon(Icons.account_balance_wallet),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_offers,
              title: Text(
                'homeTutorialTitle3'.tr(),
                style: titleStyle,
              ),
              description: Text(
                'homeTutorialDesc3'.tr(),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.discount),
                  Text(
                    'offers'.tr(),
                  ),
                ],
              ),
              child: Icon(Icons.discount),
            ),
            label: 'offers'.tr(),
          ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_offers,
              title: Text(
                'homeTutorialTitle5'.tr(),
                style: titleStyle,
              ),
              description: Text(
                'homeTutorialDesc5'.tr(),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(MdiIcons.handCoin),
                  Text(
                    'exchange'.tr(),
                  ),
                ],
              ),
              child: Icon(MdiIcons.handCoin),
            ),
            label: 'exchange'.tr(),
          ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_settings,
              title: Text(
                'homeTutorialTitle4'.tr(),
                style: titleStyle,
              ),
              description: Text(
                'homeTutorialDesc4'.tr(),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings),
                  Text(
                    'settings_title'.tr(),
                  ),
                ],
              ),
              child: Icon(Icons.settings),
            ),
            label: 'settings_title'.tr(),
          ),
        ],
        currentIndex: index.value,
        onTap: (i) {
          if (index.value == i) return;
          if (i == 0) {
            logEvent('open_home');
            Future.delayed(Duration(milliseconds: 100)).then((value) {
              FeatureDiscovery.hasPreviouslyCompleted(context, t_scan)
                  .then((value) {
                if (value) {
                  _showTutorial(context);
                }
              });
            });
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
        logger.wtf('_startScan: $link');
        if (link == null) return;
        final totemData = validateTotemQrCodeWithRegex(link);
        if (totemData != null) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => PopScope(
              canPop: false,
              child: Dialog(
                child: TotemDialog(
                  totemData: totemData,
                ),
              ),
            ),
          );
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
                    importNotifierProvider
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
                    deeplinkProvider.overrideWithValue(deepLinkModel)
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
          )
        ],
      ).show();
    }
  }

  void _showTutorial(BuildContext context) {
    FeatureDiscovery.discoverFeatures(
      context,
      const <String>{
        t_scan,
        t_home,
        t_offers,
        t_settings,
      },
    );
  }
}