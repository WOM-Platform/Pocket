import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:pocket/src/utils/config.dart';

import '../../constants.dart';
import '../my_logger.dart';

class DeepLinkModel extends Equatable {
  static const PAYMENT = 'payment';
  static const VOUCHERS = 'vouchers';

  final Uri? uri;
  String? otc;
  late TransactionType type;

  DeepLinkModel.fromUri(this.uri) {
    logger.i("DeepLinkModel constructor");
    if (uri != null) {
      logger.i(uri.toString());
      logger.i("scheme: " + uri!.scheme);
      logger.i("host: " + uri!.host);

      final scheme = uri!.scheme;
      final host = uri!.host;

      if (scheme == 'https' &&
          (host == '${flavor == Flavor.DEVELOPMENT ? 'dev.' : ''}wom.social' ||
              host ==
                  '${flavor == Flavor.DEVELOPMENT ? 'dev.' : ''}link.wom.social')) {
        final List<String> pathSegments = uri!.pathSegments;
        final transactionType = pathSegments[0].toLowerCase();

        switch (transactionType) {
          case PAYMENT:
            type = TransactionType.PAYMENT;
            break;
          case VOUCHERS:
            type = TransactionType.VOUCHERS;
            break;
          default:
            throw Exception("Type of transaction is NOT valid");
            break;
        }

        otc = pathSegments[1];
      } else if (scheme == 'wom' && (host == 'pay' || host == 'transfer')) {
        type = host == 'transfer'
            ? TransactionType.VOUCHERS
            : TransactionType.PAYMENT;
        otc = uri!.pathSegments.isEmpty ? null : uri!.pathSegments[0];
      } else {
        throw Exception("Scheme: $scheme OR host: $host not valid");
      }

      if (otc == null || otc!.isEmpty) {
        throw Exception("OTC is null or empty");
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
