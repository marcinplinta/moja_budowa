part of 'details_expenses_cubit.dart';

class DetailsExpensesState {
  final ExpensesModel? expensesModel;
  final Status status;
  final String errorMessage;

  final bool removingErrorOccured;

  DetailsExpensesState({
    this.removingErrorOccured = false,
    this.expensesModel,
    this.status = Status.initial,
    this.errorMessage = '',
  });
}
