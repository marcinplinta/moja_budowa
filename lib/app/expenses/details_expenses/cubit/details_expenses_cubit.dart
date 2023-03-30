import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

part 'details_expenses_state.dart';

class DetailsExpensesCubit extends Cubit<DetailsExpensesState> {
  DetailsExpensesCubit(this._categoryRepository)
      : super(DetailsExpensesState());
  final CategoryRepository _categoryRepository;
  Future<void> getExpensesWithID(String id) async {
    emit(
      DetailsExpensesState(status: Status.loading, expensesModel: null),
    );
    try {
      final expensesModel =
          await _categoryRepository.getDetalisExpenses(id: id);
      emit(DetailsExpensesState(
          status: Status.success, expensesModel: expensesModel));
    } catch (error) {
      emit(
        DetailsExpensesState(
          status: Status.error,
          errorMessage: error.toString(),
          expensesModel: null,
        ),
      );
    }
  }
}
