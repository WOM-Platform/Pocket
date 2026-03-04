import 'dart:math';

import 'package:encrypt/encrypt.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce/hive.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

class Utils {
  // //TODO delete in release
  // static Future<bool> isFakeMode() async {
  //   MmkvFlutter mmkv = await MmkvFlutter.getInstance();
  //   final isSuggestionsDisabled = await mmkv.getBool(IS_FAKE_MODE);
  //   if (isSuggestionsDisabled != null) {
  //     return isSuggestionsDisabled;
  //   }
  //   mmkv.setBool(IS_FAKE_MODE, false);
  //   return false;
  // }

  // //TODO delete in release
  // static Future<bool> setFakeModeToSharedPreference(bool status) async {
  //   MmkvFlutter mmkv = await MmkvFlutter.getInstance();
  //   return await mmkv.setBool(IS_FAKE_MODE, status);
  // }

  //  static bool Contains(Bounds bounds, double latitude, double longitude) {
  //
  //    bool inLatRange = (bounds.leftTop[0] > bounds.rightBottom[0])
  //        ? (latitude <= bounds.leftTop[0] && latitude >= bounds.rightBottom[0])
  //        : (latitude <= bounds.leftTop[0] || latitude >= bounds.rightBottom[0]);
  //    bool inLngRange = (bounds.leftTop[1] < bounds.rightBottom[1])
  //        ? (longitude >= bounds.leftTop[1] && longitude <= bounds.rightBottom[1])
  //        : (longitude >= bounds.leftTop[1] ||
  //            longitude <= bounds.rightBottom[1]);
  //
  //    return inLatRange && inLngRange;
  //  }
  //
  //  final query = "where Latitude <= ${leftTop.latitude} AND Latitude >= ${rightBottom.latitude}";
  //  final query2 = "where Latitude <= ${leftTop.latitude} OR Latitude >= ${rightBottom.latitude}";
  //  final query3 = "where Longitude >= ${leftTop.longitude} AND Longitude <= ${rightBottom.longitude}";
  //  final query4 = "where Longitude >= ${leftTop.longitude} OR Longitude <= ${rightBottom.longitude}";
  //
  //

  //Check if is the first open
  //  static Future<bool> isFirstOpen() async {
  //    final isFirstOpen = await readIsFirstOpen();
  //    logger.i(isFirstOpen);
  //    if (isFirstOpen == true) {
  //      return !isFirstOpen;
  //    }
  //    await setFirstOpen(true);
  //    return true;
  //  }

  //Check if is the first open
  static Future<bool> readIsFirstOpen() async {
    final isFirstOpen = await Hive.box(
      'settings',
    ).get(isFirstOpenKey, defaultValue: false);
    return !isFirstOpen;
  }

  static Future setIsFirstOpen(bool value) async {
    await Hive.box('settings').put(isFirstOpenKey, !value);
  }

  static launchURL(String url) async {
    Sentry.addBreadcrumb(Breadcrumb(message: 'launchURL: $url'));
    final uri = Uri.parse(url);
    await launchUri(uri);
  }

