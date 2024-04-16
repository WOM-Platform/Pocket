import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';

late Logger logger;

logEvent(String event) {
  FirebaseAnalytics.instance.logEvent(name: event);
}

class ReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return false;
  }
}

String devOutput = '';

class DevOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    print('---------');
    event.lines.forEach(print);
    event.lines.forEach((v) {
      devOutput += '\n$v';
    });
  }
}
