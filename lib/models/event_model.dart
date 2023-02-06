import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    this.releaseTime,
  });

  final String id;
  final String title;
  final DateTime releaseDate;
  TimeOfDay? releaseTime;
  String daysLeft() {
    return releaseDate.difference(DateTime.now()).inDays.toString();
  }

  String releaseDateFormatted() {
    return DateFormat("dd.MM.yyyy    HH:mm").format(releaseDate);
  }
}
