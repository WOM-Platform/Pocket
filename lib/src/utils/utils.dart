import 'package:mmkv_flutter/mmkv_flutter.dart';
import 'package:pocket/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  //TODO delete in release
  static Future<bool> isFakeMode() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    final isSuggestionsDisabled = await mmkv.getBool(IS_FAKE_MODE);
    if (isSuggestionsDisabled != null) {
      return isSuggestionsDisabled;
    }
    mmkv.setBool(IS_FAKE_MODE, false);
    return false;
  }

  //TODO delete in release
  static Future<bool> setFakeModeToSharedPreference(bool status) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return await mmkv.setBool(IS_FAKE_MODE, status);
  }

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
//    print(isFirstOpen);
//    if (isFirstOpen == true) {
//      return !isFirstOpen;
//    }
//    await setFirstOpen(true);
//    return true;
//  }

  //Check if is the first open
  static Future<bool> readIsFirstOpen() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    final isFirstOpen = await mmkv.getBool(IS_FIRST_OPEN);
    return !isFirstOpen;
  }

  static Future setIsFirstOpen(bool value) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    await mmkv.setBool(IS_FIRST_OPEN, !value);
  }

  static Future<bool> isSuggestionsDisabled() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    final isSuggestionsDisabled = await mmkv.getBool(IS_SUGGESTIONS_DISABLED);
    if (isSuggestionsDisabled != null) {
      return isSuggestionsDisabled;
    }
    mmkv.setBool(IS_SUGGESTIONS_DISABLED, false);
    return false;
  }

  static Future<bool> setIsSuggestionDisabledToSharedPreference(
      bool status) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return await mmkv.setBool(IS_SUGGESTIONS_DISABLED, status);
  }

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
