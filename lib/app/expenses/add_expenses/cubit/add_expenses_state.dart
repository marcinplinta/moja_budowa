part of 'add_expenses_cubit.dart';

class AddExpensesState {
  final String errorMessage;
  final bool saved;
  final List<CategoryModel> categories;
  final Status status;
  final CategoryModel? categoryModel;

  AddExpensesState(
      {this.status = Status.initial,
      this.errorMessage = '',
      this.saved = false,
      this.categories = const [],
      this.categoryModel});
}
