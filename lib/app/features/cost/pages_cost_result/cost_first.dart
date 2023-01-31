import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/features/cost/cost_result/cubit/cost_result_first_cubit.dart';
import 'package:moja_budowa/app/features/cost/pages_add/add_first.dart';
import 'package:moja_budowa/models/cost_model.dart';
import 'package:moja_budowa/repositories/costs_repository.dart';

class CostFirst extends StatefulWidget {
  const CostFirst({
    Key? key,
  }) : super(key: key);

  @override
  State<CostFirst> createState() => _CostFirstState();
}

class _CostFirstState extends State<CostFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty dokumentacji'),
      ),
      body: const _CostPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddFirst(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}

class _CostPageBody extends StatelessWidget {
  const _CostPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CostResultFirstCubit(CostsRepository())..start(),
      child: BlocBuilder<CostResultFirstCubit, CostResultFirstState>(
        builder: (context, state) {
          final costModels = state.costs;
          if (costModels.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final costModel in costModels)
                Dismissible(
                  key: ValueKey(costModel.id),
                  background: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32.0),
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    // only from right to left
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context
                        .read<CostResultFirstCubit>()
                        .remove(documentID: costModel.id);
                  },
                  child: _ListViewCost(
                    costModel: costModel,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ListViewCost extends StatelessWidget {
  const _ListViewCost({
    Key? key,
    required this.costModel,
  }) : super(key: key);

  final CostModel costModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          costModel.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          costModel.releaseDateFormatted(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        costModel.daysLeft(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('pozostało dni'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
