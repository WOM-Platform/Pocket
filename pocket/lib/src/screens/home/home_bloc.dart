import 'dart:async';
import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/suggestion_model.dart';
import 'package:pocket/src/models/transaction_model.dart';
import 'package:pocket/src/models/wom_model.dart';
import 'package:pocket/src/db/transaction_db.dart';
import 'package:pocket/src/db/wom_db.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeBloc extends BlocBase {
  final TransactionDB _transactionDB;

  //Deep Link subscription
//  StreamSubscription<Uri> _deepLink;

  // Transactions List
  BehaviorSubject<List<TransactionModel>> _transactions =
      BehaviorSubject<List<TransactionModel>>();

  Observable<List<TransactionModel>> get transactions => _transactions.stream;

  Function get addTransactions => _transactions.sink.add;

  //Suggestions
  BehaviorSubject<List<SuggestionModel>> _suggestions =
      BehaviorSubject<List<SuggestionModel>>();

  Observable<List<SuggestionModel>> get suggestions => _suggestions.stream;

  // Woms count
  BehaviorSubject<int> _womsCount = BehaviorSubject<int>();

  Observable<int> get womsCount => _womsCount.stream;

  int get nWoms => _womsCount.value ?? 0;

  List<SuggestionModel> localSuggestions = suggestionsItem;
  WomDB womDB;

  HomeBloc(this._transactionDB) {
    womDB = WomDB.get();
    readTransaction();
    getWomsCount();
    _suggestions.add(localSuggestions);
//
//    _deepLink = getUriLinksStream().listen((Uri uri) {
//      //TODO chiamare pin screen non accept credits
//      try {
////        final deepData = DeepLinkModel.fromUri(uri);
////        final acceptProvider = BlocProvider(
////            child: TransactionSummaryScreen(), bloc: TransactionSummaryBloc(deepData, "1234"));
////        Navigator.push(
////          context,
////          MaterialPageRoute<bool>(builder: (context) => acceptProvider),
////        ).then((value) {
////          print("return from accept provider " + value.toString());
////          refreshList();
////        });
//      } on FormatException {
//        print("FormatException error");
//      }
//    }, onError: (err) {
//      print(err.toString());
//    });
  }

  getWomsCount() async{
    final count = await womDB.getWomsCount();
    print("Total Woms = $count");
    _womsCount.sink.add(count);
  }

  Future<String> scanQRCode() async {
    try {
      return await BarcodeScanner.scan();
    } on PlatformException catch (ex) {
      if (ex == BarcodeScanner.CameraAccessDenied) {
        throw Exception(ex);
      } else {
        throw Exception("unknow error");
      }
    } on FormatException {
      throw FormatException(
          "Hai premuto il pulsante back prima di acquisire il dato");
    } catch (ex) {
      throw Exception(ex);
    }
  }

  extractPointFromJson(String data) async {
    print("STAR EXTRACT FROM JSON");
    List<dynamic> new_data = json.decode(data.toString());

    int i = 0;
    for (int i = 0; i < new_data.length; i++) {
      final point = new_data[i];
      final wom = WomModel(
        gLocation: LatLng(point["LATITUDE"], point["LONGITUDE"]),
        secret: "secret",
        sourceName: "SmartRoadSense",
        timestamp: DateTime.now().millisecondsSinceEpoch,
        id: i,
        live: WomStatus.ON,
      );
      await womDB.insertWom(wom);
    }
//    new_data.forEach((point) async {
//
//      final wom = WomModel(
//        location: LatLng(point["LATITUDE"], point["LONGITUDE"]),
//        secret: "secret",
//        source: "",
//        timestamp: DateTime.now().millisecondsSinceEpoch,
//        id: i,
//        live: WomStatus.ON,
//      );
//
//      await womDB.updateWom(wom);
//      i++;
//    });

    print("EXTRACT COMPLETE");
  }

  removeSuggestionAt(int index) {
    localSuggestions.removeAt(index);
    _suggestions.sink.add(localSuggestions);
  }

  refreshSuggestions() {
    localSuggestions = suggestionsItem;
    _suggestions.sink.add(localSuggestions);
  }

  refreshList() {
    readTransaction();
  }

  readTransaction() async {
    final list = await _transactionDB.getTransactions();
    print("transactions readed" + list.length.toString());
    addTransactions(list);
  }

  readAggregationWoms() async {
//    final geoHash = Geohash.encode(initialLocation.latitude, initialLocation.longitude);
//    final result = await womDB.getAggregatedWoms();
//    final d = geoHash.substring(0,1);
//    print(d);
//    final l = Geohash.decode(d);
//    print(l.x);
//    print(l.y);
//    print(result);
  }

