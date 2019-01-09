import 'package:borsellino/src/db/wom_db.dart';
import 'package:borsellino/src/screens/map/blocs/google_map_bloc.dart';
import 'package:borsellino/src/screens/map/widgets/filter_checkbox.dart';
import 'package:flutter/material.dart';

class BackdropBody extends StatelessWidget {
  final GoogleMapBloc bloc;

  BackdropBody(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: ListView(
          children: <Widget>[
            Text('Filtra i tuoi WOM in base al periodo di acquisizione!'),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder<double>(
              initialData: 0.0,
              stream: bloc.dateFilter,
              builder: (context, snapshot) {
                print("slider value:" + snapshot.data.toString());

                if (!snapshot.hasData) {
                  return Container();
                }

                final ThemeData theme = Theme.of(context);
                return SliderTheme(
                  data: theme.sliderTheme.copyWith(
                    activeTrackColor: Colors.grey[300],
                    inactiveTrackColor: Colors.blue,
                    activeTickMarkColor: Colors.grey,
                    inactiveTickMarkColor: Colors.white,
                    overlayColor: Colors.black12,
                    thumbColor: Colors.blue,
                    valueIndicatorColor: Colors.blue,
//            thumbShape: _CustomThumbShape(),
//            valueIndicatorShape: _CustomValueIndicatorShape(),
//            valueIndicatorTextStyle:
                  ),
                  child: Slider(
                    divisions: 10,
                    label: bloc.textSlider,
                    min: 0.0,
                    max: 10.0,
                    onChangeEnd: bloc.changeDateFilter,
                    value: snapshot.data,
                    onChanged: bloc.changeTextIndicator,
                  ),
                );
              },
            ),
            Divider(),
            SizedBox(height: 20.0),
            Text('Filtra i tuoi WOM per origine di provenienza!'),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder<List<WomGroupBy>>(
              stream: bloc.sources,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: snapshot.data.map((source) {
                    return CheckboxRowFilter(
                      group: source,
                      onChanged: (value) {
                        if (value) {
                          bloc.addSourceToFilter(source.type);
                        } else {
                          bloc.removeSourceFromFilter(source.type);
                        }
                      },
                    );
                  }).toList(),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}