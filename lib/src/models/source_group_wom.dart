import 'dart:convert';

class WomGroupBy {
  final String type;
  final int count;
  Map<String, dynamic>? titles;

  WomGroupBy(this.type, this.count, {this.titles});

  WomGroupBy.fromSourceMap(Map<String, dynamic> map)
      : type = map['type'],
        count = map['n_type'];

  WomGroupBy.fromAimMap(Map<String, dynamic> map)
      : type = map['aim'],
        count = map['woms'],
        titles = json.decode(map['titles'] as String);
}
