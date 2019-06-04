import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pocket/src/blocs/map/bloc.dart';
import 'package:pocket/src/models/source_group_wom.dart';
import 'package:pocket/src/screens/map/widgets/aims_list.dart';
import 'package:pocket/src/screens/map/widgets/custom_slider.dart';
import 'package:pocket/src/screens/map/widgets/filter_checkbox.dart';
import 'package:pocket/src/screens/map/widgets/sources_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SlidingUpPanel(
        maxHeight: 450.0,
        minHeight: 30.0,
        panel: MapPanel(),
        body: MapBody(),
      ),
    );
  }
}

class MapBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapBloc bloc = BlocProvider.of<MapBloc>(context);
    return Container(
      key: new PageStorageKey('map'),
      child: BlocBuilder(
        bloc: bloc,
//        condition: (MapState p, MapState c) {
//          return  c.markers.containsAll(p.markers);
//        },
        builder: (BuildContext context, MapState state) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
            onMapCreated: (mapController) => bloc.onMapCreated(mapController),
            onCameraIdle: bloc.clusteringHelper.onMapIdle,
            onCameraMove: bloc.clusteringHelper.onCameraMove,
            markers: state.markers,
          );
        },
      ),
    );
  }
}

class MapPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Column(
          children: <Widget>[
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text("Time Filter",textAlign: TextAlign.start,),
        CustomSlider(),
        Divider(),
        Text("Sourcer Filter",textAlign: TextAlign.start,),

        SourcesList(),
        Divider(),
        Text("Aim Filter"),
        AimsList(),

      ],
    );
  }
}

