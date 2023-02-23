import 'package:bloc/bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/plan_title_model.dart';
import 'package:moja_budowa/repositories/plan_title_repository.dart';

part 'plan_title_state.dart';

class PlanTitleCubit extends Cubit<PlanTitleState> {
  PlanTitleCubit({required this.planTitleRepository}) : super(PlanTitleState());

  final PlanTitleRepository planTitleRepository;

  Future<void> start() async {
    emit(
      PlanTitleState(
        status: Status.loading,
      ),
    );

    try {
      final results = await planTitleRepository.getPlanTitleModel();
      emit(
        PlanTitleState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        PlanTitleState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
