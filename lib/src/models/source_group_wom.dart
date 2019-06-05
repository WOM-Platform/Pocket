class WomGroupBy {
  final String type;
  final int count;

  WomGroupBy(this.type, this.count);

  WomGroupBy.fromMap(Map<String, dynamic> map)
      : type = map['type'],
        count = map['n_type'];
}