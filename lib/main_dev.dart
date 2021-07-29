import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket/src/my_logger.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/utils/config.dart';
import 'app.dart';

import 'constants.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.i('DEV VERSION');
  flavor = Flavor.DEVELOPMENT;
  domain = 'dev.wom.social';
  registryKey = await Utils.getPublicKey();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.red,
  ));

  runApp(
    DevicePreview(
      enabled: !kDebugMode,
      builder: (context) => App(
        appRepository: AppRepository(),
      ),
    ),
  );
}
