import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

String convertDateFormat(DateTime dateTime) {
  return formatDate(DateTime(dateTime.year, dateTime.month, dateTime.day),
      [yyyy, '-', mm, '-', dd]);
}

String convertTimeFormat(DateTime dateTime) {
  return formatDate(
      DateTime(1999, 1, 1, dateTime.hour, dateTime.minute), [hh, ':', mm]);
}

String convertTimeOfDayFormat(TimeOfDay time) {
  return time.hour.toString() + ':' + time.minute.toString() + ':00';
}

String convertDateTimeFormat(DateTime dateTime) {
  return formatDate(
      DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
          dateTime.minute),
      [yyyy, '-', mm, '-', dd, " ", hh, ':', mm]);
}

String convertDateTimeFormatMonthName(DateTime dateTime) {
  return formatDate(
      DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
          dateTime.minute),
      [M, ' ', dd, " ", hh, ':', mm],
      locale: EnglishDateLocale());
}

String getDayFromDateTime(DateTime dateTime) {
  return formatDate(
      DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
          dateTime.minute),
      [dd]);
}

DateTime convertTimeOfDayToDateTime(TimeOfDay time) {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
      time.hour, time.minute);
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));



