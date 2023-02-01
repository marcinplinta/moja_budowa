part of 'cost_result_first_cubit.dart';

class CostResultFirstState {
  const CostResultFirstState({
    this.costs = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<CostModel> costs;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
