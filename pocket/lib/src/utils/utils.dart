import 'package:flutter_mmkv/flutter_mmkv.dart';
import 'package:pocket/constants.dart';

class Utils{

  static Future<bool> isFakeMode() async {
    final containsKey = await FlutterMmkv.containsKey(IS_FAKE_MODE);
    if (containsKey) {
      final isSuggestionsDisabled = await FlutterMmkv.decodeBool(IS_FAKE_MODE);
      return isSuggestionsDisabled;
    }
    FlutterMmkv.encodeBool(IS_FAKE_MODE, false);
    return false;
  }

  static Future<bool> setFakeModeToSharedPreference(bool status) async {
    return await FlutterMmkv.encodeBool(IS_FAKE_MODE, status);
  }
}