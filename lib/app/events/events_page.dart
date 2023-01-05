import 'package:flutter/material.dart';
import 'package:moja_budowa/app/plan/details_plan/details_first.dart';

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
        backgroundColor: const Color.fromARGB(235, 213, 228, 241),
        body: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const DetailsFirst()),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.all(100),
            color: Colors.cyan,
            child: const Text('test'),
          ),
        ));
  }
}
