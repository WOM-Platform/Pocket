import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/features/totem/application/search_state.dart';

// part 'totem_scans_notifier.g.dart';

// @riverpod
// Stream<List<TotemRow>> getScannedTotems(Ref ref) async* {
//   final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();
//
//   await for (final list in stream) {
//     yield list;
//   }
// }

final getScannedTotemsProvider = StreamNotifierProvider(
  ScannedTotemsNotifier.new,
);

final class ScannedTotemsNotifier extends StreamNotifier {
  @override
  Stream build() async* {
    final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();

    await for (final list in stream) {
      yield list;
    }
  }
}

// @riverpod
// Stream<Map<int, List<TotemRow>>> getEventTotems(Ref ref) async* {
//   final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();
//
//   await for (final list in stream) {
//     final t = <int, List<TotemRow>>{};
//     for (int i = 0; i < list.length; i++) {
//       final o = list[i];
//       final sessionId = o.sessionId;
//       final providerId = o.providerId;
//       final eventId = o.eventId;
//       final h = hash('$providerId$sessionId$eventId');
//       if (eventId != myContactsEventId) {
//         if (t.containsKey(h)) {
//           t[h] = [...t[h] ?? [], o];
//         } else {
//           t[h] = [o];
//         }
//       }
//     }
//     yield t;
//   }
// }

final getEventTotemsProvider = StreamNotifierProvider(EventTotemsNotifier.new);

final class EventTotemsNotifier extends StreamNotifier {
  @override
  Stream build() async* {
    final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();

    await for (final list in stream) {
      final t = <int, List<TotemRow>>{};
      for (int i = 0; i < list.length; i++) {
        final o = list[i];
        final sessionId = o.sessionId;
        final providerId = o.providerId;
        final eventId = o.eventId;
        final h = hash('$providerId$sessionId$eventId');
        if (eventId != myContactsEventId) {
          if (t.containsKey(h)) {
            t[h] = [...t[h] ?? [], o];
          } else {
            t[h] = [o];
          }
        }
      }
      yield t;
    }
  }
}

// @riverpod
// Stream<List<TotemRow>> getMyContactTotems(Ref ref) async* {
//   final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();
//
//   await for (final list in stream) {
//     final t = <TotemRow>[];
//     for (int i = 0; i < list.length; i++) {
//       final totemRow = list[i];
//
//       final providerId = totemRow.providerId;
//       final eventId = totemRow.eventId;
//       if (providerId == digitProviderId && eventId == myContactsEventId) {
//         t.add(totemRow);
//       }
//     }
//     yield t;
//   }
// }

final getMyContactTotemsProvider = StreamNotifierProvider(
  MyContactTotemsNotifier.new,
);

final class MyContactTotemsNotifier extends StreamNotifier<List<TotemRow>> {
  @override
  Stream<List<TotemRow>> build() async* {
    final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();

    await for (final list in stream) {
      final t = <TotemRow>[];
      for (int i = 0; i < list.length; i++) {
        final totemRow = list[i];

        final providerId = totemRow.providerId;
        final eventId = totemRow.eventId;
        if (providerId == digitProviderId && eventId == myContactsEventId) {
          t.add(totemRow);
        }
      }
      yield t;
    }
  }
}

final totemSearchNotifierProvider = NotifierProvider(TotemSearchNotifier.new);

// @riverpod
class TotemSearchNotifier extends Notifier<SearchState> {
  SearchState build() {
    final list = ref.watch(getScannedTotemsProvider).value ?? [];
    return SearchState(
      list: list,
      query: '',
      filtered: list,
      showMyContacts: true,
      showMyEvents: true,
    );
  }

  void search(String query) {
    var filtered = state.list.toList();
    if (query.length > 3) {
      filtered = filtered.where((item) {
        if (item.providerName != null &&
            item.providerName!.toLowerCase().contains(query)) {
          return true;
        }
        if (item.totemName != null &&
            item.totemName!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.eventName != null &&
            item.eventName!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.email != null && item.email!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.phoneNumber != null &&
            item.phoneNumber!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.notes != null && item.notes!.toLowerCase().contains(query)) {
          return true;
        }

        return false;
      }).toList();
    }

    if (!state.showMyContacts) {
      filtered.removeWhere((totem) => totem.eventId == myContactsEventId);
    }

    if (!state.showMyEvents) {
      filtered.removeWhere((totem) => totem.eventId != myContactsEventId);
    }

    state = SearchState(
      list: state.list,
      query: query,
      filtered: filtered,
      showMyContacts: state.showMyContacts,
      showMyEvents: state.showMyEvents,
    );
  }

  toggleMyContacts() {
    state = SearchState(
      list: state.list,
      query: state.query,
      filtered: state.filtered,
      showMyContacts: !state.showMyContacts,
      showMyEvents: state.showMyEvents,
    );
    search(state.query);
  }

  toggleMyEvents() {
    state = SearchState(
      list: state.list,
      query: state.query,
      filtered: state.filtered,
      showMyContacts: state.showMyContacts,
      showMyEvents: !state.showMyEvents,
    );
    search(state.query);
  }
}
