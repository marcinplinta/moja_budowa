import 'package:intl/intl.dart';

class CostModel {
  CostModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    // required this.amount,
  });

  final String id;
  final String title;
  final DateTime releaseDate;
  // final double amount;
  String daysLeft() {
    return releaseDate.difference(DateTime.now()).inDays.toString();
  }

  String releaseDateFormatted() {
    return DateFormat.yMMMEd().format(releaseDate);
  }
}
