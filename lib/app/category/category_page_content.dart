import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/category/cubit/category_page_cubit.dart';
import 'package:moja_budowa/app/core/enums.dart';
import 'package:moja_budowa/app/widgets/category_widget.dart';
import 'package:moja_budowa/data/category_remote_data_source.dart';
import 'package:moja_budowa/repositories/category_repository.dart';

class CategoryPageContent extends StatelessWidget {
  const CategoryPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryPageCubit(CategoryRepository(CategoryRemoteDataSources()))
            ..start(),
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
            if (state.categories.isEmpty) {
              return const SizedBox.shrink();
            }
          }
          final categoryModels = state.categories;
          return Scaffold(
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),
            appBar: AppBar(
              title: const Text('Koszty'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(3),
              child: ListView(
                children: [
                  for (final categoryModel in categoryModels) ...[
                    CategoryWidget(categoryModel: categoryModel),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}