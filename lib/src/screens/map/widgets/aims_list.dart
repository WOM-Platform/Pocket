import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import 'package:pocket/src/models/source_group_wom.dart';

import 'filter_checkbox.dart';

class AimsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder(
        bloc: bloc,
        condition: (MapState p, MapState c) {
          return p.aims != c.aims;
        },
        builder: (BuildContext context, MapState state) {
          print("build aims list");
          if (state.aims == null || state.aims.isEmpty) {
            return Text("Non ci sono sorgenti");
          }

          return ChipFilter(
            aims: state.aims,
            onAdd: (type) {
              bloc.addAimToFilter(type);
            },
            onRemove: (type) {
              bloc.removeAimFromFilter(type);
            },
          );
          return Column(
            children: [
              for (WomGroupBy aim in state.aims)
                CheckboxRowFilter(
                  group: aim,
                  onChanged: (value) {
                    if (value) {
                      bloc.addAimToFilter(aim.type);
                    } else {
                      bloc.removeAimFromFilter(aim.type);
                    }
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}

class ChipFilter extends StatefulWidget {
  final Function onAdd;
  final Function onRemove;
  final List<WomGroupBy> aims;

  const ChipFilter({Key key, this.aims, this.onAdd, this.onRemove})
      : super(key: key);

  @override
  _ChipFilterState createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  Set<String> chips = Set();

  @override
  void initState() {
    chips.addAll(widget.aims.map((a) => a.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.aims.map((a) {
        return FilterChip(
          label: Text(a.titles["it"]),
          selectedColor: Colors.yellow,
          selected: chips.contains(a.type),
          onSelected: (selected) {
            if (selected) {
              chips.add(a.type);
              widget.onAdd(a.type);
            } else {
              chips.remove(a.type);
              widget.onRemove(a.type);
            }
            setState(() {});
          },
        );
      }).toList(),
    );
  }
}
