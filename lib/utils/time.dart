import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Time {
  Time._();

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      return DateFormat.jm().format(date);
    } catch (e) {
      return '12:00 pm';
    }
  }
}
