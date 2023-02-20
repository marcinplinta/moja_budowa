import 'package:moja_budowa/data/plan_title_remote_data_source.dart';
import 'package:moja_budowa/models/plan_title_model.dart';

class PlanTitleRepository {
  PlanTitleRepository({required this.planTitleRemoteDataSource});

  final PlanTitleRemoteDataSource planTitleRemoteDataSource;

  Future<List<PlanTitleModel>> getPlanTitleModel() async {
    final json = await planTitleRemoteDataSource.getPlanTitleData();
    if (json == null) {
      return [];
    }
    return json.map((item) => PlanTitleModel.fromJson(item)).toList();
  }
}
