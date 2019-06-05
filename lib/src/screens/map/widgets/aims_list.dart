import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import 'package:pocket/src/models/source_group_wom.dart';

import 'filter_checkbox.dart';

class AimsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      condition: (MapState p,MapState c){
        return p.aims != c.aims;
      },
      builder: (BuildContext context, MapState state) {
        print("build aims list");
        if (state.aims == null || state.aims.isEmpty) {
          return Text("Non ci sono sorgenti");
        }
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
    );
  }
}
