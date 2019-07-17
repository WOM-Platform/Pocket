import 'package:wom_package/wom_package.dart' show Config, Flavor,TransactionType;

class DeepLinkModel {
  static const PAYMENT = 'payment';
  static const VOUCHERS = 'vouchers';

  final Uri uri;
  String otc;
  TransactionType type;

  DeepLinkModel.fromUri(this.uri) {
    print("DeepLinkModel constructor");
    if (uri != null) {
      print(uri.toString());
      print("scheme: " + uri.scheme);
      print("host: " + uri.host);

      final scheme = uri.scheme;
      final host = uri.host;

      if (scheme == 'https' &&
          host ==
              '${Config.appFlavor == Flavor.DEVELOPMENT ? 'dev.' : ''}wom.social') {
        final List<String> pathSegments = uri.pathSegments;
        final transactionType = pathSegments[0]?.toLowerCase();

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
        otc = uri.pathSegments.isEmpty ? null : uri.pathSegments[0];
      } else {
        throw Exception("Scheme: $scheme OR host: $host not valid");
      }

      if (otc == null || otc.isEmpty) {
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
}
