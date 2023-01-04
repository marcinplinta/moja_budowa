import 'package:flutter/material.dart';

class CostPage extends StatelessWidget {
  const CostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CostView();
  }
}

class CostView extends StatelessWidget {
  const CostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
