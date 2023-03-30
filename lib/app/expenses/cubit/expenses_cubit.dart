import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(this._categoryRepository) : super(const ExpensesState());

  final CategoryRepository _categoryRepository;

  Future<void> getExpenses(
    String categoryId,
  ) async {
    emit(
      const ExpensesState(
        status: Status.loading,
        expenses: [],
      ),
    );
    try {
      final results = await _categoryRepository.getExpenses(
        categoryId: categoryId,
      );
      emit(
        ExpensesState(
          status: Status.success,
          expenses: results,
        ),
      );
    } catch (error) {
      emit(
        ExpensesState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remove({
    required String documentID,
    String? categoryId,
  }) async {
    try {
      await _categoryRepository.deleteExpenses(id: documentID);
    } catch (error) {
      emit(
        const ExpensesState(removingErrorOccured: true),
      );
      getExpenses(categoryId!);
    }
  }
}
