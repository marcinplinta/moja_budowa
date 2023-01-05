import 'package:flutter/material.dart';
import 'package:moja_budowa/app/list_to_do/add/add_task.dart';

class ListToDoPage extends StatelessWidget {
  const ListToDoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista do Zrobienia'),
      ),
      body: const ListToDoView(),
    );
  }
}

class ListToDoView extends StatelessWidget {
  const ListToDoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTask(),
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
