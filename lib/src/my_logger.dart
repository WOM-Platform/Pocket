import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';

var logger = Logger(filter: ReleaseFilter());

logEvent(String event) {
  FirebaseAnalytics.instance.logEvent(name: event);
}


class ReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}