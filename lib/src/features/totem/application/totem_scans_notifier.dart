import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/database/database.dart';

part 'totem_scans_notifier.g.dart';

@riverpod
Stream<List<TotemRow>> getScannedTotems(Ref ref) async* {
  final stream = ref.watch(getDatabaseProvider).totemsDao.getScansStream();

  await for (final list in stream) {
    yield list;
  }
}

@riverpod
Stream<Map<int, List<TotemRow>>> getEventTotems(Ref ref) async* {
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

@riverpod
Stream<List<TotemRow>> getMyContactTotems(Ref ref) async* {
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

class SearchState extends Equatable {
  final List<TotemRow> list;
  final String query;
  final List<TotemRow> filtered;
  final bool showMyEvents;
  final bool showMyContacts;

  SearchState({
    required this.list,
    required this.query,
    required this.filtered,
    required this.showMyContacts,
    required this.showMyEvents,
  });

  @override
  List<Object?> get props => [
        list,
        query,
        filtered,
        showMyContacts,
        showMyEvents,
      ];
}

@riverpod
class TotemSearchNotifier extends _$TotemSearchNotifier {
  @override
  SearchState build() {
    final list = ref.watch(getScannedTotemsProvider).valueOrNull ?? [];
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
        if (item.providerName != null && item.providerName!.toLowerCase().contains(query)) {
          return true;
        }
        if (item.totemName != null && item.totemName!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.eventName != null && item.eventName!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.email != null && item.email!.toLowerCase().contains(query)) {
          return true;
        }

        if (item.phoneNumber != null && item.phoneNumber!.toLowerCase().contains(query)) {
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
