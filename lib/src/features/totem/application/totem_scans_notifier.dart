import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/database/database.dart';

part 'totem_scans_notifier.g.dart';

@riverpod
Stream<Map<int, List<TotemRow>>> getScannedTotems(Ref ref) async* {
  final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();

  await for (final list in stream) {
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
    yield t;
  }
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