//  createFakeWom() async {
//    print("create fake wom : START");
//    for (var city in cities) {
//      for (var i = 0; i < 10; i++) {
//        final location = LatLng(
//          city.latitude + (Random().nextInt(9) / 1000),
//          city.longitude + (Random().nextInt(9) / 1000),
//        );
//        final aim = i.isEven ? Aim.ROAD : Aim.MEDICAL;
//        final date = DateTime(2018, 5, 1 + Random().nextInt(30));
//        final WomModel wom = WomModel(
//            timestamp: date.millisecondsSinceEpoch,
//            live: WomStatus.ON,
//            location: location,
//            secret: "adfdcfvf",
//            source: aim.toString());
//        await womDB.insertWom(wom);
//      }
//
//      for (var i = 0; i < 10; i++) {
//        final location = LatLng(
//          city.latitude + (Random().nextInt(9) / 1000),
//          city.longitude + (Random().nextInt(9) / 1000),
//        );
//        final aim = i.isEven ? Aim.ROAD : Aim.MEDICAL;
//        final date = DateTime(2018, 12, 5);
//        final WomModel wom = WomModel(
//            timestamp: date.millisecondsSinceEpoch,
//            live: WomStatus.ON,
//            location: location,
//            secret: "adfdcfvf",
//            source: aim.toString());
//        await womDB.insertWom(wom);
//      }
//
//      for (var i = 0; i < 10; i++) {
//        final location = LatLng(
//          city.latitude + (Random().nextInt(9) / 1000),
//          city.longitude + (Random().nextInt(9) / 1000),
//        );
//        final aim = i.isEven ? Aim.ROAD : Aim.MEDICAL;
//        final date = DateTime(2018, 11, 1 + Random().nextInt(30));
//        final WomModel wom = WomModel(
//            timestamp: date.millisecondsSinceEpoch,
//            live: WomStatus.ON,
//            location: location,
//            secret: "adfdcfvf",
//            source: aim.toString());
//        await womDB.insertWom(wom);
//      }
//    }
//    print("create fake wom : COMPLETE");
//
////    await readAggregationWoms();
//    //womDB.closeDb();
//    // await tryRead();
//  }

  List<LatLng> cities = [
    LatLng(41.9102415, 12.3959123), //ROMA
    LatLng(41.3948976, 2.0787275), //BARCELLONA
    LatLng(45.0702388, 7.600049), //TORINO
    LatLng(40.8537158, 14.1729665), //NAPOLI
    LatLng(42.8529413, 13.5739962), //ASCOLI PICENO
    LatLng(43.7292635, 12.6129106), //URBINO
    LatLng(43.8401654, 12.986061), //FANO
  ];

  tryRead() async {
    final woms = await womDB.getWoms();
    print(woms.length);
  }

////  final _repository = Repository();
//  final _topIds = PublishSubject<List<int>>();
//  final _itemsOutput = BehaviorSubject<Map<int, Future<VoucherModel>>>();
//  final _itemsFetcher = PublishSubject<int>();
//
//  // Getters to Streams
//  Observable<List<int>> get topIds => _topIds.stream;
//
//  Observable<Map<int, Future<VoucherModel>>> get items => _itemsOutput.stream;
//
//  // Getters to Sinks
//  Function(int) get fetchItem => _itemsFetcher.sink.add;
//
//  StoriesBloc() {
//    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
//  }
//
//  fetchTopIds() async {
//    final ids = await _repository.fetchTopIds();
//    _topIds.sink.add(ids);
//  }
//
//  clearCache() {
////    return _repository.clearCache();
//  }
//
//  _itemsTransformer() {
//    return ScanStreamTransformer(
//      (Map<int, Future<VoucherModel>> cache, int id, index) {
//        cache[id] = _repository.fetchItem(id);
//        return cache;
//      },
//      <int, Future<VoucherModel>>{},
//    );
//  }
//
  @override
  void dispose() {
    //womDB.closeDb();
    _suggestions.close();
    _transactions.close();
//    _deepLink.cancel();
  }
}

List<SuggestionModel> suggestionsItem = [
  SuggestionModel(
    text: "What is the WOM?",
    url: "",
    type: "FAQ",
  ),
  SuggestionModel(
    text:
        "Try catch more woms with SRS",
    url: "",
    type : "Suggestion",
  ),
];
