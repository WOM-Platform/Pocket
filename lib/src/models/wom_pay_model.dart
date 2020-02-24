class WomPayModel {
  String id;
  String secret;

  WomPayModel.fromMap(Map<String, dynamic> map)
      : id = map['Id'].toString(),
        secret = map['Secret'];

  toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Secret'] = this.secret;
    return data;
  }
}
