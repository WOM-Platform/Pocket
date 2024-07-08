import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/application/aim_notifier.dart';
import 'package:wom_pocket/src/database/database.dart';

part 'totem_scans_notifier.g.dart';

@riverpod
Future<Map<int, List<TotemRow>>> getScannedTotems(
    GetScannedTotemsRef ref) async {
  final list =
      await (await ref.watch(getDatabaseProvider)).totemsDao.getScans();

  final t = <int, List<TotemRow>>{};
  for (int i = 0; i < list.length; i++) {
    final o = list[i];
    final s = o.sessionId;
    final p = o.providerId;
    final e = o.eventId;
    final h = hash('$p$s$e');
    if (t.containsKey(h)) {
      t[h] = [...t[h] ?? [], o];
    } else {
      t[h] = [o];
    }
  }
  return t;
}

class AggregatedTotem {
  final List<TotemRow> totems;
  final String providerName;
  final String providerId;
  final String sessionName;
  final String sessionId;

  AggregatedTotem({
    required this.totems,
    required this.providerName,
    required this.providerId,
    required this.sessionName,
    required this.sessionId,
  });
}
