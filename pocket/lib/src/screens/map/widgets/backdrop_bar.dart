import 'package:borsellino/src/screens/map/blocs/google_map_bloc.dart';
import 'package:flutter/material.dart';

class BackdropBar extends StatelessWidget {
  final GoogleMapBloc bloc;

  const BackdropBar({Key key, @required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Filtri',
      style: TextStyle(color: Colors.white),
    );
  }
}