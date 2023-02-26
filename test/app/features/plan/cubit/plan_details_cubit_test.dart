import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/plan/cubit/plan_details_cubit.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';

class MockPlanRepository extends Mock implements PlanRepository {}

void main() {
  late PlanDetailsCubit sut;
  late MockPlanRepository repository;

  setUp(() {
    repository = MockPlanRepository();
    sut = PlanDetailsCubit(planRepository: repository);
  });

  group('fetchData', () {
    group('success', () {
      setUp(() {
        when(() => repository.getPlanForPlanID(111)).thenAnswer(
          (_) async => [
            PlanModel(1, 111, "content1", "title1"),
            PlanModel(2, 111, "content2", "title2"),
            PlanModel(3, 111, "content3", "title3"),
          ],
        );
      });

      blocTest<PlanDetailsCubit, PlanDetailsState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.fetchData(planId: 111),
        expect: () => [
          PlanDetailsState(
            status: Status.loading,
          ),
          PlanDetailsState(
            status: Status.success,
            results: [
              PlanModel(1, 111, "content1", "title1"),
              PlanModel(2, 111, "content2", "title2"),
              PlanModel(3, 111, "content3", "title3"),
            ],
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getPlanForPlanID(111))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<PlanDetailsCubit, PlanDetailsState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.fetchData(planId: 111),
        expect: () => [
          PlanDetailsState(
            status: Status.loading,
          ),
          PlanDetailsState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
