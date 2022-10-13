import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wom_pocket/localization/app_localizations.dart';
import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/models/source_group_wom.dart';

import '../../../my_logger.dart';

class AimsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (MapState p, MapState c) {
        return p.aims != c.aims;
      },
      builder: (BuildContext context, MapState state) {
        logger.i("build aims list");
        if (state.aims == null || state.aims.isEmpty) {
          return Text(
            AppLocalizations.of(context)!.translate('no_aims'),
            style: TextStyle(color: Colors.white),
          );
        }

        return ChipFilter(
          aims: state.aims,
          onAdd: (type) {
            BlocProvider.of<MapBloc>(context).addAimToFilter(type);
          },
          onRemove: (type) {
            BlocProvider.of<MapBloc>(context).removeAimFromFilter(type);
          },
        );
//          return Column(
//            children: [
//              for (WomGroupBy aim in state.aims)
//                CheckboxRowFilter(
//                  group: aim,
//                  onChanged: (value) {
//                    if (value) {
//                      bloc.addAimToFilter(aim.type);
//                    } else {
//                      bloc.removeAimFromFilter(aim.type);
//                    }
//                  },
//                ),
//            ],
//          );
      },
    );
  }
}

class ChipFilter extends StatefulWidget {
  final Function? onAdd;
  final Function? onRemove;
  final List<WomGroupBy>? aims;

  const ChipFilter({Key? key, this.aims, this.onAdd, this.onRemove})
      : super(key: key);

  @override
  _ChipFilterState createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  Set<String?> chips = Set();

  @override
  void initState() {
    chips.addAll(widget.aims!.map((a) => a.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = AppLocalizations.of(context)!.locale.languageCode;
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.aims!.length,
          itemBuilder: (context, index) {
            final a = widget.aims![index];
            return Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: FilterChip(
                label: Text(
                  '${(a.titles ?? const {})[languageCode] ?? '-'} (${a.count})',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                selectedColor: Theme.of(context).colorScheme.secondary,
                selected: chips.contains(a.type),
                onSelected: (selected) {
                  if (selected) {
                    chips.add(a.type);
                    widget.onAdd!(a.type);
                  } else {
                    chips.remove(a.type);
                    widget.onRemove!(a.type);
                  }
                  setState(() {});
                },
              ),
            );
          }),
    );
  }
}
