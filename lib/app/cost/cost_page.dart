import 'package:flutter/material.dart';

class CostPage extends StatelessWidget {
  const CostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CostView();
  }
}

class CostView extends StatelessWidget {
  const CostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty Budowy'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: ListView(
        children: const [
          ListCostWidget('1. Przygotowanie dokumentacji'),
          ListCostWidget('2. Prace Ziemnne'),
          ListCostWidget('3. Fundament'),
          ListCostWidget('4. Konstrukcja parteru'),
          ListCostWidget('5. Konstrukcja piętra'),
          ListCostWidget('6. Konstrukcja dachu'),
          ListCostWidget('7. Stolarka okna, drzwi, brama'),
          ListCostWidget('8. Instalacja elektryczna'),
          ListCostWidget('9. Instalacja grzewcza'),
          ListCostWidget('10. Instalacja hydrauliczne'),
          ListCostWidget('11. Instalacja wentylacyjna'),
          ListCostWidget('12. Wykończenia'),
        ],
      ),
    );
  }
}

class ListCostWidget extends StatelessWidget {
  const ListCostWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        color: Colors.cyan,
        child: Text(
          title,
        ));
  }
}
