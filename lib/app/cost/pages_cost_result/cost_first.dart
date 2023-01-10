import 'package:flutter/material.dart';
import 'package:moja_budowa/app/cost/pages_add/add_first.dart';

class CostFirst extends StatelessWidget {
  const CostFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty dokumentacji'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddFirst(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            Text('koszt1'),
          ],
        ),
      ),
    );
  }
}
