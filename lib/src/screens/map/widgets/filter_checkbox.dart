import 'package:flutter/material.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

import '../../../my_logger.dart';

class CheckboxRowFilter extends StatefulWidget {
  final WomGroupBy group;
  final ValueChanged<bool?> onChanged;

  const CheckboxRowFilter(
      {Key? key, required this.group, required this.onChanged})
      : super(key: key);

  @override
  CheckboxRowFilterState createState() {
    return new CheckboxRowFilterState();
  }
}

class CheckboxRowFilterState extends State<CheckboxRowFilter> {
  bool? isActive = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
            value: isActive,
            checkColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              logger.i('change');

              setState(() {
                isActive = value;
              });

              widget.onChanged(value);
            }),
//        Text(widget.group.type),
        Text(widget.group.type!, style: TextStyle(color: Colors.white)),
        Expanded(
          child: Container(),
        ),
        Text(
          widget.group.count.toString() + ' WOM',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
