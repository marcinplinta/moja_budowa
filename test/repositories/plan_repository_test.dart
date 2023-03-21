import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_budowa/data/plan_remote_data_source.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';

class MockPlanDataSource extends Mock implements PlanRemoteRetrofitDataSource {}

void main() {
  late PlanRepository sut;
  late MockPlanDataSource dataSource;

  setUp(() {
    dataSource = MockPlanDataSource();
    sut = PlanRepository(planRemoteDataSource: dataSource);
  });
  group('getPlanForPlanID', () {
    test('should call planRemoteDataSource.getPlanData() method', () async {
      //1
      when(() => dataSource.getPlanData()).thenAnswer(
        (_) async => [],
      );
      //2
      // ignore: unused_local_variable
      final results = await sut.getPlanForPlanID(111);

      //3
      verify(() => dataSource.getPlanData()).called(1);
    });

    test('should filter data source results with provider plan id', () async {
      //1
      when(() => dataSource.getPlanData()).thenAnswer(
        (_) async => [
          PlanModel(1, 111, 'content1', 'title1'),
          PlanModel(2, 111, 'content2', 'title2'),
          PlanModel(3, 111, 'content3', 'title3')
        ],
      );
      //2
      final results = await sut.getPlanForPlanID(111);
      //3
      expect(
        results,
        [
          PlanModel(1, 111, 'content1', 'title1'),
          PlanModel(2, 111, 'content2', 'title2'),
          PlanModel(3, 111, 'content3', 'title3')
        ],
      );
    });
  });
}
