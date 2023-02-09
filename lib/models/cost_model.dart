import 'package:intl/intl.dart';

class CostModel {
  CostModel({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
  });

  final String id;
  final String title;
  final DateTime date;
  final int amount;

  String dateFormatted() {
    return DateFormat("dd.MM.yyyy").format(date);
  }
}
