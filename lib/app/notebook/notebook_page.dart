import 'package:flutter/material.dart';

class NotebookPage extends StatelessWidget {
  const NotebookPage({
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
