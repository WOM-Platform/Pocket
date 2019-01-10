import 'package:pocket/src/db/wom_db.dart';
import 'package:flutter/material.dart';

class CheckboxRowFilter extends StatefulWidget {
  final WomGroupBy group;
  final ValueChanged<bool> onChanged;

  const CheckboxRowFilter({Key key, @required this.group, @required this.onChanged})
      : super(key: key);

  @override
  CheckboxRowFilterState createState() {
    return new CheckboxRowFilterState();
  }
}

class CheckboxRowFilterState extends State<CheckboxRowFilter> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
            value: isActive,
            onChanged: (value) {
              print('change');

              setState(() {
                isActive = value;
              });

              widget.onChanged(value);
            }),
        Text(widget.group.type),
        Expanded(
          child: Container(),
        ),
        Text(widget.group.count.toString())
      ],
    );
  }
}
