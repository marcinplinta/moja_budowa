part of 'plan_title_cubit.dart';

class PlanTitleState {
  PlanTitleState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<PlanTitleModel> results;
  final Status status;
  final String? errorMessage;
}
