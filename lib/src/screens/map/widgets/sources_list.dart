import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import '../../../../src/models/source_group_wom.dart';
import '../../../../src/utils/my_extensions.dart';

class SourcesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (MapState p, MapState c) {
        return p.sources != c.sources;
      },
      builder: (BuildContext context, MapState state) {
        print("build source list");
        if (state.sources == null || state.sources.isEmpty) {
          return Text(
            context.translate('no_sources'),
            style: TextStyle(color: Colors.white),
          );
        }
        return ChipFilter(
          sources: state.sources,
          onAdd: (type) {
            BlocProvider.of<MapBloc>(context).addSourceToFilter(type);
          },
          onRemove: (type) {
            BlocProvider.of<MapBloc>(context).removeSourceFromFilter(type);
          },
        );
      },
    );
  }
}

class ChipFilter extends StatefulWidget {
  final Function onAdd;
  final Function onRemove;
  final List<WomGroupBy> sources;

  const ChipFilter({Key key, this.sources, this.onAdd, this.onRemove})
      : super(key: key);

  @override
  _ChipFilterState createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  Set<String> chips = Set();

  @override
  void initState() {
    chips.addAll(widget.sources.map((a) => a.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.sources.length,
          itemBuilder: (context, index) {
            final a = widget.sources[index];
            return Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: FilterChip(
                label: Text(
                  '${a.type} (${a.count})',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                selectedColor: Theme.of(context).accentColor,
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
              ),
            );
          }),
    );
  }
}
