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
  // int daysLeft() {
  //   return releaseDate.difference(DateTime.now()).inDays + 1;
  // }

  String releaseDateFormatted() {
    return DateFormat("dd.MM.yyyy    HH:mm").format(releaseDate);
  }

  // String daysLeft() {
  //   final difference = releaseDate.difference(DateTime.now());

  //   if (difference.isNegative) {
  //     return '0 dni';
  //   }
  //   final days = difference.inDays;
  //   final hours = difference.inHours - days * 24;
  //   final minutes = difference.inMinutes - days * 24 * 60 - hours * 60;

  //   if (days > 0) {
  //     return '$days dni';
  //   } else if (hours > 0) {
  //     return '$hours godz. ';
  //   } else {
  //     return '$minutes min.';
  //   }

  String daysLeft() {
    final difference = releaseDate.difference(DateTime.now());
    final isNegative = difference.isNegative;

    final days = difference.inDays.abs();
    final hours = difference.inHours.abs() - days * 24;
    final minutes = difference.inMinutes.abs() - days * 24 * 60 - hours * 60;

    if (isNegative) {
      if (days > 0) {
        return '-$days dni';
      } else if (hours > 0) {
        return '-$hours godz. ';
      } else {
        return '-$minutes min.';
      }
    } else {
      if (days > 0) {
        return '$days dni';
      } else if (hours > 0) {
        return '$hours godz. ';
      } else {
        return '$minutes min.';
      }
    }
  }
}
