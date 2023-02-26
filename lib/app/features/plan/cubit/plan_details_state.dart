part of 'plan_details_cubit.dart';

@freezed
class PlanDetailsState with _$PlanDetailsState {
  factory PlanDetailsState({
    @Default([]) List<PlanModel> results,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _PlanDetailsState;
}
