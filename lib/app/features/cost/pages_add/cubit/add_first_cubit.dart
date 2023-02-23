import 'package:bloc/bloc.dart';
import 'package:moja_budowa/repositories/costs_repository.dart';

part 'add_first_state.dart';

class AddFirstCubit extends Cubit<AddFirstState> {
  AddFirstCubit(this._costsRepository) : super(const AddFirstState());

  final CostsRepository _costsRepository;

  Future<void> add(
    String title,
    DateTime date,
    int amount,
  ) async {
    try {
      await _costsRepository.add(title, date, amount);
      // throw Exception('Coś poszło nie tak');

      emit(const AddFirstState(saved: true));
    } catch (error) {
      emit(AddFirstState(errorMessage: error.toString()));
    }
  }
}
