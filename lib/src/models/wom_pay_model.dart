class WomPayModel {
  String id;
  String secret;

  WomPayModel.fromDB(Map<String, dynamic> map)
      : id = map['Id'].toString(),
        secret = map['Secret'];

  toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['secret'] = this.secret;
    return data;
  }
}
