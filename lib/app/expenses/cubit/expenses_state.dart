part of 'expenses_cubit.dart';

class ExpensesState {
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
  final List<ExpensesModel> expenses;
  final Status status;
  final String? errorMessage;

  const ExpensesState({
    this.expenses = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
    this.status = Status.initial,
    this.errorMessage = '',
  });
}
