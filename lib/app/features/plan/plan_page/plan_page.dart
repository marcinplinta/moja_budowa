import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/features/plan/details_plan/pages/details_plan.dart';
import 'package:moja_budowa/app/features/plan/plan_page/cubit/plan_title_cubit.dart';
import 'package:moja_budowa/data/plan_title_remote_data_source.dart';
import 'package:moja_budowa/models/plan_title_model.dart';
import 'package:moja_budowa/repositories/plan_title_repository.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planer Budowy'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: BlocProvider<PlanTitleCubit>(
        create: (context) {
          return PlanTitleCubit(
            planTitleRepository: PlanTitleRepository(
              planTitleRemoteDataSource: PlanTitleRemoteDataSource(),
            ),
          )..start();
        },
        child: BlocBuilder<PlanTitleCubit, PlanTitleState>(
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
                return ListView(
                  children: [
                    for (final plan in state.results)
                      _ListPlanWidget(
                        model: plan,
                      ),
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _ListPlanWidget extends StatelessWidget {
  const _ListPlanWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PlanTitleModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailsPlanPage(plan: model),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: const Color.fromARGB(113, 7, 57, 221),
          child: Row(
            children: [
              Expanded(
                child: Text(model.title),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
