import 'dart:convert';

class Aim {
  static const TABLE_NAME = 'aims';
  static const ID = 'id';
  static const CODE = 'code';
  static const ICON_URL = 'iconFile';
  static const CHILDREN = 'children';
  static const TITLES = 'titles';

  String iconUrl;
  String code;
  List<Aim> children = [];
  Map<String, dynamic> titles;

  String get title => titles["it"] ?? null;

  Aim() {
    this.titles = Map();
  }

  Aim.fromDbMap(Map<String, dynamic> map)
      : this.code = map[CODE],
//        this.children = (map[CHILDREN] as List)
//            .map((aimMap) => Aim.fromMap(aimMap))
//            .toList(),
        this.titles = json.decode(map[TITLES]),
        this.iconUrl = map[ICON_URL];

  Aim.fromNetworkMap(Map<String, dynamic> map)
      : this.code = map[CODE],
        this.titles = map[TITLES],
        this.iconUrl = map[ICON_URL];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[CODE] = this.code;
    data[ICON_URL] = this.iconUrl;
    data[TITLES] = json.encode(this.titles);
    return data;
  }
}
//
//class LocalizationAimTitle {
//  String languageCode;
//  String title;
//
//  LocalizationAimTitle(this.languageCode, this.title);
//
//  LocalizationAimTitle.fromMap(Map<String, dynamic> map)
//      : this.languageCode = map.keys.first,
//        this.title = map[map.keys.first];
//}
