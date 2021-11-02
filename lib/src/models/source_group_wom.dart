class WomGroupBy {
  final String? type;
  final int? count;
  Map<String, dynamic>? titles;

  WomGroupBy(this.type, this.count, {this.titles});

  WomGroupBy.fromMap(Map<String, dynamic> map)
      : type = map['type'],
        count = map['n_type'];
}
