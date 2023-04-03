import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

part 'add_expenses_state.dart';

class AddExpensesCubit extends Cubit<AddExpensesState> {
  AddExpensesCubit(this._categoryRepository) : super(AddExpensesState());
  final CategoryRepository _categoryRepository;

  Future<void> fetch() async {
    emit(
      AddExpensesState(
        status: Status.loading,
        categories: [],
      ),
    );
    try {
      final categories = await _categoryRepository.getCategories();
      emit(
        AddExpensesState(
          status: Status.success,
          categories: categories
              .map((doc) => CategoryModel(id: doc.id, title: doc.title))
              .toList(),
        ),
      );
    } catch (error) {
      emit(AddExpensesState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  // Future<void> fetch2(String id) async {
  //   emit(
  //     AddExpensesState(
  //       status: Status.loading,
  //       categoryModel: null,
  //     ),
  //   );
  //   try {
  //     final categoryModel = await _categoryRepository.getCategory(id: id);
  //     emit(AddExpensesState(
  //         status: Status.success, categoryModel: categoryModel));
  //   } catch (error) {
  //     emit(AddExpensesState(
  //       status: Status.error,
  //       errorMessage: error.toString(),
  //     ));
  //   }
  // }

  Future<void> add(
    String title,
    DateTime date,
    int amount,
    String categoryId,
  ) async {
    try {
      await _categoryRepository.addExpenses(
        title,
        date,
        amount,
        categoryId,
      );
      // throw Exception('Coś poszło nie tak');

      emit(AddExpensesState(saved: true));
    } catch (error) {
      emit(AddExpensesState(errorMessage: error.toString()));
    }
  }
}
