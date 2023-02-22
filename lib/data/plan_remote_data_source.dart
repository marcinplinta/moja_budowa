import 'package:dio/dio.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:retrofit/retrofit.dart';

part 'plan_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://my-json-server.typicode.com/marcinplinta/json-demo')
abstract class PlanRemoteRetrofitDataSource {
  factory PlanRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _PlanRemoteRetrofitDataSource;

  @GET("/plan")
  Future<List<PlanModel>> getPlanData();
}

// class PlanRemoteDataSource {
//   Future<List<Map<String, dynamic>>?> getPlanData(int planId) async {
//     final response = await Dio().get<List<dynamic>>(
//         'https://my-json-server.typicode.com/marcinplinta/json-demo/plan');
//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }

//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }
