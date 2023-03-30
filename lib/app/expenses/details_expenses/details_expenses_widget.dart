import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/expenses/details_expenses/cubit/details_expenses_cubit.dart';
import 'package:moja_budowa/data/category_remote_data_source.dart';

import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DetalisExpensesWidget extends StatelessWidget {
  const DetalisExpensesWidget({
    this.expensesModel,
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;
  final ExpensesModel? expensesModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsExpensesCubit(CategoryRepository(CategoryRemoteDataSources()))
            ..getExpensesWithID(id),
      child: BlocConsumer<DetailsExpensesCubit, DetailsExpensesState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
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
            if (state.expensesModel == null) {
              return const SizedBox.shrink();
            }
          }
          final expensesModel = state.expensesModel;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: NewGradientAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 56, 55, 55),
                ),
              ),
              gradient:
                  const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
              title: Row(
                children: [
                  Text(
                    expensesModel!.dateFormatted(),
                    style: GoogleFonts.gruppo(
                        color: const Color.fromARGB(255, 56, 55, 55),
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                ],
              ),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      expensesModel.amountFormatted(),
                      style: GoogleFonts.gruppo(
                          color: const Color.fromARGB(255, 56, 55, 55),
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                  ),
                ),
                WorkTasks(
                  expensesModel: expensesModel,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WorkTasks extends StatelessWidget {
  const WorkTasks({
    required this.expensesModel,
    Key? key,
  }) : super(key: key);
  final ExpensesModel expensesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            expensesModel.title,
          ),
        ),
      ),
    );
  }
}
