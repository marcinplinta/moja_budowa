import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moja_budowa/app/category/cubit/category_page_cubit.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/expenses/cubit/expenses_cubit.dart';

import 'package:moja_budowa/data/category_remote_data_source.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    required this.categoryId,
    // required this.categoryWithSum,
    Key? key,
  }) : super(key: key);

  final String categoryId;
  // final CategoryWithSum categoryWithSum;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExpensesCubit(CategoryRepository(CategoryRemoteDataSources()))
            ..getExpenses(categoryId),
      child: BlocConsumer<ExpensesCubit, ExpensesState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == Status.initial) {
            return const Center(
              child: Text('Initial state'),
            );
          }
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.success) {
            if (state.expenses.isEmpty) {
              return const SizedBox.shrink();
            }
          }
          final expensesModels = state.expenses;
          final formatter = NumberFormat("#,###.00", "pl_PL");
          final formattedSum = formatter.format(state.sum);
          return ListView(
            children: [
              Center(
                child: Text(
                  'sada',
                  // " suma ${categoryWithSum.sumOfExpenses.toString()} zł",
                  style: GoogleFonts.lora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              for (final expensesModel in expensesModels) ...[
                Dismissible(
                  key: ValueKey(expensesModel.id),
                  background: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 33, 18),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Icon(
                          Icons.delete_sweep,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context.read<ExpensesCubit>().remove(
                          documentID: expensesModel.id,
                        );
                  },
                  child: _ExpensesWidget(expensesmodel: expensesModel),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ExpensesWidget extends StatelessWidget {
  const _ExpensesWidget({
    Key? key,
    required this.expensesmodel,
  }) : super(key: key);

  final ExpensesModel? expensesmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(157, 33, 148, 168),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          expensesmodel!.title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          expensesmodel!.dateFormatted(),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(240, 211, 248, 3),
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            expensesmodel!.amountFormatted(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'zł',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
