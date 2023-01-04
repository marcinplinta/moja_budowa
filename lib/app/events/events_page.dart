import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notatnik'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
