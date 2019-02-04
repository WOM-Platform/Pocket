class DeepLinkModel {
  final Uri uri;
  String otc;
  TransactionType type;

  DeepLinkModel.fromUri(this.uri){
    print("DeepLinkModel constructor");
    if (uri != null) {
      print(uri.toString());
      final List<String> pathSegments = uri?.pathSegments;
      final transactionType = pathSegments[0]?.toLowerCase();

      switch (transactionType) {
        case 'payment':
          type = TransactionType.PAYMENT;
          break;
        case 'vouchers':
          type = TransactionType.VOUCHERS;
          break;
        default:
          throw Exception("Type of transaction is NOT valid");
          break;
      }

      final tmpOtc = pathSegments[1];
      if (tmpOtc != null && tmpOtc.isNotEmpty) {
        otc = pathSegments[1];
      } else {
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

enum TransactionType { PAYMENT, VOUCHERS }
