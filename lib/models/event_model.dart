import 'package:intl/intl.dart';

class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.releaseDate,
  });

  final String id;
  final String title;
  final DateTime releaseDate;
  String daysLeft() {
    return releaseDate.difference(DateTime.now()).inDays.toString();
  }

  String releaseDateFormatted() {
    return DateFormat.yMMMEd().format(releaseDate);
  }
}
