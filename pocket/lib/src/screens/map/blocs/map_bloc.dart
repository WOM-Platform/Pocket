import 'dart:async';
import 'package:pocket/src/models/aggregation_wom_model.dart';
import 'package:pocket/src/models/map_object.dart';
import 'package:pocket/src/screens/map/map.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:geohash/geohash.dart';
import 'package:location/location.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:latlong/latlong.dart' as latLong;
import 'package:flutter_map/flutter_map.dart';

final latLong.LatLng initialLocation = latLong.LatLng(42.825932, 13.715370);

final int oneDayInMilliseconds = 86400;

class MapBloc implements BlocBase {
  final _radius = BehaviorSubject<double>();

  //serve solo per il debug poi si puo sostituire con una variabile locale
  final _location = BehaviorSubject<latLong.LatLng>();
  final _mapPosition = BehaviorSubject<MapPosition>();
//  final _mapObjects = BehaviorSubject<MapObject>();
  final _dateFilter = BehaviorSubject<double>();

  final _results = BehaviorSubject<List<WomModel>>();

  // Source of wom
  final _source = BehaviorSubject<SourceAim>();

  Function(SourceAim) get changeSource => _source.sink.add;

  Observable<SourceAim> get source => _source.stream;

  // Source of wom
  final _isMap = BehaviorSubject<bool>();

  changeTypeOfView() {
    _isMap.sink.add(!_isMap.value);
  }

  Observable<bool> get isMap => _isMap.stream;

  Location _loc;
  MapController mapController;

  final WomDB womDB;

//  bool semaphore = true;
  String textSlider = "Today";

  int dateOfFirstWom = 0;

//  int singleStep = 0;
  MapBloc(this.womDB) {
    calculateFromStartToNowTime();
    mapController = new MapController();
    changeRadius(15.0);
    _isMap.sink.add(false);

    _loc = new Location();

    //ascolto la variazione gps dell utente
    _loc.onLocationChanged().listen((Map<String, double> result) {
      final latLng = new latLong.LatLng(result['latitude'], result['longitude']);
      print("onLocationChanged");
      if (latLng != _location.value) {
        print("update new location");
        changeLoc(latLng);
      }
    });

//    sliderText.listen((result){
//      textSlider = result;
//      print(result);
//    });

    //ascolto lo spostamento della mappa da parte dell utente
//    _mapPosition.debounce(new Duration(milliseconds: 500)).listen((position) {
//      print(position.zoom.toString());
//      _mapObjects.sink
//          .add(MapObjects(initialLocation, fetchWom(position.bounds)));
//    });
  }


  //Calculate the time from first wom acquired
  //if is 2 weeks old display the slider
  calculateFromStartToNowTime() async {
    dateOfFirstWom = await womDB.getMinDate();
    print("start from " + dateOfFirstWom.toString());
//    singleStep = getSingleStep();
    final v = getSingleStep();
    if (v > 0) changeDateFiler(10.0);
  }

  getSingleStep() {
    final today = DateTime
        .now()
        .millisecondsSinceEpoch;
    final difference = today - dateOfFirstWom;
    if (difference > oneDayInMilliseconds * 14) {
      print(
          "sono passati pi+ di 2 settimane quindi visualizziamo la barra per il filtro temporale");
      final fraction = difference / 10000;
      final oneSection = fraction / oneDayInMilliseconds;
      print(today);
      print(difference);
      print(fraction);
      print(oneSection.round());
      return oneSection.round();
    }
    return 0;
  }

  //Stream for display map
  Observable<MapObject> get mapObjects =>
      _mapPosition
          .debounce(new Duration(milliseconds: 500))
          .asyncMap((position) async {
        print(position.zoom.toString());
        if (position.zoom < 13.0) {
          List<AggregationWom> aggregation =
          await fetchAggregationWom(position.zoom);
          print("aggregation lenght: " + aggregation.length.toString());
          return MapObject(
              currentLocation: initialLocation,
              woms: List<WomModel>(),
              aggregationWom: aggregation);
        }
        List<WomModel> woms = await fetchWom(bounds: position.bounds);
        if (woms == null) woms = List<WomModel>();
        return MapObject(
            currentLocation: initialLocation,
            woms: woms,
            aggregationWom: List<AggregationWom>());
      });

