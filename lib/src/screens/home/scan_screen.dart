import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:wom_pocket/src/widgets/scanner_overlay_shape.dart';
import '../../my_logger.dart';
import '../../utils/colors.dart';

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

  bool scanned = false;
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
    return Scaffold(body: Builder(builder: (context) {
      return Stack(
        children: [
          MobileScanner(
            onScannerStarted: (args) {
              logger.i('Scanner onScannerStarted');
            },
            controller: cameraController,
            onDetect: (barcode) {
              logger.i('Scanner onDetect');
              // if (scanned) return;
              // scanned = true;
              final qr = barcode.barcodes.first.rawValue;
              cameraController.stop();
              Navigator.of(context).pop(qr);
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
          ),
         /* Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Slider(
                max: 1,
                divisions: 100,
                value: _zoomFactor,
                label: "${(_zoomFactor * 100).toStringAsFixed(0)} %",
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _zoomFactor = value;
                    cameraController.setZoomScale(value);
                  });
                },
              ),
            ],
          ),*/
          GestureDetector(
            onScaleUpdate: (details) {
              _zoomFactor += _scaleSensitivity * (details.scale - 1);
              _zoomFactor = _zoomFactor.clamp(0.0, 1.0);
              setState(() {});
              cameraController.setZoomScale(_zoomFactor);
            },
          )
        ],
      );
    }));
  }

/*  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanned) return;

      scanned = true;
      print(scanData.code);
      Navigator.of(context).pop(scanData.code);
    });
  }*/
}
