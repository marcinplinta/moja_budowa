import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/features/tasks/add/add_task.dart';
import 'package:moja_budowa/app/features/tasks/cubit/tasks_cubit.dart';
import 'package:moja_budowa/models/task_model.dart';
import 'package:moja_budowa/repositories/tasks_repository.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista zadań'),
      ),
      body: const TasksView(),
    );
  }
}

class TasksView extends StatelessWidget {
  const TasksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTask(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: BlocProvider(
        create: (context) => TasksCubit(TasksRepository())..start(),
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            final docs = state.tasks;

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

            return ListView(
              children: [
                for (final doc in docs) ...[
                  Dismissible(
                    key: ValueKey(doc.id),
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
                    onDismissed: (_) {
                      (direction) {
                        direction == (DismissDirection.startToEnd);
                      };
                      context.read<TasksCubit>().remove(id: doc.id);
                    },
                    child: TaskWidget(
                      taskModel: TaskModel(
                        id: doc.id,
                        title: doc.title,
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(3),
      color: Colors.amber,
      child: Text(
        taskModel.title,
      ),
    );
  }
}
