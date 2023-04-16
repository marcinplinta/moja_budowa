import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

part 'category_page_state.dart';

class CategoryPageCubit extends Cubit<CategoryPageState> {
  CategoryPageCubit(this._categoryRepository) : super(const CategoryPageState(
            // sumAllExpenses: 0,
            ));

  final CategoryRepository _categoryRepository;

  Future<void> start() async {
    emit(
      const CategoryPageState(
        status: Status.loading,
        categories: [],
        // sumAllExpenses: 0,
      ),
    );
    try {
      final categories = await _categoryRepository.getCategories();
      final expenses = await _categoryRepository.getExpensesAll();

      // int sumAllExpenses = 0;

      // if (expenses.isNotEmpty) {
      //   sumAllExpenses = expenses.map((e) => e.amount).reduce((a, b) => a + b);
      // }

      final categoriesWithSum = categories.map(
        (categoryModel) {
          // final sumOfExpenses =
          //     expenses.map((e) => e.amount).reduce((a, b) => a + b);

          final expensesOfCategory = expenses
              .where((expenses) => expenses.categoryId == categoryModel.id)
              .toList();
          int sumOfExpenses = 0;
          if (expensesOfCategory.isNotEmpty) {
            sumOfExpenses =
                expensesOfCategory.map((e) => e.amount).reduce((a, b) => a + b);
          }

          return CategoryWithSum(
            categoryModel: categoryModel,
            expenses: expensesOfCategory,
            sumOfExpenses: sumOfExpenses,
          );
        },
      ).toList();
      emit(CategoryPageState(
        status: Status.success,
        categories: categoriesWithSum,
        // sumAllExpenses: sumAllExpenses,
      ));
    } catch (error) {
      emit(CategoryPageState(
        status: Status.error,
        errorMessage: error.toString(),
        // sumAllExpenses: 0,
      ));
    }
  }

  Future<void> getCategoryWithID(
    String id,
  ) async {
    emit(
      const CategoryPageState(
        status: Status.loading,
        categoryModel: null,
        // sumAllExpenses: 0,
      ),
    );
    try {
      final categoryModel = await _categoryRepository.getCategory(id: id);

      emit(CategoryPageState(
        status: Status.success,
        categoryModel: categoryModel,
        // sumAllExpenses: 0,
      ));
    } catch (error) {
      emit(CategoryPageState(
        status: Status.error,
        errorMessage: error.toString(),
        // sumAllExpenses: 0,
      ));
    }
  }
}
