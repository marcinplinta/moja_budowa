import 'package:flutter/material.dart';

class ListToDoPage extends StatelessWidget {
  const ListToDoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListToDoView();
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
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
