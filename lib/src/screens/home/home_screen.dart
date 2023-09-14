import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/exchange/ui/screens/exchange.dart';
import 'package:wom_pocket/src/migration/application/import_notifier.dart';
import 'package:wom_pocket/src/migration/ui/import_screen.dart';
import 'package:wom_pocket/src/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/offers/ui/offers_screen.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:wom_pocket/src/widgets/scanner_overlay_shape.dart';
import '../../models/deep_link_model.dart';
import '../../my_logger.dart';
import '../../screens/pin/pin_screen.dart';
import '../../screens/settings/settings.dart';
import '../../utils/colors.dart';
import '../../utils/my_extensions.dart';

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

  checkVersion() async {
    final status = await ref.read(appNotifierProvider.notifier).getAppStatus();
    logger.i(status);
    if (!status.isOk) {
      // SchedulerBinding.instance?.addPostFrameCallback((Duration duration) {
      final actionText = status.isOutOfService
          ? context.translate('closeApp')?.toUpperCase()
          : context.translate('update')?.toUpperCase();

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
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
        return context.translate('appMustUpdateDesc') ?? '';
      case AppStatusEnum.shouldUpdate:
        return context.translate('appShouldUpdateDesc') ?? '';
      case AppStatusEnum.outOfService:
      default:
        return context.translate('appOutOfService') ?? '';
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
          // ExchangeListScreen(),
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
          AppLocalizations.of(context)!.translate('homeTutorialTitle1'),
          style: titleStyle,
        ),
        description:
            Text(AppLocalizations.of(context)!.translate('homeTutorialDesc1')),
        child: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          label: Text(
            AppLocalizations.of(context)!.translate('scan'),
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
                AppLocalizations.of(context)!.translate('homeTutorialTitle2'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              description: Text(
                AppLocalizations.of(context)!.translate('homeTutorialDesc2'),
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
                AppLocalizations.of(context)!.translate('homeTutorialTitle3'),
                style: titleStyle,
              ),
              description: Text(
                AppLocalizations.of(context)!.translate('homeTutorialDesc3'),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.discount),
                  Text(
                    AppLocalizations.of(context)!.translate('offers'),
                  ),
                ],
              ),
              child: Icon(Icons.discount),
            ),
            label: AppLocalizations.of(context)!.translate('offers'),
          ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_offers,
              title: Text(
                AppLocalizations.of(context)!.translate('homeTutorialTitle5'),
                style: titleStyle,
              ),
              description: Text(
                AppLocalizations.of(context)!.translate('homeTutorialDesc5'),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(MdiIcons.handCoin),
                  Text(
                    AppLocalizations.of(context)!.translate('exchange'),
                  ),
                ],
              ),
              child: Icon(MdiIcons.handCoin),
            ),
            label: AppLocalizations.of(context)!.translate('exchange'),
          ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: t_settings,
              title: Text(
                AppLocalizations.of(context)!.translate('homeTutorialTitle4'),
                style: titleStyle,
              ),
              description: Text(
                AppLocalizations.of(context)!.translate('homeTutorialDesc4'),
                style: descStyle,
              ),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings),
                  Text(
                    AppLocalizations.of(context)!.translate('settings_title'),
                  ),
                ],
              ),
              child: Icon(Icons.settings),
            ),
            label: AppLocalizations.of(context)!.translate('settings_title'),
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
//            final String link = await showEditField(context);
//          final link = "https://wom.social/vouchers/f6f8fd2a8c424a60aa23f8f444742f13";
//            final link =
//                "https://wom.social/payment/de8eac804f9a477bbf3ba0e111139f2a";
//            final String link = await bloc.scanQRCode();
    if (await InternetConnectionChecker().hasConnection) {
      logEvent('open_wom_scan');
      try {
        final link = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ScanScreen(),
          ),
        );

        if (link == null) return;
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
                overrides: [deeplinkProvider.overrideWithValue(deepLinkModel)],
                child: PinScreen(),
              ),
            ),
          );
        }
      } on PlatformException catch (ex) {
        rethrow;
      } on FormatException {
        throw FormatException(
            AppLocalizations.of(context)!.translate('scanError'));
      } catch (ex, st) {
        logger.e(st);
        throw ex;
      }
    } else {
      Alert(
        context: context,
        style: AlertStyle(),
        type: AlertType.warning,
        title: AppLocalizations.of(context)!.translate('no_connection_title'),
        desc: AppLocalizations.of(context)!.translate('no_connection_desc'),
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

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Barcode? result;
  MobileScannerController cameraController = MobileScannerController();

/*  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MobileScanner(
          onScannerStarted: (args) {
            logger.i('Scanner onScannerStarted');
          },
          controller: cameraController,
          onDetect: (barcode) {
            logger.i('Scanner onDetect');
            if (scanned) return;
            scanned = true;
            Navigator.of(context).pop(barcode.barcodes.first.rawValue);
          },
        ),
        Container(
          decoration: ShapeDecoration(
            shape: QrScannerOverlayShape(
              borderColor: lightBlue,
              borderRadius: 3,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * (3 / 4),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          right: 16,
          child: IconButton(
              icon: CircleAvatar(
                child: Icon(Icons.clear),
                backgroundColor: Colors.white,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    ));
  }

  bool scanned = false;

/*  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanned) return;

      scanned = true;
      print(scanData.code);
      Navigator.of(context).pop(scanData.code);
    });
  }*/

  @override
  void dispose() {
    logger.i('ScanScreen disposed');
    cameraController.dispose();
    super.dispose();
  }
}
