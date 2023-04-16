part of 'category_page_cubit.dart';

class CategoryPageState {
  final List<CategoryWithSum> categories;
  final String? errorMessage;
  final CategoryModel? categoryModel;
  final Status status;
  // final int sumAllExpenses;

  const CategoryPageState({
    this.categories = const [],
    this.errorMessage = '',
    this.categoryModel,
    this.status = Status.initial,
    // required this.sumAllExpenses,
  });
}

class CategoryWithSum {
  final CategoryModel categoryModel;
  final List<ExpensesModel> expenses;
  final int sumOfExpenses;

  CategoryWithSum({
    required this.categoryModel,
    required this.expenses,
    required this.sumOfExpenses,
  });
}
