import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wom_pocket/constants.dart';
import 'package:wom_pocket/src/db/wom_db.dart';
import 'package:wom_pocket/src/utils/config.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final isFirstOpen =
        await Hive.box('settings').get(IS_FIRST_OPEN, defaultValue: false);
    return !isFirstOpen;
  }

  static Future setIsFirstOpen(bool value) async {
    await Hive.box('settings').put(IS_FIRST_OPEN, !value);
  }

  // static Future<bool> isSuggestionsDisabled() async {
  //   final isSuggestionsDisabled = await  Hive.box('settings').get(IS_SUGGESTIONS_DISABLED);
  //   if (isSuggestionsDisabled != null) {
  //     return isSuggestionsDisabled;
  //   }
  //   mmkv.setBool(IS_SUGGESTIONS_DISABLED, false);
  //   return false;
  // }

  // static Future<bool> setIsSuggestionDisabledToSharedPreference(
  //     bool status) async {
  //   return await Hive.box('settings').put(IS_SUGGESTIONS_DISABLED, status);
  // }

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<String> getPublicKey() async {
    if (flavor == Flavor.DEVELOPMENT) {
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

  static Future<WomExportData> exportWomToJson(String pin) async {
    final woms = await WomDB.get().getAllWoms();
    if (woms.isEmpty) {
      print('woms empty');
      //TODO
      // throw Exception('Woms table is Empty');
    }
    final dir = await getTemporaryDirectory();
    print(dir.path);
    final path = '${dir.path}/wom_migration';
    final file = File(path);
    if(await file.exists()){
      await file.delete();
    }
    print('wom da esportare: ${woms.length}');
    final jsonString = jsonEncode(woms.map((e) => e.toJson()).toList());
    final key = getRandomString(28);
    final bytes = encryptWithAes(jsonString, '$key$pin');
    await file.writeAsBytes(bytes);
    print(file.path);
    return WomExportData(file.path, bytes, key);
  }

  static List<int> encryptWithAes(String text, String k) {
    final key = Key.fromUtf8(k);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    // print(encrypted.base64);
    return encrypted.bytes;
  }

  static String decryptWithAes(Uint8List bytes, String k) {
    final key = Key.fromUtf8(k);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    // final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(Encrypted(bytes), iv: iv);

    // print(decrypted);
    // print(encrypted.base64);
    return decrypted;
  }

  static String getRandomString(int length) {
    final _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class WomExportData {
  final String path;
  final String partialKey;
  final List<int> bytes;

  WomExportData(this.path, this.bytes, this.partialKey);
}
