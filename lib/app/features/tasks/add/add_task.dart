import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj czynność'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              FirebaseFirestore.instance.collection('tasks').add(
                {
                  'title': controller.text,
                },
              );
            },
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
            TextField(
              controller: controller,
              minLines: 1,
              maxLines: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'dodaj czynność',
                  hintText: 'kupić klej'),
            ),
          ],
        ),
      ),
    );
  }
}
