import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';

part 'totem_scans_notifier.g.dart';

@riverpod
Future<List<TotemRow>> getScannedTotems(GetScannedTotemsRef ref) async {
  final list = (await ref.watch(getDatabaseProvider)).totemsDao.getScans();
  return list;
}
