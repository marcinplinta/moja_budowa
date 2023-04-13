part of 'category_page_cubit.dart';

class CategoryPageState {
  final List<CategoryWithSum> categories;
  final String? errorMessage;
  final CategoryModel? categoryModel;
  final Status status;

  const CategoryPageState({
    this.categories = const [],
    this.errorMessage = '',
    this.categoryModel,
    this.status = Status.initial,
  });
}

class CategoryWithSum {
  final CategoryModel categoryModel;
  final List<ExpensesModel> expenses;

  CategoryWithSum({required this.categoryModel, required this.expenses});
}