  static launchUri(Uri uri) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        logger.e('Could not launch $uri');
      }
    } catch (ex, st) {
      logger.e('Could not launch $uri', error: ex, stackTrace: st);
    }
  }

  static Future<String> getPublicKey() async {
    if (isDev) {
      return await _loadKey('assets/registry_dev.pub');
    }
    return await _loadKey('assets/registry.pub');
  }

  static Future<String> _loadKey(String path) async {
    return await rootBundle.loadString(path);
  }

  // static Future<void> closeDb() async {
  //   final dbFile = await getDbFile('pocket.db');
  //   if (dbFile != null) {
  //     await AppDatabase.get().closeDatabase();
  //   }
  // }
  //
  // static Future<bool> deleteDB() async {
  //   try {
  //     final dbFile = await getDbFile('pocket.db');
  //     if (dbFile != null) {
  //       await AppDatabase.get().deleteDb();
  //       await dbFile.delete();
  //       return true;
  //     }
  //     return false;
  //   } catch (ex) {
  //     logger.e(ex);
  //     return false;
  //   }
  // }
  //
  // static Future<File?> getDbFile(String name) async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   logger.i(dir.path);
  //   if (await dir.exists()) {
  //     File dbFile = File(dir.path + "/" + name);
  //     if (await dbFile.exists()) {
  //       return dbFile;
  //     }
  //   }
  //   return null;
  // }

  static List<int> encryptWithAes(String text, String k) {
    final key = Key.fromUtf8(k);
    final iv = IV.allZerosOfLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    // final decrypted = encrypter.decrypt(encrypted, iv: iv);
    // logger.i(decrypted);
    // logger.i(encrypted.base64);
    return encrypted.bytes;
  }

  static List<int> encryptBytesWithAes(Uint8List bytes, String k) {
    final key = Key.fromUtf8(k);
    final iv = IV.allZerosOfLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encryptBytes(bytes, iv: iv);
    return encrypted.bytes;
  }

  static Uint8List decryptBytesWithAes(Uint8List bytes, String k) {
    final key = Key.fromUtf8(k);
    final iv = IV.allZerosOfLength(16);

    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decryptBytes(Encrypted(bytes), iv: iv);

    // logger.i(decrypted);
    // logger.i(encrypted.base64);
    return Uint8List.fromList(decrypted);
  }

  static String getRandomString(int length) {
    final _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class WomExportData extends Equatable {
  final String path;
  final String partialKey;
  final List<int> bytes;
  final int womCount;
  final int totemsCount;

  WomExportData(
    this.path,
    this.bytes,
    this.partialKey,
    this.womCount,
    this.totemsCount,
  );

  @override
  List<Object?> get props => [path, partialKey, bytes, womCount, totemsCount];
}

const connectionBaseUrl = 'https://link.wom.social/connection';

String getMyTotemLink(String totemId) {
  return '$connectionBaseUrl/$totemId';
}

String aesDecrypt(String encrypted) {
  final decrypted = encrypter.decrypt(Encrypted.fromBase64(encrypted), iv: iv);
  return decrypted.toString();
}

final key = Key.fromUtf8(encryptKey);
final iv = IV.fromLength(16);

final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

String aesEncrypt(String text) {
  final encrypted = encrypter.encrypt(text, iv: iv);
  return encrypted.base64;
}

ConnectionTotemData? createTotemLinkFromConnection(String link) {
  if (validatePersonalConnection(link) == null) {
    return null;
  }
  // final encrypted = link.split('/').last;
  // final decoded = Uri.decodeComponent(encrypted);
  // final decrypted = aesDecrypt(decoded);
  // final url = '$connectionBaseUrl/$decrypted';
  final url = link;
  final uri = Uri.tryParse(url);
  if (uri == null) {
    return null;
  }

  final version = uri.pathSegments[1];
  final totemId = uri.pathSegments[2];

  if (totemId.isEmpty) {
    return null;
  }

  final timestamp = int.tryParse(uri.queryParameters['timestamp'] ?? '');
  final latitude = double.tryParse(uri.queryParameters['latitude'] ?? '');
  final longitude = double.tryParse(uri.queryParameters['longitude'] ?? '');

  if (timestamp != null && latitude != null && longitude != null) {
    return ConnectionTotemData(
      totemId: totemId,
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp),
      lat: latitude,
      long: longitude,
    );
  }
  return null;
}

String? getChallengeIdFromLink(String link) {
  try {
    if (validateChallenge(link) == null) {
      return null;
    }
    final url = link;
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return null;
    }

    final version = uri.pathSegments[1];
    final challengeId = uri.pathSegments[2];

    if (challengeId.isEmpty) {
      return null;
    }

    return challengeId;
  } catch (ex) {
    return null;
  }
}

extension StringX on String? {
  bool get isNullOrEmpty {
    final tmp = this;
    return tmp == null || tmp.isEmpty;
  }
}
