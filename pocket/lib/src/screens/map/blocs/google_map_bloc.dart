import 'dart:async';
import 'package:pocket/src/models/aggregation_wom_model.dart';
import 'package:pocket/src/models/map_object.dart';
import 'package:pocket/src/screens/map/map.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:latlong/latlong.dart' as latLong;

final int oneDayInMilliseconds = 86400;

class GoogleMapBloc implements BlocBase {
  final latLong.LatLng initialLocation = latLong.LatLng(42.825932, 13.715370);
  final CameraPosition initialGLocation =
      CameraPosition(target: LatLng(42.825932, 13.715370), zoom: 0.0);

  final _radius = BehaviorSubject<double>();

  //serve solo per il debug poi si puo sostituire con una variabile locale
  final _location = BehaviorSubject<LatLng>();
  final _mapPosition = BehaviorSubject<CameraPosition>();
  final _mapObject = BehaviorSubject<MapObject>();
  final _dateFilter = BehaviorSubject<double>();

  final _results = BehaviorSubject<List<WomModel>>();

  //Stream for display map
  Observable<MapObject> get mapObject => _mapObject.stream;

  Observable<LatLng> get location => _location.stream;

  Observable<double> get radius => _radius.stream;

  Observable<double> get dateFilter => _dateFilter.stream;

  Function(double) get changeRadius => _radius.sink.add;

  Function(CameraPosition) get changeMapPosition => _mapPosition.sink.add;

  // Source of wom
  final _sources = BehaviorSubject<List<WomGroupBy>>();

  Function(List<WomGroupBy>) get changeSource => _sources.sink.add;

  Observable<List<WomGroupBy>> get sources => _sources.stream;

  final _isMap = BehaviorSubject<bool>();

  changeTypeOfView() {
    _isMap.sink.add(!_isMap.value);
  }

  Observable<bool> get isMap => _isMap.stream;

  Location _loc;
  GoogleMapController mapController;
  int startDateQuery = 0;
  int endDateQuery = 0;

  final WomDB womDB;

//  bool semaphore = true;
  String textSlider = "Big Bang";

  int _dateInMillisecondsOfFirstWom;
  Set<String> filterSource;

