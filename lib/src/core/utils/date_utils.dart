import 'package:intl/intl.dart';

const dateStandardPattern = 'EEEE dd MMMM, HH:mm';

const dateStandardPatternWithYear = 'EEEE dd MMMM yyyy, HH:mm';

class DateFormatters {
  static DateFormat standard(String languageCode) =>
      DateFormat(dateStandardPattern, languageCode);

  static DateFormat standardWithYear(String languageCode) =>
      DateFormat(dateStandardPatternWithYear, languageCode);
}

extension DateTimeX on DateTime {
  String format(String languageCode) {
    if (this.year == DateTime.now().year) {
      return DateFormatters.standard(languageCode).format(this);
    }
    return DateFormatters.standardWithYear(languageCode).format(this);
  }
}
