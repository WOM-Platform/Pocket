import 'package:equatable/equatable.dart';
import 'package:wom_pocket/src/core/database/database.dart';

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
