import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';

import '../../constants.dart';
import '../my_logger.dart';

final protocol = isDev ? 'wom-dev' : 'wom';
final oldDeepLink = isDev ? 'dev.wom.social' : 'wom.social';
final deepLink = isDev ? 'link.dev.wom.social' : 'link.wom.social';

class DeepLinkModel extends Equatable {
  static const PAYMENT = 'payment';
  static const VOUCHERS = 'vouchers';
  static const MIGRATION = 'migration';

  final Uri? uri;
  String? otc;
  String? migrationPartialKey;
  late TransactionType type;

  DeepLinkModel.fromUri(this.uri) {
    logger.i("DeepLinkModel constructor");
    if (uri != null) {
      logger.i(uri.toString());
      logger.i("scheme: " + uri!.scheme);
      logger.i("host: " + uri!.host);

      final scheme = uri!.scheme;
      final host = uri!.host;

      if (scheme == 'https' && (host == oldDeepLink || host == deepLink)) {
        final List<String> pathSegments = uri!.pathSegments;
        final transactionType = pathSegments[0].toLowerCase();

        switch (transactionType) {
          case PAYMENT:
            type = TransactionType.PAYMENT;
            break;
          case VOUCHERS:
            type = TransactionType.VOUCHERS;
            break;
          case MIGRATION:
            type = TransactionType.MIGRATION;
            migrationPartialKey =
                uri!.pathSegments.length > 1 ? null : uri!.pathSegments[2];
            break;
          default:
            throw Exception("Type of transaction is NOT valid");
        }

        otc = pathSegments[1];
      } else if (scheme == protocol &&
          (host == 'pay' || host == 'transfer' || host == 'migration')) {
        type = host == 'transfer'
            ? TransactionType.VOUCHERS
            : host == 'pay'
                ? TransactionType.PAYMENT
                : TransactionType.MIGRATION;
        otc = uri!.pathSegments.isEmpty ? null : uri!.pathSegments[0];
        migrationPartialKey =
            uri!.pathSegments.isEmpty ? null : uri!.pathSegments[1];
      } else {
        throw Exception("Scheme: $scheme OR host: $host not valid");
      }

      if (otc == null || otc!.isEmpty) {
        throw Exception("OTC is null or empty");
      }
      if (type == TransactionType.MIGRATION &&
          (migrationPartialKey == null || migrationPartialKey!.isEmpty)) {
        throw Exception("migrationPartialKey is null or empty");
      }
    } else {
      throw Exception("URI is null");
    }
  }

  @override
  String toString() {
    return "link: " + uri.toString();
  }

  @override
  List<Object?> get props => [uri];
}
