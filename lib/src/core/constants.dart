import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/config.dart';

late String domain;
late String registryKey;
Flavor? flavor;

bool get isDev => flavor == Flavor.DEVELOPMENT;

String get appName => '${flavor == Flavor.DEVELOPMENT ? 'DEV ' : ''}WOM POCKET';

const exchangeSourceId = '64e5f0c93a5339481060a756';

const welcomeTotem =
    'https://link.wom.social/cmi/e3441c34-b02c-4bd9-8de5-9e312468ca69/d67c6e3a-053a-4cb7-b4ce-d1d0427c6cad';

const functionsBaseUrl =
    'https://europe-west3-count-me-in-ef93b.cloudfunctions.net';

const encryptKey = 'ce8dFAkMDBEOECEZCxgMBiAUFQwKFhg=';

const maxPersonalDistanceInMeters = 1000;
const maxTimeRangeInSeconds = 60;
const digitProviderId = 'e3441c34-b02c-4bd9-8de5-9e312468ca69';
const myContactsEventId = 'f3cfd410-09cc-4b34-8b00-e4f9e0bf1420';
//Tutorial keys
const t_scan = 'scan3';
const t_home = 'home3';
const t_offers = 'offers3';
const t_settings = 'settings3';

//Shared Preferences
const isFirstOpenKey = 'isFirstOpenV3';
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
