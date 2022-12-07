import 'package:flutter/material.dart';

class CostPage extends StatelessWidget {
  const CostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty Budowy'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
