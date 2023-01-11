import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/models/transaction_model.dart';

extension WomRowX on WomRow {
  Voucher toVoucher() {
    return Voucher(
      id: id,
      secret: secret,
      latitude: latitude,
      longitude: longitude,
      aim: aim,
      timestamp: DateTime.fromMillisecondsSinceEpoch(addedOn),
    );
  }
}

extension MyTransactionX on MyTransaction {
  TransactionModel toModel() {
    return TransactionModel(
      id: id,
      type: TransactionType.values[type],
      source: source,
      aimCode: aim,
      date: DateTime.fromMillisecondsSinceEpoch(timestamp),
      size: size,
      pin: pin,
      link: link,
      importDeadline: deadline != null
          ? DateTime.fromMillisecondsSinceEpoch(deadline!)
          : null,
    );
  }
}
