import 'package:flutter/material.dart';

class AddFirst extends StatelessWidget {
  const AddFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty dokumentacji'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const TextField(
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'dodaj usługę lub materiał',
                  hintText: 'projekt domu'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'podaj kwotę',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(' wybierz datę'),
            )
          ],
        ),
      ),
    );
  }
}
