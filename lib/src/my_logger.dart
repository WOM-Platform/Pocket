import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';

var logger = Logger();

logEvent(String event) {
  FirebaseAnalytics.instance.logEvent(name: event);
}
