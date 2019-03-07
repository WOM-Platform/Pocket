import 'package:pocket/src/db/wom_db.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/models/source_group_wom.dart';

class WomGroupCard extends StatelessWidget {
  final WomGroupBy wom;

  const WomGroupCard({Key key, this.wom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(wom.type),
            Text(wom.count.toString()),
          ],
        ),
      ),
    );
  }
}
