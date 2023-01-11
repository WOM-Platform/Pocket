import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/application/app_notifier.dart';
import 'package:wom_pocket/src/new_home/ui/new_home.dart';
import 'package:wom_pocket/src/offers/ui/offers_screen.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:wom_pocket/src/widgets/scanner_overlay_shape.dart';
import '../../models/deep_link_model.dart';
import '../../my_logger.dart';
import '../../screens/map/map_screen.dart';
import '../../screens/pin/pin_screen.dart';
import '../../screens/settings/settings.dart';
import '../../utils/colors.dart';
import '../../utils/my_extensions.dart';

// final selectedIndexProvider = StateProvider<int>((ref) {
//   logger.w('selectedIndexProvider CREATE');
//   return 0;
// });

class HomeScreen2 extends StatefulHookConsumerWidget {
  static const String path = '/home';

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends ConsumerState<HomeScreen2> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      _showTutorial(context);
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
    return Scaffold(
      body: IndexedStack(
        index: index.value,
        children: [
          NewHome(),
          /*Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                  appName,
              // centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              // brightness: Brightness.dark,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: WomStatsWidget(),
              ),
              actions: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.info),
                //   color: Theme.of(context).colorScheme.secondary,
                //   onPressed: () async {
                //     await _clearTutorial(context);
                //     _showTutorial(context);
                //   },
                // ),
                IconButton(
                  icon: Icon(Icons.map),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () async {
                    _goToMap();
                  },
                ),
              ],
            ),
            extendBody: true,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Arc(
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    height: 50,
                  ),
                ),
                TransactionsList(),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: DescribedFeatureOverlay(
              featureId: 'add_item_feature_id',
              tapTarget: FloatingActionButton.extended(
                elevation: 0,
                backgroundColor: Colors.white,
                label: Text(
                  AppLocalizations.of(context)!.translate('scan'),
                  style: TextStyle(color: baseIconColor),
                ),
                icon: const Icon(
                  Icons.camera_enhance,
                  color: baseIconColor,
                ),
                onPressed: null,
              ),
              // The widget that will be displayed as the tap target.
              title: Text(context.translate('tutorial_welcome_title')!),
              description: Text('tutorial_welcome_desc'.translate(context)!),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              targetColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              child: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                label: Text(
                  AppLocalizations.of(context)!.translate('scan'),
                  style: TextStyle(color: baseIconColor),
                ),
                icon: const Icon(
                  Icons.camera_enhance,
                  color: baseIconColor,
                ),
                onPressed: () => _startScan(),
              ),
            ),
          ),*/
          OffersListScreen(),
          // BadgeScreen(),
          SettingsScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DescribedFeatureOverlay(
        featureId: 'add_item_feature_id',
        tapTarget: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.white,
          label: Text(
            AppLocalizations.of(context)!.translate('scan'),
            style: TextStyle(color: baseIconColor),
          ),
          icon: const Icon(
            Icons.camera_enhance,
            color: baseIconColor,
          ),
          onPressed: null,
        ),
        // The widget that will be displayed as the tap target.
        title: Text(context.translate('tutorial_welcome_title')!),
        description: Text('tutorial_welcome_desc'.translate(context)!),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        targetColor: Colors.white,
        textColor: Theme.of(context).primaryColor,
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
              featureId: 'home',
              title: Text('Titolo'),
              description: Text(
                  'qui troverai un rapido resoconto sul tuo borsellino, potrai accedere a info pià dettagliate'),
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
              featureId: 'offers',
              title: Text('Titolo'),
              description: Text(
                  'qui troverai un rapido resoconto sul tuo borsellino, potrai accedere a info pià dettagliate'),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.discount),
                  Text('Offerte'),
                ],
              ),
              child: Icon(Icons.discount),
            ),
            label: 'Offerte',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.badge),
          //   label: 'Badge',
          // ),
          BottomNavigationBarItem(
            icon: DescribedFeatureOverlay(
              featureId: 'settings',
              title: Text('Titolo'),
              description: Text(
                  'qui troverai un rapido resoconto sul tuo borsellino, potrai accedere a info pià dettagliate'),
              tapTarget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings),
                  Text('Impostazioni'),
                ],
              ),
              child: Icon(Icons.settings),
            ),
            label: 'Impostazioni',
          ),
        ],
        currentIndex: index.value,
        onTap: (i) {
          if (i == 0) {
            logEvent('open_home');
            _clearTutorial(context);
          } else if (i == 1) {
            logEvent('open_offers');
          } else if (i == 2) {
            logEvent('open_settings');
          }
          index.value = i;
        },
      ),
      /*bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        color: Theme.of(context).primaryColor,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DescribedFeatureOverlay(
              featureId: 'show_map_info',
              // Unique id that identifies this overlay.
              tapTarget: const Icon(Icons.map),
              // The widget that will be displayed as the tap target.
              title: Text(context.translate('tutorial_map_title')!),
              description: Text(context.translate('tutorial_map_desc')!),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              targetColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(Icons.map,
                    color: Theme.of(context).colorScheme.secondary),
                onPressed: () => _goToMap(),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            DescribedFeatureOverlay(
              featureId: 'show_demo_info',
              // Unique id that identifies this overlay.
              tapTarget: const Icon(Icons.settings),
              // The widget that will be displayed as the tap target.
              title: Text(context.translate('tutorial_settings_title')!),
              description: Text(context.translate('tutorial_settings_desc')!),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              targetColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(
                  Icons.list,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () => _goToSettings(),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            DescribedFeatureOverlay(
              featureId: 'show_demo_info',
              // Unique id that identifies this overlay.
              tapTarget: const Icon(Icons.settings),
              // The widget that will be displayed as the tap target.
              title: Text(context.translate('tutorial_settings_title')!),
              description: Text(context.translate('tutorial_settings_desc')!),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              targetColor: Colors.white,
              textColor: Theme.of(context).primaryColor,
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () => _goToSettings(),
              ),
            ),
          ],
        ),
      ),*/
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
        final link = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ScanScreen()));

        final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));
        logEvent('wom_scan_done');
