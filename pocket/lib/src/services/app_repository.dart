import 'package:pocket/src/models/deep_link_model.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

class AppRepository {


  getAims()async{
    return await Future.delayed(Duration(seconds: 2));
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
