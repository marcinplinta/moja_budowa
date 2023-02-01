import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/features/tasks/cubit/tasks_cubit.dart';
import 'package:moja_budowa/repositories/tasks_repository.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(TasksRepository()),
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Wystąpił nieoczekiwany problem: ${state.errorMessage}',
              ),
            );
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dodaj czynność'),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<TasksCubit>().add(
                          title: controller.text,
                        );
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller,
                    minLines: 1,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'dodaj czynność',
                        hintText: 'kupić klej'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
