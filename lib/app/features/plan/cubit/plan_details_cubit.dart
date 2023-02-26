import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_details_state.dart';
part 'plan_details_cubit.freezed.dart';

@injectable
class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit({required this.planRepository}) : super(PlanDetailsState());

  final PlanRepository planRepository;

  Future<void> fetchData({required int planId}) async {
    emit(
      PlanDetailsState(
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
