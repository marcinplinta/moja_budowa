import 'package:flutter/material.dart';

class CallendaryPage extends StatelessWidget {
  const CallendaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalendarz'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
