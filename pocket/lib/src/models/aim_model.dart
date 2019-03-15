import 'package:equatable/equatable.dart';

class AimModel extends Equatable{
  static const TABLE_NAME = 'aims';
  static const ID = 'id';
  static const SHORT_TITLE = 'shortTitle';
  static const DESCRIPTION = 'description';
  static const ICON_URL = 'iconUrl';

  String iconUrl;
  String shortTitle;
  String description;
  String id;

  AimModel.fromMap(Map<String, dynamic> map)
      : this.id = map[ID],
        this.shortTitle = map[SHORT_TITLE],
        this.description = map[DESCRIPTION],
        this.iconUrl = map[ICON_URL];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ID] = this.id;
    data[SHORT_TITLE] = this.shortTitle;
    data[DESCRIPTION] = this.description;
    data[ICON_URL] = this.iconUrl;
    return data;
  }
}
