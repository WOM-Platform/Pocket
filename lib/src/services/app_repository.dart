import 'package:pocket/src/db/app_db.dart';
import 'package:pocket/src/models/deep_link_model.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';
import 'package:wom_package/wom_package.dart' show AimRepository, Aim;

class AppRepository {
  AimRepository _aimRepository;

  AppRepository() {
    _aimRepository = AimRepository();
  }

  Future<List<Aim>> updateAim() async {
    return await _aimRepository.updateAim(database: AppDatabase.get().getDb());
  }

  Future<DeepLinkModel> getDeepLink() async {
    try {
      Uri initialUri = await getInitialUri();
      print("AppRepository uri : $initialUri");
      final deepLinkModel = DeepLinkModel.fromUri(initialUri);
      return deepLinkModel;
    } on PlatformException {
      print("AppReposirotry");
      print('Failed to get initial link.');
      return Future.error('Failed to get initial link.');
    } on FormatException {
      print("AppReposirotry");
      print('Failed to parse the initial link as Uri.');
      return Future.error('Failed to parse the initial link as Uri.');
    } catch (e) {
      print("AppRepository");
      print(e.toString());
      return Future.error(e);
    }
  }
}
