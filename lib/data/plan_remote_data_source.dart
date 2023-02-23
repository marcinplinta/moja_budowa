import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:retrofit/retrofit.dart';

part 'plan_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class PlanRemoteRetrofitDataSource {
  @factoryMethod
  factory PlanRemoteRetrofitDataSource(Dio dio) = _PlanRemoteRetrofitDataSource;

  @GET("/plan")
  Future<List<PlanModel>> getPlanData();
}
