import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/my_logger.dart';
import 'package:wom_pocket/src/services/app_repository.dart';
import 'package:wom_pocket/src/utils/utils.dart';

import '../blocs/app/app_state.dart';

bool isFirstOpen = false;

final appNotifierProvider = AsyncNotifierProvider<AppNotifier, AppState>(AppNotifier.new);

class AppNotifier extends AsyncNotifier<AppState>{

  @override
  FutureOr<AppState> build() async{
    // state =  LoadingData();
    await ref.read(appRepositoryProvider).updateAim();
    // transactionsBloc!.add(LoadTransactions());
    final deepLink = await getDeepLink();
    if (deepLink != null) {
      //TODO remove delay?
      await Future.delayed(Duration(milliseconds: 500));
      return DeepLinkMode(deepLink);
    } else {
      isFirstOpen = await Utils.readIsFirstOpen();
      if (isFirstOpen) {
        await Utils.setIsFirstOpen(false);
      }
      if (isFirstOpen) {
        return IntroMode();
      } else {
        return NormalMode();
      }
    }
  }

  Future<DeepLinkModel?> getDeepLink() async {
    DeepLinkModel? deepLinkModel;
    try {
      Uri? initialUri = await getInitialUri();
      logger.i("AppNotifier uri : $initialUri");
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

  Future<AppStatus> getAppStatus(){
    return ref.read(appRepositoryProvider).getAppStatus();
  }

  goIntoNormalMode(){
    state = AsyncData(NormalMode());
  }

  goIntoDeepLinkMode(DeepLinkModel deepLinkModel){
    state = AsyncData(DeepLinkMode(deepLinkModel));
  }
}