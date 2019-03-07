//import 'package:pocket/src/blocs/bloc_provider.dart';
//import 'package:pocket/src/models/aggregation_wom_model.dart';
//import 'package:pocket/src/models/map_object.dart';
//import 'package:pocket/src/screens/map/blocs/map_bloc.dart';
//import 'package:pocket/src/models/wom_model.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';
////import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class MapScreen extends StatelessWidget {
//  MapBloc bloc;
//
//  @override
//  Widget build(BuildContext context) {
//    bloc = BlocProvider.of(context);
//    return Scaffold(
//      appBar: buildAppBar(),
//      floatingActionButton: buildFloatingActionButton(),
//      body: SafeArea(
//        child: buildBody(),
//      ),
//    );
//  }
//
//  Widget centerProgressIndicator() {
//    return Center(child: CircularProgressIndicator());
//  }
//
//  Widget buildBody() {
//    return StreamBuilder<bool>(
//        stream: bloc.isMap,
//        initialData: false,
//        builder: (context, snapshot) {
//
//          if (snapshot.data) {
//            return FutureBuilder<List<WomModel>>(
//              future: bloc.fetchWom(),
//              builder: (context, snapshot) {
//
//                if(!snapshot.hasData){
//                  return Center(child: CircularProgressIndicator(),);
//                }
//                //final woms = snapshot.data;
//
//                return Container();
////                return ListView.builder(
////                    itemBuilder: (context, index) {
////                      print("build Wom Card");
////                  return WomGroupCard(wom: woms[index],);
////                });
//              },
//            );
//          }
//
//          return Stack(
//            children: <Widget>[
//              buildMap(),
//              Positioned(
//                top: 50.0,
//                left: 20.0,
//                right: 20.0,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    AnimatedDateFilter(
//                      bloc: bloc,
//                    ),
////              buildDateFilter(),
//                    buildSourceFilter(),
//                  ],
//                ),
//              ),
//              buildTextDebug(),
//              //buildList(), //commentalo se vuoi provare la mappa
//            ],
//          );
//        });
//  }
//
//  buildDateFilter() {
//    return StreamBuilder<double>(
////        initialData: 10.0,
//      stream: bloc.dateFilter,
//      builder: (context, snapshot) {
//        print("slider value:" + snapshot.data.toString());
//
//        if (!snapshot.hasData) {
//          return Container();
//        }
//        return Card(
//          elevation: 2.0,
//          child: Slider(
//            divisions: 10,
//            label: bloc.textSlider,
//            min: 0.0,
//            max: 10.0,
//            value: snapshot.data,
//            onChanged: bloc.changeDateFiler,
//          ),
//        );
//      },
//    );
//  }
//
//  buildSourceFilter() {
//    return StreamBuilder(
//      stream: bloc.source,
//      builder: (context, snapshot) {
//        return Card(
//          elevation: 2.0,
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Icon(Icons.accessibility),
//          ),
//        );
//      },
//    );
//  }
//
//  buildTextDebug() {
//    return StreamBuilder(
//      initialData: initialLocation,
//      stream: bloc.location,
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return centerProgressIndicator();
//        }
//
//        final latLng = snapshot.data as LatLng;
//
//        return Text(
//            "lat ${latLng.latitude.toString()} long ${latLng.longitude.toString()}");
//      },
//    );
//  }
//
////  buildList() {
////    return StreamBuilder(
////      stream: bloc.area,
////      builder: (context, snapshot) {
////        if (!snapshot.hasData) {
////          return centerProgressIndicator();
////        }
////        return StreamBuilder(
////          stream: bloc.results,
////          builder: (context, snapshot) {
////            if (!snapshot.hasData) {
////              return centerProgressIndicator();
////            }
////
////            return ListView.builder(
////              itemCount: snapshot.data.length,
////              itemBuilder: (context, int index) {
////                final event = snapshot.data[index] as WomModel;
////                final lat = event.location.latitude.toString();
////                final long = event.location.longitude.toString();
////
////                return ListTile(
////                  title: Text(event.name),
////                  trailing: Text(event.distance.toString()),
////                  subtitle: Text('$lat + $long'),
////                );
////              },
////            );
////          },
////        );
////      },
////    );
////  }
//
//  buildAppBar() {
//    return AppBar(
//      title: Text('Prova Mappa'),
//      actions: <Widget>[
//        IconButton(icon: Icon(Icons.view_list), onPressed: () {
//          bloc.changeTypeOfView();
//        })
////        Center(
////          child: StreamBuilder(
////            initialData: 5.0,
////            stream: bloc.radius,
////            builder: (context, snapshot) {
////              final value = snapshot.data as double;
////              return Text("${value.roundToDouble()} km");
////            },
////          ),
////        ),
////        IconButton(
////          icon: Icon(Icons.add),
////          onPressed: () {
////            bloc.incrementRadius(2.0);
////          },
////        ),
////        IconButton(
////          icon: Icon(Icons.remove),
////          onPressed: () {
////            bloc.decrementRadius(2.0);
////          },
////        ),
////        IconButton(
////          icon: Icon(Icons.add_location),
////          onPressed: () {
////            //bloc.addFakeMarkers();
////          },
////        ),
//      ],
//    );
//  }
//
//  buildFloatingActionButton() {
//    return FloatingActionButton(
//      child: Icon(Icons.my_location),
//      onPressed: () {
//        //per simulare la nuova location mentre si sposta
//        //bloc.updateCurrentLocation(new GeoPoint(42.825932, 13.715370));
//        //bloc.updateCurrentLocation(newlatLng);
//        //_mapController.move(newlatLng, 13.0);
//        bloc.moveToCurrentLocation();
//        //bloc.addFakeMarkers();
//      },
//    );
//  }
//
//  buildMap() {
//    return StreamBuilder<MapObject>(
//      stream: bloc.mapObjects,
//      initialData: MapObject(
//          currentLocation: initialLocation,
//          woms: List<WomModel>(),
//          aggregationWom: List<AggregationWom>()),
//      builder: (context, snapshot) {
////        if (!snapshot.hasData) {
////          return Center(
////            child: CircularProgressIndicator(),
////          );
////        }
//        final mapObjects = snapshot.data;
//        final woms = mapObjects.woms ?? [];
//        final currentLocation = mapObjects.currentLocation;
//        final List<AggregationWom> aggregationWom = mapObjects.aggregationWom;
//        return FlutterMap(
//          mapController: bloc.mapController,
//          options: new MapOptions(
//            center: initialLocation,
//            zoom: 5.0,
//            minZoom: 5.0,
//            maxZoom: 20.0,
//            onPositionChanged: (position, hasGesture) {
//              bloc.changeMapPosition(position);
//            },
//          ),
//          layers: [
//            new TileLayerOptions(
//              urlTemplate: "https://api.tiles.mapbox.com/v4/"
//                  "{id}/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoicHJvamVjdHplcm9hcHAiLCJhIjoiY2pucnk3Ym5pMDdvaDN2azkzZ290b2N3MyJ9.NPpSJIkAtPM3D7a5wr06MA",
//              additionalOptions: {
//                'accessToken':
//                    '<pk.eyJ1IjoicHJvamVjdHplcm9hcHAiLCJhIjoiY2pucnk3Ym5pMDdvaDN2azkzZ290b2N3MyJ9.NPpSJIkAtPM3D7a5wr06MA>',
//                'id': 'mapbox.streets',
//              },
//            ),
//            buildMarkersLayer(woms),
//            buildCurrentLocationLayer(currentLocation),
//            buildAggregationWom(aggregationWom),
//          ],
//        );
//      },
//    );
//  }
//
//  buildAggregationWom(List<AggregationWom> aggregationWom) {
//    return MarkerLayerOptions(
//      markers: aggregationWom.map((aggregationWom) {
//        return Marker(
//          width: 40.0,
//          height: 40.0,
//          point: aggregationWom.location,
//          builder: (ctx) => Container(
//                child: CircleAvatar(
//                    child: new Text(
//                  aggregationWom.number.toString(),
//                  style: TextStyle(fontSize: 20.0),
//                )),
//              ),
//        );
//      }).toList(),
//    );
//  }
//
//  buildMarkersLayer(List<WomModel> woms) {
//    return MarkerLayerOptions(
//      markers: buildMarkers(woms),
//    );
//  }
//
//  buildCurrentLocationLayer(LatLng currentLocation) {
//    return MarkerLayerOptions(
//      markers: [
//        Marker(
//          width: 80.0,
//          height: 80.0,
//          point: currentLocation,
//          builder: (ctx) => currentLocation == initialLocation
//              ? Container()
//              : new Container(
//                  child: new Icon(
//                    Icons.my_location,
//                    color: Colors.orange,
//                  ),
//                ),
//        ),
////        Marker(
////          width: radius * 25.0,
////          height: radius * 25.0,
////          point: currentLocation,
////          builder: (ctx) => new Container(
////                decoration: new BoxDecoration(
////                  border: new Border.all(
////                    width: 1.0,
////                    color: Colors.transparent,
////                  ),
////                  shape: BoxShape.circle,
////                  color: Colors.red[300],
////                ),
////                padding: EdgeInsets.all(16.0),
////              ),
////        )
//      ],
//    );
//  }
//
//  buildMarkers(List<WomModel> woms) {
//    final List<Marker> results = woms.map((wom) {
//      return Marker(
//        width: 80.0,
//        height: 80.0,
//        point: wom.location,
//        builder: (ctx) => new Container(
//              child: new Icon(
//                Icons.location_on,
//                color: Colors.red,
//              ),
//            ),
//      );
//    }).toList();
//    return results;
//  }
//}
//
//
//
//class AnimatedDateFilter extends StatefulWidget {
//  final MapBloc bloc;
//
//  const AnimatedDateFilter({Key key, this.bloc}) : super(key: key);
//
//  @override
//  _AnimatedDateFilterState createState() => _AnimatedDateFilterState();
//}
//
//class _AnimatedDateFilterState extends State<AnimatedDateFilter>
//    with SingleTickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<double> opacitySlider;
//  Animation<double> opacityIcon;
//
//  bool isActive = false;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _controller = AnimationController(
//      duration: const Duration(milliseconds: 2000),
//      vsync: this,
//    )..addListener(() {});
//
//    opacitySlider = new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
//      parent: _controller,
//      curve: Curves.elasticInOut,
//    )..addListener(() {
//        setState(() {});
//      }));
//
//    opacityIcon = new Tween(begin: 1.0, end: 0.0).animate(new CurvedAnimation(
//      parent: _controller,
//      curve: Curves.elasticInOut,
//    ))
//      ..addListener(() {});
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    double oIcon = opacityIcon.value;
//    //double oSlider = opacitySlider.value;
//
//    return StreamBuilder<double>(
////        initialData: 10.0,
//      stream: widget.bloc.dateFilter,
//      builder: (context, snapshot) {
//        print("slider value:" + snapshot.data.toString());
//
//        if (!snapshot.hasData) {
//          return Container();
//        }
//
//        return GestureDetector(
//          onTap: () {
////            _controller.forward().orCancel;
//            isActive = !isActive;
//            setState(() {});
//          },
//          child: isActive
//              ? Opacity(
//                  opacity: oIcon,
//                  child: getSlider(snapshot.data),
//                )
//              : Opacity(
//                  opacity: oIcon,
//                  child: Card(
//                      child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(Icons.timer),
//                  ))),
//        );
//      },
//    );
//  }
//
//  getSlider(double value) {
//    return Card(
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Slider(
//            divisions: 10,
//            label: widget.bloc.textSlider,
//            min: 0.0,
//            max: 10.0,
//            value: value,
//            onChanged: widget.bloc.changeDateFiler,
//          ),
//          IconButton(
//            icon: Icon(Icons.arrow_right),
//            onPressed: () {
//              setState(() {
//                isActive = !isActive;
//              });
//            },
//          )
//        ],
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//}
