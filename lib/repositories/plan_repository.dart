import 'package:moja_budowa/data/plan_remote_data_source.dart';
import 'package:moja_budowa/models/plan_model.dart';

class PlanRepository {
  PlanRepository({required this.planRemoteDataSource});

  final PlanRemoteDataSource planRemoteDataSource;

  Future<List<PlanModel>> getPlanForPlanID(int planId) async {
    final json = await planRemoteDataSource.getPlanData(planId);

    if (json == null) {
      return [];
    }
    return json.map((item) => PlanModel.fromJson(item)).toList();
  }
}
