import 'dart:async';

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
    // int sum,
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

      // final sum = expenses.map((e) => e.amount).reduce((a, b) => a + b);
      emit(
        ExpensesState(
          // sum: sum,
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

  // StreamSubscription? _streamSubscription;

  // Future<void> start() async {
  //   _streamSubscription =
  //       _categoryRepository.getExpensesStream(categoryId: '').listen(
  //     (expenses) {
  //       final sum = expenses.map((e) => e.amount).reduce((a, b) => a + b);
  //       emit(ExpensesState(expenses: expenses, sum: sum));
  //     },
  //   )..onError(
  //           (error) {
  //             emit(const ExpensesState(loadingErrorOccured: true));
  //           },
  //         );
  // }

  Future<void> remove({
    required String documentID,
    String? categoryId,
    // int? sum,
  }) async {
    try {
      await _categoryRepository.deleteExpenses(id: documentID);
    } catch (error) {
      emit(
        const ExpensesState(removingErrorOccured: true),
      );
      getExpenses(
        categoryId!,
        // sum!,
      );
    }
  }

  // @override
  // Future<void> close() {
  //   _streamSubscription?.cancel();
  //   return super.close();
  // }
}
