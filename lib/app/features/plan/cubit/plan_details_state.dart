import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/models/plan_model.dart';

class PlanDetailsState {
  const PlanDetailsState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<PlanModel> results;
  final Status status;
  final String? errorMessage;
}
