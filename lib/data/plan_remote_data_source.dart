import 'package:dio/dio.dart';

class PlanRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getPlanData(int planId) async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/marcinplinta/json-demo/plan');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
