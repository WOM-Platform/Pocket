import 'dart:convert';
import 'dart:io';

import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:wom_pocket/app.dart';
import 'package:wom_pocket/src/db/app_db.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/services/aim_repository.dart';
import 'package:uni_links/uni_links.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
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

  Future<AppStatus> getAppStatus() async {
    final platform = Platform.operatingSystem.toLowerCase();
    final version = (await PackageInfo.fromPlatform()).version;
    // final version = '0.2.2';
    final url = 'https://$domain/api/v1/version-check?platform=$platform&currentVersion=$version';
    final response = await http.post(Uri.parse(
        url));
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return AppStatus.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    }
    logger.e('$url ${response.statusCode}');
    return AppStatus.outOfService();
  }
}

class AppStatus {
  final AppStatusEnum status;
  final String? latestVersion;

  AppStatus(this.status, this.latestVersion);

  factory AppStatus.outOfService() =>
      AppStatus(AppStatusEnum.outOfService, null);

  factory AppStatus.fromJson(Map<String, dynamic> map) {
    return AppStatus(
      enumFromString(map['status'], AppStatusEnum.values),
      map['latestVersion'],
    );
  }

  bool get isOk => status == AppStatusEnum.ok;
  bool get isOutOfService => status == AppStatusEnum.outOfService;
  bool get isCanUpdate => status == AppStatusEnum.shouldUpdate;
  bool get isMustUpdate => status == AppStatusEnum.mustUpdate;

  @override
  String toString() {
    return '$status $latestVersion';
  }
}

enum AppStatusEnum { ok, shouldUpdate, mustUpdate, outOfService }

String enumToString(Object o) => o.toString().split('.').last;

T enumFromString<T extends Object>(String key, List<T> values) => values
    .firstWhere((v) => key.toLowerCase() == enumToString(v).toLowerCase());
