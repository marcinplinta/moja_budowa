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
      body: const CostView(),
    );
  }
}

class CostView extends StatelessWidget {
  const CostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Koszty'));
  }
}
