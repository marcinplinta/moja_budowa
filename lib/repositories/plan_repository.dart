import 'package:injectable/injectable.dart';
import 'package:moja_budowa/data/plan_remote_data_source.dart';
import 'package:moja_budowa/models/plan_model.dart';

@injectable
class PlanRepository {
  PlanRepository({required this.planRemoteDataSource});

  final PlanRemoteRetrofitDataSource planRemoteDataSource;

  Future<List<PlanModel>> getPlanForPlanID(int planId) async {
    final allPlans = await planRemoteDataSource.getPlanData();

    // if (json == null) {
    //   return [];
    // }
    // final allPlans = json.map((item) => PlanModel.fromJson(item)).toList();
    return allPlans.where((plan) => plan.planId == planId).toList();
  }
}
