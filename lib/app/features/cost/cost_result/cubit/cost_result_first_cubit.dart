import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_budowa/models/cost_model.dart';
import 'package:moja_budowa/repositories/costs_repository.dart';

part 'cost_result_first_state.dart';

class CostResultFirstCubit extends Cubit<CostResultFirstState> {
  CostResultFirstCubit(this._costsRepository)
      : super(const CostResultFirstState());

  final CostsRepository _costsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _costsRepository.getCostsStream().listen(
      (costs) {
        emit(CostResultFirstState(costs: costs));
      },
    )..onError(
        (error) {
          emit(const CostResultFirstState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _costsRepository.delete(id: documentID);
    } catch (error) {
      emit(
        const CostResultFirstState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
