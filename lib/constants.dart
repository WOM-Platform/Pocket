import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wom_pocket/src/utils/config.dart';

import 'src/utils/colors.dart';

late String domain;
late String registryKey;
Flavor? flavor;
final isDev = flavor == Flavor.DEVELOPMENT;
final appName = '${flavor == Flavor.DEVELOPMENT ? 'DEV ' : ''}WOM POCKET';

//Tutorial keys
const t_scan = 'scan3';
const t_home = 'home3';
const t_offers = 'offers3';
const t_settings = 'settings3';

//Shared Preferences
const IS_FIRST_OPEN = 'isFirstOpenV2';
const IS_SUGGESTIONS_DISABLED = 'isSuggestionsDisabled';
const IS_FAKE_MODE = 'isFakeMode';
const boxMigrationKey = 'migration';
const exportedMigrationDataKey = 'exportedMigrationDataKey';
const exportDeeplinkKey = 'exportDeeplinkKey';
const exportPartialKeyKey = 'exportPartialKeyKey';

//Image Path
const IMAGE_PATH_INTRO_1 = 'assets/images/team.png';
const IMAGE_PATH_INTRO_2 = 'assets/images/piggy-bank.png';
const IMAGE_PATH_INTRO_3 = 'assets/images/shop.png';

const ALPHANUMERIC_CHARS = 'abcdefghijklmnopqrstuvwxyz0123456789';

const int oneDayInMilliseconds = 86400;

class AimDbKeys {
  static const TABLE_NAME = 'aims';
  static const ID = 'id';
  static const CODE = 'code';
  static const ICON_URL = 'iconFile';
  static const CHILDREN = 'children';
  static const TITLES = 'titles';
}

final t = SystemUiOverlayStyle();
final darkUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
  statusBarColor: primaryColor,
  systemNavigationBarColor: primaryColor,
  statusBarBrightness: Brightness.light, //iOS
  statusBarIconBrightness: Brightness.light, //Android
);

final lightUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Colors.white,
  systemNavigationBarColor: Colors.white,
  statusBarBrightness: Brightness.dark, //iOS
  statusBarIconBrightness: Brightness.dark, //Android
);
