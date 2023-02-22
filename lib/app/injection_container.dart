import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moja_budowa/app/features/plan/cubit/plan_details_cubit.dart';
import 'package:moja_budowa/data/plan_remote_data_source.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
//Bloc
  getIt.registerFactory(() => PlanDetailsCubit(planRepository: getIt()));

//Repositories
  getIt.registerFactory(() => PlanRepository(planRemoteDataSource: getIt()));

//DataSources
  getIt.registerFactory(() => PlanRemoteRetrofitDataSource(Dio()));
}
