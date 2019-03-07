import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:flutter/material.dart';

class BackdropBar extends StatelessWidget {
  GoogleMapBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<GoogleMapBloc>(context);
    final whiteText = TextStyle(color: Colors.white);
    return Row(
      children: <Widget>[
        Text(
          'WOM Filter',
          style: whiteText,
        ),
        Expanded(child: Container()),
        Text(
          "Wom totali: ${bloc.womsCount}",
          style: whiteText,
        ),
      ],
    );
  }
}
