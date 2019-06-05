import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket/src/blocs/map/bloc.dart';

class CustomSlider extends StatelessWidget {
  final double value = 0.0;

  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
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
      child: BlocBuilder(
        bloc: bloc,
        condition: (previous, current) {
          if (previous is MapUpdated && current is MapUpdated) {
            if (previous.sliderValue != current.sliderValue) {
              return true;
            }
            return false;
          }
          return true;
        },
        builder: (context, MapState state) {
          return Slider(
            divisions: 10,
            label: valueIndicatorTextSlider[state.sliderValue?.toInt() ?? 0],
            min: 0.0,
            max: 10.0,
            onChangeEnd: (v) {
              bloc.dispatch(
                  UpdateMap(sliderValue: v, forceFilterUpdate: true));
            },
            value: state.sliderValue,
            onChanged: (v) {
              bloc.dispatch(UpdateMap(sliderValue: v));
            },
          );
        },
      ),
    );
  }
}

const valueIndicatorTextSlider = [
  "Big Bang",
  "5y",
  "3y",
  "1y",
  "9m",
  "6m",
  "3m",
  "1m",
  "2w",
  "1w",
  "Today",
];
