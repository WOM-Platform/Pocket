import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import 'package:pocket/src/models/source_group_wom.dart';

import 'filter_checkbox.dart';

class SourcesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      condition: (MapState p,MapState c){
        return p.sources != c.sources;
      },
      builder: (BuildContext context, MapState state) {
        print("build source list");
        if (state.sources == null || state.sources.isEmpty) {
          return Text("Non ci sono sorgenti");
        }
        return Column(
          children: [
            for (WomGroupBy source in state.sources)
              CheckboxRowFilter(
                group: source,
                onChanged: (value) {
                  if (value) {
                    bloc.addSourceToFilter(source.type);
                  } else {
                    bloc.removeSourceFromFilter(source.type);
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
