import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planer Budowy'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: ListView(
        children: const [
          ListPlanWidget('1. Przygotowanie dokumentacji'),
          ListPlanWidget('2. Prace Ziemnne'),
          ListPlanWidget('3. Fundament'),
          ListPlanWidget('4. Konstrukcja parteru'),
          ListPlanWidget('5. Konstrukcja piętra'),
          ListPlanWidget('6. Konstrukcja dachu'),
          ListPlanWidget('7. Stolarka okna, drzwi, brama'),
          ListPlanWidget('8. Instalacja elektryczna'),
          ListPlanWidget('9. Instalacja grzewcza'),
          ListPlanWidget('10. Instalacja hydrauliczne'),
          ListPlanWidget('11. Instalacja wentylacyjna'),
          ListPlanWidget('12. Wykończenia'),
        ],
      ),
    );
  }
}

class ListPlanWidget extends StatelessWidget {
  const ListPlanWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      color: Colors.amber,
      child: Text(title),
    );
  }
}
