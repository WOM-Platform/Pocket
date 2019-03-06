class SimpleFilters {
  String aim;
  Bounds bounds;
  int maxAge;

  SimpleFilters({this.aim, this.bounds, this.maxAge});

  SimpleFilters.fromJson(Map<String, dynamic> json) {
    aim = json['Aim'];
    bounds =
    json['Bounds'] != null ? new Bounds.fromJson(json['Bounds']) : null;
    maxAge = json['MaxAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Aim'] = this.aim;
    if (this.bounds != null) {
      data['Bounds'] = this.bounds.toJson();
    }
    data['MaxAge'] = this.maxAge;
    return data;
  }
}

class Bounds {
  List<int> leftTop;
  List<int> rightBottom;

  Bounds({this.leftTop, this.rightBottom});

  Bounds.fromJson(Map<String, dynamic> json) {
    leftTop = json['LeftTop'].cast<int>();
    rightBottom = json['RightBottom'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeftTop'] = this.leftTop;
    data['RightBottom'] = this.rightBottom;
    return data;
  }
}
