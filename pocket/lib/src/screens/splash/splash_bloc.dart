import 'dart:async';
import 'package:pocket/src/blocs/bloc_provider.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

enum UniLinksType { string, uri }

class SplashBloc extends BlocBase {
  BehaviorSubject<DeepLinkModel> _deep = BehaviorSubject<DeepLinkModel>();

  Observable<DeepLinkModel> get deep => _deep.stream;

  StreamSubscription _sub;

  SplashBloc() {
    initPlatformStateForStringUniLinks();
  }

  /// An implementation using a [String] link
  initPlatformStateForStringUniLinks() async {
    String _latestLink;
    Uri _latestUri;
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      _latestLink = link ?? 'Unknown';
      try {
        if (link != null) _latestUri = Uri.parse(link);
        _deep.sink.add(DeepLinkModel(link: _latestLink, uri: _latestUri));
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

 Future<DeepLinkModel> getUriData() async{
   //    // Get the latest link
    String initialLink;
    Uri initialUri;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      print('initial link: $initialLink');
      if (initialLink != null) initialUri = Uri.parse(initialLink);
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
      initialUri = null;
    }

    if(initialLink != null){
      return DeepLinkModel(link: initialLink, uri: initialUri);
    }

    return null;
  }




  @override
  void dispose() {
    if (_sub != null) _sub.cancel();
    _deep.close();
  }
}