//            var blocProviderPin = myBlocProvider.BlocProvider(
//              bloc: PinBloc(),
//              child: PinScreen(
//                deepLinkModel: deepLinkModel,
//              ),
//            );
//         _pinBloc = PinBloc(deepLinkModel);
//         var blocProviderPin = BlocProvider(
//           create: (context) => _pinBloc!,
//           child: PinScreen(),
//         );
        await Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (context) => ProviderScope(
              overrides: [deeplinkProvider.overrideWithValue(deepLinkModel)],
              child: PinScreen(),
            ),
          ),
        );
      } on PlatformException catch (ex) {
        // if (ex == BarcodeScanner.CameraAccessDenied) {
        //   throw ex;
        // } else {
        //   throw Exception("unknow error");
        // }
        rethrow;
      } on FormatException {
        throw FormatException(
            "Hai premuto il pulsante back prima di acquisire il dato");
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

  /*_startScan() async {
//            final String link = await showEditField(context);
//          final link = "https://wom.social/vouchers/f6f8fd2a8c424a60aa23f8f444742f13";
//            final link =
//                "https://wom.social/payment/de8eac804f9a477bbf3ba0e111139f2a";
//            final String link = await bloc.scanQRCode();
    if (await InternetConnectionChecker().hasConnection) {
      logEvent('open_wom_scan');
      try {
        final link = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ScanScreen()));

        final deepLinkModel = DeepLinkModel.fromUri(Uri.parse(link));
        logEvent('wom_scan_done');
//            var blocProviderPin = myBlocProvider.BlocProvider(
//              bloc: PinBloc(),
//              child: PinScreen(
//                deepLinkModel: deepLinkModel,
//              ),
//            );
//         _pinBloc = PinBloc(deepLinkModel);
//         var blocProviderPin = BlocProvider(
//           create: (context) => _pinBloc!,
//           child: PinScreen(),
//         );
        await Navigator.push(
          context,
          MaterialPageRoute<bool>(
            builder: (context) => ProviderScope(
              overrides: [deeplinkProvider.overrideWithValue(deepLinkModel)],
              child: PinScreen(),
            ),
          ),
        );
      } on PlatformException catch (ex) {
        // if (ex == BarcodeScanner.CameraAccessDenied) {
        //   throw ex;
        // } else {
        //   throw Exception("unknow error");
        // }
        rethrow;
      } on FormatException {
        throw FormatException(
            "Hai premuto il pulsante back prima di acquisire il dato");
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
  }*/

/*  _showInfo() {
    Alert(
      context: context,
      title: AppLocalizations.of(context).translate('more_info'),
      desc: 'www.wom.social',
      buttons: [
        DialogButton(
          child: Text(AppLocalizations.of(context).translate('go_to_website')),
          onPressed: () {
            _launchURL();
          },
        )
      ],
    ).show();
  }

  _launchURL() async {
    const url = 'https://wom.social';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  @override
  void dispose() {
    _clearTutorial(context);
    super.dispose();
  }

  Future<void> _clearTutorial(context) async {
    await FeatureDiscovery.clearPreferences(
      context,
      const <String>{
        'home',
        'offers',
        'settings',
      },
    );
  }

  void _showTutorial(BuildContext context) {
    FeatureDiscovery.discoverFeatures(
      context,
      const <String>{
        'home',
        'offers',
        'settings',
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
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  MobileScannerController? controller;

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
          key: qrKey,
          onDetect: (barcode, args) {
            if (scanned) return;
            scanned = true;
            Navigator.of(context).pop(barcode.rawValue);
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
    controller?.dispose();
    super.dispose();
  }
}
