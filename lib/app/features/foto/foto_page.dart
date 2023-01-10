import 'package:flutter/material.dart';

class FotoPage extends StatelessWidget {
  const FotoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zdjęcia'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
    );
  }
}
