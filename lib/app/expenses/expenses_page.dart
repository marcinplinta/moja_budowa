import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/category/cubit/category_page_cubit.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/expenses/add_expenses/add_expenses_page.dart';
import 'package:moja_budowa/app/widgets/expenses_widget.dart';
import 'package:moja_budowa/data/category_remote_data_source.dart';
import 'package:moja_budowa/models/category_model.dart';
import 'package:moja_budowa/models/expenses_model.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({
    required this.id,
    this.categoryModel,
    this.expensesmodel,
    Key? key,
  }) : super(key: key);
  final CategoryModel? categoryModel;
  final String id;
  final ExpensesModel? expensesmodel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryPageCubit(CategoryRepository(CategoryRemoteDataSources()))
            ..getCategoryWithID(id),
      child: BlocConsumer<CategoryPageCubit, CategoryPageState>(
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
            if (state.categoryModel == null) {
              return const SizedBox.shrink();
            }
          }
          final categoryModel = state.categoryModel;

          return Scaffold(
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),
            appBar: AppBar(
              title: Text(
                categoryModel!.title,
              ),
            ),
            body: ExpensesWidget(
              categoryId: categoryModel.id,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddExpensesPage(
                      categoryId: categoryModel.id,
                      categoryModel: categoryModel,
                    ),
                    fullscreenDialog: true,
                  ),
                );
                context.read<CategoryPageCubit>().getCategoryWithID(id);
              },
              child: const Icon(Icons.edit),
            ),
          );
        },
      ),
    );
  }
}
