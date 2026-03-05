import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/exceptions/deep_link_exceptions.dart';
import 'package:wom_pocket/src/core/my_logger.dart';

final protocol = isDev ? 'wom-dev' : 'wom';
final oldDeepLink = isDev ? 'dev.wom.social' : 'wom.social';
final deepLink = isDev ? 'link.dev.wom.social' : 'link.wom.social';

class DeepLinkModel extends Equatable {
  static const String PAYMENT = 'payment';
  static const String VOUCHERS = 'vouchers';
  static const String MIGRATION = 'migration';

  final Uri? uri;
  String? otc;
  String? migrationPartialKey;
  late final TransactionType type;

  DeepLinkModel.fromUri(this.uri) {
    logger.i('DeepLinkModel constructor');
    Sentry.addBreadcrumb(Breadcrumb(message: 'DeepLinkModel.fromUri: $uri'));

    try {
      if (uri != null) {
        logger.i(uri.toString());
        logger.i('scheme: ' + uri!.scheme);
        logger.i('host: ' + uri!.host);

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
              type = TransactionType.MIGRATION_IMPORT;
              migrationPartialKey = uri!.pathSegments.length > 2
                  ? uri!.pathSegments[2]
                  : null;
              break;
            default:
              throw InvalidTransactionTypeException(transactionType, uri: uri?.toString());
          }

          otc = pathSegments[1];
        } else if (scheme == protocol &&
            (host == 'pay' || host == 'transfer' || host == 'migration')) {
          type = host == 'transfer'
              ? TransactionType.VOUCHERS
              : host == 'pay'
              ? TransactionType.PAYMENT
              : TransactionType.MIGRATION_IMPORT;
          otc = uri!.pathSegments.isEmpty ? null : uri!.pathSegments[0];
          migrationPartialKey = uri!.pathSegments.length < 2
              ? null
              : uri!.pathSegments[1];
        } else if (scheme != 'https' && scheme != protocol) {
          throw InvalidSchemeException(scheme, uri: uri?.toString());
        } else {
          throw InvalidHostException(host, uri: uri?.toString());
        }

        if (otc == null || otc!.isEmpty) {
          throw MissingOtcException(uri: uri?.toString());
        }
        if (type == TransactionType.MIGRATION_IMPORT &&
            (migrationPartialKey == null || migrationPartialKey!.isEmpty)) {
          throw MissingMigrationKeyException(uri: uri?.toString());
        }
      } else {
        throw InvalidUriException(uri: uri?.toString());
      }
    } on PlatformException catch (ex, st) {
      logger.e('DeepLink.fromUri - PlatformException', error: ex, stackTrace: st);
      throw DeepLinkPlatformException(ex.message ?? 'Unknown platform error', uri: uri?.toString());
    } catch (ex, st) {
      logger.e('DeepLink.fromUri', error: ex, stackTrace: st);
      rethrow;
    }
  }

  @override
  String toString() {
    return 'link: ' + uri.toString();
  }

  @override
  List<Object?> get props => [uri];
}
