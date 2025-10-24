import 'package:wom_pocket/src/core/database/database.dart';

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
