import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/services.dart';
import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:pocket/src/services/aim_repository.dart';
import 'package:uni_links/uni_links.dart';

import '../my_logger.dart';

class AppRepository {
  late AimRepository _aimRepository;

  AppRepository() {
    _aimRepository = AimRepository();
  }

  Future<List<Aim?>> updateAim() async {
    return _aimRepository.updateAim(AppDatabase.get().getDb);
  }

  Future<DeepLinkModel> getDeepLink() async {
    try {
      Uri? initialUri = await getInitialUri();
      logger.i("AppRepository uri : $initialUri");
      final deepLinkModel = DeepLinkModel.fromUri(initialUri);
      return deepLinkModel;
    } on PlatformException {
      logger.i("AppReposirotry");
      logger.i('Failed to get initial link.');
      return Future.error('Failed to get initial link.');
    } on FormatException {
      logger.i("AppReposirotry");
      logger.i('Failed to parse the initial link as Uri.');
      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      logger.e("AppRepository");
      logger.e(e.toString());
      return Future.error(e);
    }
  }
}
