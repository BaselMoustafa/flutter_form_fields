import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  TimeOfDay get timeOfDay => TimeOfDay(
    hour: hour, minute: minute,
  );
}