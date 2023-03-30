import 'package:intl/intl.dart';

class ExpensesModel {
  ExpensesModel({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.categoryId,
  });

  final String id;
  final String title;
  final DateTime date;
  final int amount;
  final String categoryId;

  String dateFormatted() {
    return DateFormat("dd.MM.yyyy").format(date);
  }

  String amountFormatted() {
    return NumberFormat("#,###.00", "pl_PL").format(amount);
  }
}
