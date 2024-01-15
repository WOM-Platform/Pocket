import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wom_pocket/src/blocs/map/bloc.dart';
import 'package:wom_pocket/src/my_logger.dart';

class CustomSlider extends HookConsumerWidget {
  final double value = 0.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(mapNotifierProvider);
    // final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    // final sliderValue = state.valueOrNull?.sliderValue ?? 0.0;
    final sliderValue = useState(0.0);
    logger.wtf('sliderValue = $sliderValue');
    final ThemeData theme = Theme.of(context);
    return SliderTheme(
        data: theme.sliderTheme.copyWith(
          activeTrackColor: Colors.grey[100],
          inactiveTrackColor: Theme.of(context).colorScheme.secondary,
          activeTickMarkColor: Colors.grey,
          inactiveTickMarkColor: Colors.white,
          overlayColor: Colors.black12,
          thumbColor: Theme.of(context).colorScheme.secondary,
          valueIndicatorColor: Theme.of(context).colorScheme.secondary,
          valueIndicatorTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
//            thumbShape: _CustomThumbShape(),
//            valueIndicatorShape: _CustomValueIndicatorShape(),
//            valueIndicatorTextStyle:
        ),
        child: Slider(
          divisions: 10,
          label: valueIndicatorTextSlider[sliderValue.value.toInt()],
          min: 0.0,
          max: 10.0,
          onChangeEnd: (v) {
            ref
                .read(mapNotifierProvider.notifier)
                .updateMap(UpdateMap(sliderValue: v, forceFilterUpdate: true));
          },
          value: sliderValue.value,
          onChanged: (v) {
            sliderValue.value = v;
            // ref
            //     .read(mapNotifierProvider.notifier)
            //     .updateMap(UpdateMap(sliderValue: v));
          },
        ));
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
  "Last 24h",
];