  Future<int> getDateInMillisecondsOfFirstWom() async {
    if (_dateInMillisecondsOfFirstWom != null) {
      return _dateInMillisecondsOfFirstWom;
    }
    return await womDB.getMinDate();
  }

//  int singleStep = 0;
  GoogleMapBloc(this.womDB) {
    loadSourcesFromDB();
    changeRadius(15.0);
    _isMap.sink.add(false);

    _loc = new Location();

    //ascolto la variazione gps dell utente
    _loc.onLocationChanged().listen((Map<String, double> result) {
      final latLng = new LatLng(result['latitude'], result['longitude']);
      print("onLocationChanged");
      if (latLng != _location.value) {
        print("update new location");
        changeLoc(latLng);
      }
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.addListener(_onMapChanged);
    updateAggregationPoints(0.0);
    _extractMapInfo();
  }

  void _onMapChanged() {
    _extractMapInfo();
  }

  double previousZoom = 0.0;

  Future<void> _extractMapInfo({bool forceUpdate = false}) async {
    if (!mapController.isCameraMoving) {
      final zoom = mapController.cameraPosition.zoom;
      print("actual zoom: " + zoom.toString());
      if ((previousZoom != zoom && (previousZoom - zoom).abs() > 1) ||
          forceUpdate) {
        print("force update : " + forceUpdate.toString());
        previousZoom = zoom;
        print("previous zoom: " + previousZoom.toString());
        await mapController.clearMarkers();
        if (zoom < 13.5) {
          updateAggregationPoints(zoom);
        } else {
          updateWomPoints(zoom);
        }
      }
    }
  }

  updateWomPoints(double zoom) async {
    List<WomModel> woms = await fetchWom(
        bounds: null,
        startDate: startDateQuery,
        endDate: endDateQuery,
        sources: filterSource);
    if (woms == null) woms = List<WomModel>();

    final markerOptions = MarkerOptions(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    woms.forEach((a) {
      mapController.addMarker(markerOptions.copyWith(MarkerOptions(
        position: a.gLocation,
      )));
    });
  }

  updateAggregationPoints(double zoom) async {
    List<AggregationWom> aggregation = await fetchAggregationWom(zoom,
        startDate: startDateQuery,
        endDate: endDateQuery,
        sources: filterSource);
    print("aggregation lenght: " + aggregation.length.toString());

    final markerOptions = MarkerOptions(icon: BitmapDescriptor.defaultMarker);
    aggregation.forEach((a) {
      mapController.addMarker(markerOptions.copyWith(MarkerOptions(
        position: a.gLocation,
      )));
    });
  }

  Future<void> loadSourcesFromDB() async {
    final List<WomGroupBy> sources = await womDB.getSourcesFromDB();
    changeSource(sources);
    filterSource = Set<String>();

    sources.forEach((source) {
      filterSource.add(source.type);
    });
    print("lunghezza del filtro source = ${filterSource.length}");
  }

  //Calculate the time from first wom acquired
  //if is 2 weeks old display the slider
  calculateTimeFromStartToNow() async {
//    singleStep = getSingleStep();
    final v = getSingleStep();
    if (v > 0) changeDateFilter(10.0);
  }

  Future<int> getTimeOfFirstWomAcquired() async {
    return await womDB.getMinDate();
  }

  getSingleStep() async {
    final today = DateTime.now().millisecondsSinceEpoch;

    final int dateInMillisecondsOfFirstWom =
        await getDateInMillisecondsOfFirstWom();
    final difference = today - dateInMillisecondsOfFirstWom;
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

  addSourceToFilter(String source) {
    filterSource.add(source);
    _extractMapInfo(forceUpdate: true);
  }

  removeSourceFromFilter(String source) {
    if (filterSource.contains(source)) {
      filterSource.remove(source);
      _extractMapInfo(forceUpdate: true);
    }
  }

  changeTextIndicator(double sliderValue) {
    if (sliderValue != _dateFilter.value) {
      print("change text indicator slider");
      _dateFilter.sink.add(sliderValue);
      final sliderValueInt = sliderValue.toInt();
      textSlider = valueIndicatorTextSlider[sliderValueInt];
    }
  }

  double previousDateFilterValue = 0.0;

//  Function(double) changeDateFiler(double value) => _dateFilter.sink.add;
  Future<void> changeDateFilter(double sliderValue) async {
    if (sliderValue != previousDateFilterValue) {
      previousDateFilterValue = sliderValue;
      print("fetch query for filter time changed");
//      final int singleStep = await getSingleStep();
//    final int singleStep = 300;
//      final int days = singleStep * sliderValue.round();

      final sliderValueInt = sliderValue.toInt();

      if (sliderValueInt == 0) {
        startDateQuery = 0;
        endDateQuery = 0;
      } else {
        final int todayInMillisecondsSinceEpoch =
            DateTime.now().millisecondsSinceEpoch;

        final int rangeTime = timeInMilliseconds[sliderValueInt];
        final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
        print(DateTime.fromMillisecondsSinceEpoch(queryDate).toString());
        startDateQuery = queryDate;
        endDateQuery = todayInMillisecondsSinceEpoch;
      }

      await _extractMapInfo(forceUpdate: true);

//      if (value == 0.0) {
//        textSlider = "Today";
//      } else if (days <= 10) {
//        textSlider = days.toString();
//      } else if (days <= 28) {
//        final weeks = (days ~/ 7.0).toString();
//        textSlider = weeks + "w";
//      } else if (days <= 335) {
//        final months = (days ~/ 30.0).toString();
//        textSlider = months + "m";
//      } else if (days > 364) {
//        final years = (days ~/ 365.0).toString();
//        textSlider = years + "y";
//      }
    }
  }

  Function(LatLng) get changeLoc => _location.sink.add;

  //Stream della lista di attività in base alla posizione geografica
  Stream<List<WomModel>> get results => _results.stream;

  //prendi i wom dal db relativi all area visualizzata
  Future<List<WomModel>> fetchWom(
      {int startDate,
      int endDate,
      LatLngBounds bounds,
      String filter,
      Set<String> sources,
      bool all = false}) async {
    print("fetchWom: loading woms");
    if (sources != null && sources.isEmpty) {
      print("fetchWom: empty list of woms for source empty or null");
      return List<WomModel>();
    }
    final woms = await womDB.getWoms(
        startDate: startDate ?? 0,
        endDate: endDate ?? 0,
        sources: filterSource);
    print("fetchWom: reading complete woms : ${woms.length}");
    return woms;
  }

  Future<List<WomGroupBy>> fetchGroupedWoms() async {
    print("fetchGroupedWoms: loading woms");
    final groupedWoms = await womDB.getGroupedWoms();
    print("fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
    return groupedWoms;
  }

  //prendi i wom dal db relativi all area visualizzata
  Future<List<AggregationWom>> fetchAggregationWom(double zoom,
      {int startDate, int endDate, Set<String> sources}) async {
    print("loading aggregation woms");
    int level = 5;

    if (zoom < 3) {
      level = 2;
    } else if (zoom < 5) {
      level = 2;
    } else if (zoom < 10) {
      level = 3;
    } else if (zoom < 11) {
      level = 4;
    } else if (zoom < 13) {
      level = 5;
    } else if (zoom < 13.5) {
      level = 6;
    }
    final aggregationsWom = await womDB.getAggregatedWoms(level,
        startDate: startDate, endDate: endDate, sources: sources);
    print("reading complete aggregatio woms : ${aggregationsWom.length}");
    return aggregationsWom;
  }

  //Sposta la mappa per puntare la posizione GPS corrente
  moveToCurrentLocation() {
    final loc = _location.value == null ? initialLocation : _location.value;

    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 270.0,
        target: loc,
        tilt: 30.0,
        zoom: 12.0,
      ),
    ));
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

const timeInMilliseconds = [
  315360000000,//ten years
  157680000000, //five years
  94608000000, //three years
  31536000000, //one year
  283824000000, //nine months
  16070400000, //six months
  8035200000, //three months
  2678400000, //one month
  1209600000, //two weeks
  604800000, //one week
  0,
];
