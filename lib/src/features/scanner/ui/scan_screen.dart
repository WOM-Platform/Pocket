import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/features/scanner/application/scanner_state.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
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

  bool cameraOnPause = false;
  double _zoomFactor = 0.0;
  final double _scaleSensitivity = 0.05;

  @override
  void dispose() {
    logger.i('ScanScreen disposed');
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(controller: cameraController, onDetect: onDetect),
              // Container(
              //   decoration: ShapeDecoration(
              //     shape: QrScannerOverlayShape(
              //       borderColor: lightBlue,
              //       borderRadius: 3,
              //       borderWidth: 10,
              //       cutOutSize: MediaQuery.of(context).size.width * (3 / 4),
              //     ),
              //   ),
              // ),
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
                    context.maybePop();
                  },
                ),
              ),
              GestureDetector(
                onScaleUpdate: (details) {
                  _zoomFactor += _scaleSensitivity * (details.scale - 1);
                  _zoomFactor = _zoomFactor.clamp(0.0, 1.0);
                  setState(() {});
                  cameraController.setZoomScale(_zoomFactor);
                },
              ),
              ScanInfo(
                onUpdate: (_cameraOnPause) {
                  setState(() {
                    cameraOnPause = _cameraOnPause;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void onDetect(BarcodeCapture barcode) {
    logger.i('Scanner onDetect new');

    if (!cameraOnPause) {
      if (barcode.barcodes.isNotEmpty) {
        logger.i('scanner detects ${barcode.barcodes.length} QR');
        setState(() {
          cameraOnPause = true;
        });
        final res = ref
            .read(scannerProvider.notifier)
            .onProcessing(barcode.barcodes);
        if (!res) {
          setState(() {
            cameraOnPause = false;
          });
        }
      }
    }
  }

  // old
  onDetectOld(barcode) {
    logger.i('Scanner onDetect');
    // if (scanned) return;
    // scanned = true;
    final qr = barcode.barcodes.first.rawValue;
    cameraController.stop();
    context.maybePop(qr);
  }
}

class TopMessage extends StatelessWidget {
  final String text;

  const TopMessage({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

class ScanInfo extends ConsumerWidget {
  final Function(bool) onUpdate;

  const ScanInfo({required this.onUpdate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 64, 24, 24),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(scannerProvider);
            return switch (state) {
              ScannerStateEmpty() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: TopMessage(text: 'scanStateEmpty'.tr())),
                  Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Chip(
                        label: Text(
                          'scanning'.tr(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ScannerStateSingle() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: TopMessage(text: 'scanStateSingle'.tr())),
                  Spacer(),
                  Center(
                    child: FloatingActionButton.extended(
                      backgroundColor: primaryColor,
                      label: Text(
                        getText(state.scanAction),
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.maybePop(state.url);
                      },
                    ),
                  ),
                ],
              ),
              ScannerStateMultiple() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: TopMessage(text: 'scanStateMultiple'.tr())),
                  Spacer(),
                  Center(
                    child: FloatingActionButton.extended(
                      backgroundColor: primaryColor,
                      label: Text(
                        'scanContinueToScan'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ref.read(scannerProvider.notifier).reset();
                        Future.delayed(Duration(milliseconds: 250), () {
                          onUpdate(false);
                        });
                      },
                    ),
                  ),
                ],
              ),
              _ => Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Chip(
                    label: Text('scanning'.tr(), textAlign: TextAlign.center),
                  ),
                ),
              ),
            };
          },
        ),
      ),
    );
  }

  // getText(TransactionType type) {
  //   return switch (type) {
  //     TransactionType.VOUCHERS => 'scanGetWom'.tr(),
  //     TransactionType.PAYMENT => 'scanPay'.tr(),
  //     TransactionType.MIGRATION_IMPORT => 'scanImportMigration'.tr(),
  //     TransactionType.EXCHANGE_IMPORT => 'scanExchangeImport'.tr(),
  //     _ => 'scanGetWom'.tr()
  //   };
  // }

  getText(ScanAction action) {
    return switch (action) {
      ScanAction.redeem => 'scanGetWom'.tr(),
      ScanAction.pay => 'scanPay'.tr(),
      ScanAction.openChallenge => 'scanOpenChallenge'.tr(),
      ScanAction.importMigration => 'scanImportMigration'.tr(),
      ScanAction.importExchange => 'scanExchangeImport'.tr(),
    };
  }
}
