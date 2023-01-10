import 'package:flutter/material.dart';

class DetailsFirst extends StatelessWidget {
  const DetailsFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan i sposób przygotowania się'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            Text('data1'),
          ],
        ),
      ),
    );
  }
}
