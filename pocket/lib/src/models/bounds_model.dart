class Bounds {
  List<double> leftTop;
  List<double> rightBottom;

  Bounds({this.leftTop, this.rightBottom});

  Bounds.fromJson(Map<String, dynamic> json) {
    leftTop = json['LeftTop'].cast<double>();
    rightBottom = json['RightBottom'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeftTop'] = this.leftTop;
    data['RightBottom'] = this.rightBottom;
    return data;
  }
}