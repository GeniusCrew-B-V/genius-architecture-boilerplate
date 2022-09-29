import 'package:date_format/date_format.dart';

extension DateTimeExt on DateTime {
  String get ddmmyyyy => formatDate(this, [dd, "/", mm, "/", yyyy]);

  String get ddmmyyyhhnn =>
      formatDate(this, [dd, "/", mm, "/", yyyy, " ", hh, ":", nn]);

  String get dFormat => formatDate(this, [d]);

  String get dayName => formatDate(this, [D], locale: ItalianDateLocale());

  bool isSameDay(DateTime date) {
    return date.day == this.day &&
        date.month == this.month &&
        date.year == this.year;
  }
}

extension DateTimeListExt on List<DateTime> {
  bool containsDate(DateTime date) {
    for (int i = 0; i < this.length; i++) {
      if (date.isSameDay(this[i])) {
        return true;
      }
    }
    return false;
  }
}
