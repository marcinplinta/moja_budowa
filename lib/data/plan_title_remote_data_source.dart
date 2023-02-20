import 'package:dio/dio.dart';

class PlanTitleRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getPlanTitleData() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/marcinplinta/json-demo/plan_title');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
