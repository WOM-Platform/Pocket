import 'package:dart_wom_connector/dart_wom_connector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/services/transaction_repository.dart';

part 'pos_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<PhysicalPOS> getPos(GetPosRef ref, String posID) async {
  return ref.watch(pocketProvider).getPos(posID);
}
