/*
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/models/source_group_wom.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:pocket/src/screens/map/widgets/filter_checkbox.dart';
import 'package:flutter/material.dart';

class BackdropBody extends StatelessWidget {
  GoogleMapBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<GoogleMapBloc>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: bloc.womsCount > 0
            ? ListView(
                children: <Widget>[
                  Text('Filter your WOM by time'),
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

                     return CustomSlider(value: snapshot.data,);

                    },
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  Text('Filter your WOM by source!'),
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

                      final List<WomGroupBy> list = snapshot.data;

                      return Column(
                        children: list.map((source) {
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
              )
            : Center(
                child: Text('Opzioni disabilitate per assenza di WOM'),
              ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {

  final double value;

  const CustomSlider({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleMapBloc bloc = BlocProvider.of<GoogleMapBloc>(context);
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
        value: value,
        onChanged: bloc.changeTextIndicator,
      ),
    );
  }
}
*/