  Observable<latLong.LatLng> get location => _location.stream;

  Observable<double> get radius => _radius.stream;

//  Observable<String> get sliderText => _dateFilter.map((value) {
//        final int singleStep = getSingleStep();
//        print(singleStep * value.round());
//        return "${singleStep * value.round()}";
//      });

  Observable<double> get dateFilter => _dateFilter.stream;

  Function(double) get changeRadius => _radius.sink.add;

  Function(MapPosition) get changeMapPosition => _mapPosition.sink.add;

//  Function(double) changeDateFiler(double value) => _dateFilter.sink.add;
  changeDateFiler(double value) {
    if (value != _dateFilter.value) {
      _dateFilter.sink.add(value);
      final int singleStep = getSingleStep();
//    final int singleStep = 300;
      final int days = singleStep * value.round();

      if (value == 10.0) {
        textSlider = "Today";
      } else if (days <= 10) {
        textSlider = days.toString();
      } else if (days <= 28) {
        final weeks = (days ~/ 7.0).toString();
        textSlider = weeks + "w";
      } else if (days <= 335) {
        final months = (days ~/ 30.0).toString();
        textSlider = months + "m";
      } else if (days > 364) {
        final years = (days ~/ 365.0).toString();
        textSlider = years + "y";
      }
    }
  }

  Function(latLong.LatLng) get changeLoc => _location.sink.add;

  //Stream della lista di attività in base alla posizione geografica
  Stream<List<WomModel>> get results => _results.stream;

//  readAggregationWoms() async {
////    final geoHash =     Geohash.encode(initialLocation.latitude, initialLocation.longitude);
////    final d = geoHash.substring(0,1);
////    print(d);
////    final l = Geohash.decode(d);
////    print(l.x);
////    print(l.y);
//    return await womDB.getAggregatedWoms();
//  }

  //prendi i wom dal db relativi all area visualizzata
  Future<List<WomModel>> fetchWom(
      {LatLngBounds bounds, String filter, bool all = false}) async {
    print("loading woms");
    final woms = await womDB.getWoms();
    print("reading complete woms : ${woms.length}");
    return woms;
  }


  //prendi i wom dal db relativi all area visualizzata
  Future<List<AggregationWom>> fetchAggregationWom(double zoom) async {
    print("loading aggregation woms");
    int level = 5;
    if (zoom >= 5 && zoom <= 6) {
      level = 2;
    } else if (zoom > 6 && zoom <= 9) {
      level = 3;
    } else if (zoom > 9 && zoom <= 10) {
      level = 4;
    } else if (zoom > 10 && zoom <= 11) {
      level = 5;
    } else if (zoom > 11 && zoom <= 12) {
      level = 6;
    } else if (zoom > 12 && zoom <= 13) {
      level = 7;
    }
    final aggregationsWom = await womDB.getAggregatedWoms(level);
    print("reading complete aggregatio woms : ${aggregationsWom.length}");
    return aggregationsWom;
  }

  //Sposta la mappa per puntare la posizione GPS corrente
  moveToCurrentLocation() {
    final loc = _location.value == null ? initialLocation : _location.value;
    mapController.move(loc, 12.0);
  }

  setFakeLocation() {
    print('setFakeLocation');
  }

  deleteFakeLocation() {
    print('deleteFakeLocation');
  }

  @override
  dispose() {
//    womDB.closeDb();
    _radius.close();
    _location.close();
    _mapPosition.close();
  }
}

enum SourceAim {
  ROAD,
  OTHER,
}
