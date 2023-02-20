import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/plan/cubit/plan_details_cubit.dart';
import 'package:moja_budowa/app/features/plan/cubit/plan_details_state.dart';
import 'package:moja_budowa/data/plan_remote_data_source.dart';
import 'package:moja_budowa/models/plan_model.dart';
import 'package:moja_budowa/models/plan_title_model.dart';
import 'package:moja_budowa/repositories/plan_repository.dart';

class DetailsPlanPage extends StatelessWidget {
  const DetailsPlanPage({
    Key? key,
    required this.plan,
  }) : super(key: key);

  final PlanTitleModel plan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.title),
      ),
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),

      body: BlocProvider<PlanDetailsCubit>(
        create: (context) => PlanDetailsCubit(
          planRepository: PlanRepository(
            planRemoteDataSource: PlanRemoteDataSource(),
          ),
        )..fetchData(
            planId: plan.id,
          ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<PlanDetailsCubit, PlanDetailsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.initial:
                      return const Center(
                        child: Text('Initial state'),
                      );
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.success:
                      if (state.results.isEmpty) {
                        return const Center(
                          child: Text('Brak wynikow'),
                        );
                      }
                      return ListView(
                        children: [
                          for (final plan in state.results)
                            _PlanItemWidget(
                              model: plan,
                            ),
                        ],
                      );
                    case Status.error:
                      return Center(
                        child: Text(
                          state.errorMessage ?? 'Wystąpił nieoczekiwany błąd',
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanItemWidget extends StatelessWidget {
  const _PlanItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PlanModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(model.content),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
