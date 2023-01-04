import 'package:flutter/material.dart';

class ListToDoPage extends StatelessWidget {
  const ListToDoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(
        title: const Text('Lista do Zrobienia'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
