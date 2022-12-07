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
    );
  }
}
