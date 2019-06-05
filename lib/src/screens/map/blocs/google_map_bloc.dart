//import 'dart:async';
//import 'package:clustering_google_maps/clustering_google_maps.dart';
//import 'package:pocket/constants.dart';
//import 'package:pocket/src/db/app_db.dart';
//import 'package:pocket/src/models/aggregation_wom_model.dart';
//import 'package:pocket/src/models/optional_query_model.dart';
//import 'package:pocket/src/models/source_group_wom.dart';
//import 'package:pocket/src/models/wom_model.dart';
//import 'package:pocket/src/db/wom_db.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:pocket/src/blocs/bloc_provider.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:latlong/latlong.dart' as latLong;
//import 'package:sqflite/sqflite.dart';
//
//class GoogleMapBloc implements BlocBase {
//  final latLong.LatLng initialLocation = latLong.LatLng(42.825932, 13.715370);
//  final CameraPosition initialGLocation =
//      CameraPosition(target: LatLng(42.825932, 13.715370), zoom: 0.0);
//
//  final _radius = BehaviorSubject<double>();
//
//  //serve solo per il debug poi si puo sostituire con una variabile locale
//  final BehaviorSubject<LatLng> _location = BehaviorSubject<LatLng>();
//  final BehaviorSubject<CameraPosition> _mapPosition =
//      BehaviorSubject<CameraPosition>();
//
//  //final BehaviorSubject<MapObject> _mapObject = BehaviorSubject<MapObject>();
//  final BehaviorSubject<double> _dateFilter = BehaviorSubject<double>();
//
//  final _results = BehaviorSubject<List<WomModel>>();
//
//  //Stream for display map
//  //Observable<MapObject> get mapObject => _mapObject.stream;
//
//  Observable<LatLng> get location => _location.stream;
//
//  Observable<double> get radius => _radius.stream;
//
//  Observable<double> get dateFilter => _dateFilter.stream;
//
//  Function(double) get changeRadius => _radius.sink.add;
//
//  Function(CameraPosition) get changeMapPosition => _mapPosition.sink.add;
//
//  // Source of wom
//  final _sources = BehaviorSubject<List<WomGroupBy>>();
//
//  Function(List<WomGroupBy>) get changeSource => _sources.sink.add;
//
//  Observable<List<WomGroupBy>> get sources => _sources.stream;
//
//  final _isMap = BehaviorSubject<bool>();
//
//  changeTypeOfView() {
//    _isMap.sink.add(!_isMap.value);
//  }
//
//  Observable<bool> get isMap => _isMap.stream;
//
////  Location _loc;
//  GoogleMapController mapController;
//  int startDateQuery = 0;
//  int endDateQuery = 0;
//
//  final WomDB womDB;
//
////  bool semaphore = true;
//  String textSlider = "Big Bang";
//
//  int _dateInMillisecondsOfFirstWom;
//  Set<String> filterSource;
//
//  Future<int> getDateInMillisecondsOfFirstWom() async {
//    if (_dateInMillisecondsOfFirstWom != null) {
//      return _dateInMillisecondsOfFirstWom;
//    }
//    return await womDB.getMinDate();
//  }
//
//  final int womsCount;
//
//  //  int singleStep = 0;
//  GoogleMapBloc(this.womDB, this.womsCount) {
//    initDatabaseClustering();
//    loadSourcesFromDB();
//    changeRadius(15.0);
//    _isMap.sink.add(false);
//
//    /* _loc = new Location();
//
//    //ascolto la variazione gps dell utente
//    _loc.onLocationChanged().listen((Map<String, double> result) {
//      final latLng = new LatLng(result['latitude'], result['longitude']);
//      print("onLocationChanged");
//      if (latLng != _location.value) {
//        print("update new location");
//        changeLoc(latLng);
//      }
//    });*/
//  }
//
//  ClusteringHelper clusteringHelper;
//
//  void onMapCreated(
//      GoogleMapController controller, Function updateMarkers) async {
//    mapController = controller;
//    print("onMapCreated");
//    clusteringHelper.database = await AppDatabase.get().getDb();
//    clusteringHelper.updateMarkers = updateMarkers;
//    clusteringHelper.updateMap();
//  }
//
//  initDatabaseClustering() {
//    clusteringHelper = ClusteringHelper.forDB(
//      dbGeohashColumn: WomModel.dbGeohash,
//      dbLatColumn: WomModel.dbLat,
//      dbLongColumn: WomModel.dbLong,
//      dbTable: WomModel.tblWom,
//      whereClause: OptionalQuery(sources: filterSource).build(),
//      updateMarkers: null,
//    );
//  }
//
//  double previousZoom = 0.0;
//
//  Future<void> loadSourcesFromDB() async {
//    final List<WomGroupBy> sources = await womDB.getSourcesFromDB();
//    changeSource(sources);
//    filterSource = Set<String>();
//
//    sources.forEach((source) {
//      filterSource.add(source.type);
//    });
//    print("source filter : $filterSource");
//    print("lunghezza del filtro source = ${filterSource.length}");
//    if (clusteringHelper != null) {
//      print('clusteringHelper NOT null, sources loaded');
//      clusteringHelper.whereClause =
//          OptionalQuery(sources: filterSource).build();
//    }
//  }
//
//  //Calculate the time from first wom acquired
//  //if is 2 weeks old display the slider
//  calculateTimeFromStartToNow() async {
////    singleStep = getSingleStep();
//    final v = getSingleStep();
//    if (v > 0) changeDateFilter(10.0);
//  }
//
//  Future<int> getTimeOfFirstWomAcquired() async {
//    return await womDB.getMinDate();
//  }
//
//  getSingleStep() async {
//    final today = DateTime.now().millisecondsSinceEpoch;
//
//    final int dateInMillisecondsOfFirstWom =
//        await getDateInMillisecondsOfFirstWom();
//    final difference = today - dateInMillisecondsOfFirstWom;
//    if (difference > oneDayInMilliseconds * 14) {
//      print(
//          "sono passati pi+ di 2 settimane quindi visualizziamo la barra per il filtro temporale");
//      final fraction = difference / 10000;
//      final oneSection = fraction / oneDayInMilliseconds;
//      print(today);
//      print(difference);
//      print(fraction);
//      print(oneSection.round());
//      return oneSection.round();
//    }
//    return 0;
//  }
//
//  addSourceToFilter(String source) {
//    print("addSourceToFilter: $source");
//    filterSource.add(source);
//    clusteringHelper.whereClause = OptionalQuery(
//      startDate: startDateQuery,
//      endDate: endDateQuery,
//      sources: filterSource,
//    ).build();
//    clusteringHelper.updateMap();
////    _extractMapInfo(forceUpdate: true);
//  }
//
//  removeSourceFromFilter(String source) {
//    print("removeSourceFromFilter: $source");
//    if (filterSource.contains(source)) {
//      filterSource.remove(source);
//      clusteringHelper.whereClause = OptionalQuery(
//        startDate: startDateQuery,
//        endDate: endDateQuery,
//        sources: filterSource,
//      ).build();
//      clusteringHelper.updateMap();
////      _extractMapInfo(forceUpdate: true);
//    }
//  }
//
//  changeTextIndicator(double sliderValue) {
//    if (sliderValue != _dateFilter.value) {
//      print("change text indicator slider");
//      _dateFilter.sink.add(sliderValue);
//      final sliderValueInt = sliderValue.toInt();
//      textSlider = valueIndicatorTextSlider[sliderValueInt];
//    }
//  }
//
//  double previousDateFilterValue = 0.0;
//
//  Future<void> changeDateFilter(double sliderValue) async {
//    if (sliderValue != previousDateFilterValue) {
//      previousDateFilterValue = sliderValue;
//      print("fetch query for filter time changed");
//      final sliderValueInt = sliderValue.toInt();
//
//      if (sliderValueInt == 0) {
//        startDateQuery = 0;
//        endDateQuery = 0;
//      } else {
//        final int todayInMillisecondsSinceEpoch =
//            DateTime.now().millisecondsSinceEpoch;
//
//        final int rangeTime = timeInMilliseconds[sliderValueInt];
//        final int queryDate = todayInMillisecondsSinceEpoch - rangeTime;
//        print(DateTime.fromMillisecondsSinceEpoch(queryDate).toString());
//        startDateQuery = queryDate;
//        endDateQuery = todayInMillisecondsSinceEpoch;
//      }
//
//      clusteringHelper.whereClause = OptionalQuery(
//        startDate: startDateQuery,
//        endDate: endDateQuery,
//        sources: filterSource,
//      ).build();
//
//      await clusteringHelper.updateMap();
//    }
//  }
//
//  Function(LatLng) get changeLoc => _location.sink.add;
//
//  //Stream della lista di attività in base alla posizione geografica
//  Stream<List<WomModel>> get results => _results.stream;
//
//  //prendi i wom dal db relativi all area visualizzata
//  Future<List<WomModel>> fetchWom(
//      {int startDate,
//      int endDate,
//      LatLngBounds bounds,
//      String filter,
//      Set<String> sources,
//      bool all = false}) async {
//    print("fetchWom: loading woms");
//    if (sources != null && sources.isEmpty) {
//      print("fetchWom: empty list of woms for source empty or null");
//      return List<WomModel>();
//    }
//    final woms = await womDB.getWoms(
//        startDate: startDate ?? 0,
//        endDate: endDate ?? 0,
//        sources: filterSource);
//    print("fetchWom: reading complete woms : ${woms.length}");
//    return woms;
//  }
//
//  Future<List<WomGroupBy>> fetchGroupedWoms() async {
//    print("fetchGroupedWoms: loading woms");
//    final groupedWoms = await womDB.getGroupedWoms();
//    print("fetchGroupedWoms: reading complete woms : ${groupedWoms.length}");
//    return groupedWoms;
//  }
//
//  //Sposta la mappa per puntare la posizione GPS corrente
//  moveToCurrentLocation() {
//    final loc = _location.value == null ? initialLocation : _location.value;
//
//    mapController.animateCamera(CameraUpdate.newCameraPosition(
//      CameraPosition(
//        bearing: 270.0,
//        target: loc,
//        tilt: 30.0,
//        zoom: 12.0,
//      ),
//    ));
//  }
//
//  setFakeLocation() {
//    print('setFakeLocation');
//  }
//
//  deleteFakeLocation() {
//    print('deleteFakeLocation');
//  }
//
//  @override
//  dispose() {
//    _radius.sink.close();
////    womDB.closeDb();
//    _radius.close();
//    _location.close();
//    _mapPosition.close();
//    //_mapObject.close();
//  }
//}
//
//enum SourceAim {
//  ROAD,
//  OTHER,
//}
//
//const valueIndicatorTextSlider = [
//  "Big Bang",
//  "5y",
//  "3y",
//  "1y",
//  "9m",
//  "6m",
//  "3m",
//  "1m",
//  "2w",
//  "1w",
//  "Today",
//];
//
//const timeInMilliseconds = [
//  315360000000, //ten years
//  157680000000, //five years
//  94608000000, //three years
//  31536000000, //one year
//  283824000000, //nine months
//  16070400000, //six months
//  8035200000, //three months
//  2678400000, //one month
//  1209600000, //two weeks
//  604800000, //one week
//  0,
//];
