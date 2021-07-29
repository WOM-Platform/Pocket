import 'dart:async';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/blocs/transactions_list/bloc.dart';
import 'package:pocket/src/services/app_repository.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/utils/utils.dart';
import 'package:uni_links/uni_links.dart';

import '../../my_logger.dart';
import 'app_event.dart';
import 'app_state.dart';

bool isFirstOpen = false;

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _appRepository;
  StreamSubscription _sub;
  final TransactionsListBloc transactionsBloc;

  AppBloc(this._appRepository, this.transactionsBloc)
      : assert(_appRepository != null),
        super(InitialAppState()) {
    add(LoadData());

    _sub = getUriLinksStream().listen((Uri uri) {
      logger.i("Subscription stream uri : $uri");
      final deepLinkModel = DeepLinkModel.fromUri(uri);
      add(DeepLinkEvent(deepLinkModel));
    }, onError: (err) {
      logger.i("Stream uri error : $err");
    });
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LoadData) {
      yield LoadingData();
      await _appRepository.updateAim();
      transactionsBloc.add(LoadTransactions());
      final deepLink = await getDeepLink();
      if (deepLink != null) {
        //TODO remove delay?
        await Future.delayed(Duration(milliseconds: 500));
        yield DeepLinkMode(deepLink);
      } else {
        isFirstOpen = await Utils.readIsFirstOpen();
        if (isFirstOpen) {
          await Utils.setIsFirstOpen(false);
        }
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
      logger.i("AppBloc uri : $initialUri");
      deepLinkModel = DeepLinkModel.fromUri(initialUri);
    } on PlatformException {
      logger.i("AppReposirotry");
      logger.i('Failed to get initial link.');
//      return Future.error('Failed to get initial link.');
    } on FormatException {
      logger.i("AppBloc");
      logger.i('Failed to parse the initial link as Uri.');
//      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      logger.i("AppBloc");
      logger.i(e.toString());
//      return Future.error(e);
    }
    return deepLinkModel;
  }

  @override
  void dispose() {
    _sub.cancel();
    super.close();
  }
}
