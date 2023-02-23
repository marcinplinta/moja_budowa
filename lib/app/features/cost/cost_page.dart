import 'package:flutter/material.dart';
import 'package:moja_budowa/app/features/cost/pages_cost_result/cost_first.dart';

class CostPage extends StatelessWidget {
  const CostPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koszty Budowy'),
      ),
      body: const CostView(),
    );
  }
}

class CostView extends StatelessWidget {
  const CostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ListCostWidget('13. Inne'),
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const CostFirst()),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              color: Colors.cyan,
              child: Row(
                children: [
                  Text(
                    title,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white70,
            ),
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(15),
            child: const Text(' 1000 zł'),
          ),
        ],
      ),
    );
  }
}
