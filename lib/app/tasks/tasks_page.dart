import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/tasks/add/add_task.dart';
import 'package:moja_budowa/app/tasks/cubit/tasks_cubit.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista do Zrobienia'),
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
        create: (context) => TasksCubit()..start(),
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

            final documents = state.documents;

            return ListView(
              children: [
                for (final document in documents) ...[
                  Dismissible(
                    key: ValueKey(document.id),
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
                      FirebaseFirestore.instance
                          .collection('tasks')
                          .doc(document.id)
                          .delete();
                    },
                    child: TaskWidget(
                      document['title'],
                    ),
                  ),
                ],
              ],
            );

            return StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Wystąpił nieoczekiwany problem');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Proszę czekać, trwa ładowanie danych');
                  }

                  final documents = snapshot.data!.docs;

                  return ListView(
                    children: [
                      for (final document in documents) ...[
                        Dismissible(
                          key: ValueKey(document.id),
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
                            FirebaseFirestore.instance
                                .collection('tasks')
                                .doc(document.id)
                                .delete();
                          },
                          child: TaskWidget(
                            document['title'],
                          ),
                        ),
                      ],
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      color: Colors.amber,
      child: Text(title),
    );
  }
}
