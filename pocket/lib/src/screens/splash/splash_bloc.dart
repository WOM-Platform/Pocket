import 'dart:async';
import 'package:pocket/constants.dart';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mmkv/flutter_mmkv.dart';

class SplashBloc extends BlocBase {
  BehaviorSubject<DeepLinkModel> _deep = BehaviorSubject<DeepLinkModel>();

  Observable<DeepLinkModel> get deep => _deep.stream;

  StreamSubscription _sub;

  SplashBloc() {
    //initPlatformStateForStringUniLinks();
    //initPlatformStateForUriUniLinks();
  }

  Future<bool> isFirstOpen() async {
    final containsKey = await FlutterMmkv.containsKey(IS_FIRST_OPEN);
    if(containsKey){
      final isFirstOpen = await FlutterMmkv.decodeBool(IS_FIRST_OPEN);
      return isFirstOpen;
    }
    FlutterMmkv.encodeBool(IS_FIRST_OPEN, false);
    return true;
  }

  /// An implementation using a [String] link
  initPlatformStateForStringUniLinks() async {
    //String _latestLink;
    Uri _latestUri;
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      //_latestLink = link ?? 'Unknown';
      try {
        if (link != null) _latestUri = Uri.parse(link);
        _deep.sink.add(DeepLinkModel.fromUri(_latestUri));
      } on FormatException {
        _deep.addError("Format exception");
      }
    }, onError: (err) {
      _deep.addError('Failed to get latest link: $err.');
    });

//    // Get the latest link
//    String initialLink;
//    Uri initialUri;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      initialLink = await getInitialLink();
//      print('initial link: $initialLink');
//      if (initialLink != null) initialUri = Uri.parse(initialLink);
//    } on PlatformException {
//      initialLink = 'Failed to get initial link.';
//    } on FormatException {
//      initialLink = 'Failed to parse the initial link as Uri.';
//      initialUri = null;
//    }
//
//    _latestLink = initialLink;
//    _latestUri = initialUri;
  }

  Future<DeepLinkModel> getUriData() async {
    Uri initialUri;
    try {
      initialUri = await getInitialUri();
      final deepLinkModel = DeepLinkModel.fromUri(initialUri);
      return deepLinkModel;
    } on PlatformException {
      print('Failed to get initial link.');
    } on FormatException {
      print('Failed to parse the initial link as Uri.');
    } catch (e) {
      print(e.toString());
    }

    return null;

//    if(initialUri != null){
//      print("SplashBloc: ${initialUri}");
//      try{
//        final deepLinkModel = DeepLinkModel.fromUri(initialUri);
//        return deepLinkModel;
//      }catch (err){
//        print(err.toString());
//        return null;
//      }
//
//    }
//    return null;
  }

  /// An implementation using the [Uri] convenience helpers
  initPlatformStateForUriUniLinks() async {
    // Attach a listener to the Uri links stream
    _sub = getUriLinksStream().listen((Uri uri) {
      _deep.sink.add(DeepLinkModel.fromUri(uri));
    }, onError: (err) {
      _deep.addError("Format exception + ${err.toString()}");
    });

    // Attach a second listener to the stream
//    getUriLinksStream().listen((Uri uri) {
//      print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
//    }, onError: (err) {
//      print('got err: $err');
//    });

    Uri initialUri;
    try {
      initialUri = await getInitialUri();
      print('initial uri: ${initialUri?.path}'
          ' ${initialUri?.queryParametersAll}');
    } on PlatformException {
      initialUri = null;
      print('Failed to get initial uri.');
    } on FormatException {
      initialUri = null;
      print('Bad parse the initial link as Uri.');
    }
  }

  @override
  void dispose() {
    if (_sub != null) _sub.cancel();
    _deep.close();
  }
}
