import 'package:flutter_mmkv/flutter_mmkv.dart';
import 'package:pocket/constants.dart';
import 'package:pocket/src/models/bounds_model.dart';

class Utils {
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

  static bool Contains(Bounds bounds, double latitude, double longitude) {

    bool inLatRange = (bounds.leftTop[0] > bounds.rightBottom[0])
        ? (latitude <= bounds.leftTop[0] && latitude >= bounds.rightBottom[0])
        : (latitude <= bounds.leftTop[0] || latitude >= bounds.rightBottom[0]);
    bool inLngRange = (bounds.leftTop[1] < bounds.rightBottom[1])
        ? (longitude >= bounds.leftTop[1] && longitude <= bounds.rightBottom[1])
        : (longitude >= bounds.leftTop[1] ||
            longitude <= bounds.rightBottom[1]);

    return inLatRange && inLngRange;
  }
//
//  final query = "where Latitude <= ${leftTop.latitude} AND Latitude >= ${rightBottom.latitude}";
//  final query2 = "where Latitude <= ${leftTop.latitude} OR Latitude >= ${rightBottom.latitude}";
//  final query3 = "where Longitude >= ${leftTop.longitude} AND Longitude <= ${rightBottom.longitude}";
//  final query4 = "where Longitude >= ${leftTop.longitude} OR Longitude <= ${rightBottom.longitude}";
//
//

}


