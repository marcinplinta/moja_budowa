import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planer Budowy'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(5),
            color: Colors.amber,
            child: const Text('1. Przygotowanie dokumentacji'),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(5),
            color: Colors.amber,
            child: const Text('2. Prace Ziemne'),
          ),
        ],
      ),
    );
  }
}
