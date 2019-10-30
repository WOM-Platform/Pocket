import 'dart:async';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/blocs/transactions_list/bloc.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/utils/utils.dart';
import 'package:uni_links/uni_links.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _appRepository;
  StreamSubscription _sub;
  final TransactionsListBloc transactionsBloc;

  AppBloc(this._appRepository, this.transactionsBloc)
      : assert(_appRepository != null) {
    dispatch(LoadData());

    _sub = getUriLinksStream().listen((Uri uri) {
      print("Subscription stream uri : $uri");
      final deepLinkModel = DeepLinkModel.fromUri(uri);
      dispatch(DeepLinkEvent(deepLinkModel));
    }, onError: (err) {
      print("Stream uri error : $err");
    });
  }

//  Future<bool> test() async {
//    final String id = "1/1/2";
//    final AimDb aimDb = AimDb.get();
//
//    final aim = Aim.fromMap({
//      Aim.ID: id,
//      Aim.SHORT_TITLE: "Simple AIM",
//      Aim.DESCRIPTION: "description",
//      Aim.ICON_URL: "iconUrl",
//    });
//
//    await aimDb.insert(aim);
//
//    final queryAim = await aimDb.getAim(id);
//    assert(aim == queryAim);
//    print("TEST OK");
//    return aim == queryAim;
//  }

  @override
  AppState get initialState => InitialAppState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LoadData) {
      yield LoadingData();
      final aimList = await _appRepository.updateAim();
      transactionsBloc.dispatch(LoadTransactions());
      final deepLink = await getDeepLink();
      if (deepLink != null) {
        //TODO remove delay?
        await Future.delayed(Duration(milliseconds: 500));
        yield DeepLinkMode(deepLink);
      } else {
        final isFirstOpen = await Utils.isFirstOpen();
        //TODO remove delay?
        await Future.delayed(Duration(milliseconds: 500));
        if (isFirstOpen) {
          yield IntroMode();
        } else {
          yield NormalMode();
        }
      }
    }

    if (event is DeepLinkEvent) {
      yield DeepLinkMode(event.deepLinkModel);
    }

    if (event is HomeEvent) {
      yield NormalMode();
    }
  }

  Future<DeepLinkModel> getDeepLink() async {
    DeepLinkModel deepLinkModel;
    try {
      Uri initialUri = await getInitialUri();
      print("AppBloc uri : $initialUri");
      deepLinkModel = DeepLinkModel.fromUri(initialUri);
    } on PlatformException {
      print("AppReposirotry");
      print('Failed to get initial link.');
//      return Future.error('Failed to get initial link.');
    } on FormatException {
      print("AppBloc");
      print('Failed to parse the initial link as Uri.');
//      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      print("AppBloc");
      print(e.toString());
//      return Future.error(e);
    }
    return deepLinkModel;
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
