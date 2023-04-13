import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

part 'category_page_state.dart';

class CategoryPageCubit extends Cubit<CategoryPageState> {
  CategoryPageCubit(this._categoryRepository)
      : super(const CategoryPageState());

  final CategoryRepository _categoryRepository;

  Future<void> start() async {
    emit(
      const CategoryPageState(
        status: Status.loading,
        categories: [],
      ),
    );
    try {
      final categories = await _categoryRepository.getCategories();
      final expenses = await _categoryRepository.getExpensesAll();
      final categoriesWithSum = categories.map(
        (categoryModel) {
          final expensesOfCategory = <ExpensesModel>[];
          return CategoryWithSum(
            categoryModel: categoryModel,
            expenses: expensesOfCategory,
          );
        },
      ).toList();
      emit(CategoryPageState(
          status: Status.success, categories: categoriesWithSum));
    } catch (error) {
      emit(CategoryPageState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> getCategoryWithID(
    String id,
    // int sum,
  ) async {
    emit(
      const CategoryPageState(
        status: Status.loading,
        categoryModel: null,
      ),
    );
    try {
      final categoryModel = await _categoryRepository.getCategory(id: id);
      // final sum = expenses.map((e) => e.amount).reduce((a, b) => a + b);
      emit(CategoryPageState(
          status: Status.success, categoryModel: categoryModel));
    } catch (error) {
      emit(CategoryPageState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
