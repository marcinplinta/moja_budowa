import 'package:flutter/material.dart';
import 'package:moja_budowa/app/events/add_events.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wydarzenia'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddEvent(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
