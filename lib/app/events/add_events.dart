import 'package:flutter/material.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj wydarzenie'),
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
                  labelText: 'nazwa wydarzenia',
                  hintText: 'przyjazd koparki'),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('wybierz datę'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
