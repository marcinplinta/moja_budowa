import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/plan/cubit/plan_details_state.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit({required this.planRepository})
      : super(const PlanDetailsState());

  final PlanRepository planRepository;

  Future<void> fetchData({required int planId}) async {
    emit(
      const PlanDetailsState(
        status: Status.loading,
      ),
    );

    try {
      final results = await planRepository.getPlanForPlanID(planId);
      emit(
        PlanDetailsState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        PlanDetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
