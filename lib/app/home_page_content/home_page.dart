import 'package:flutter/material.dart';
import 'package:moja_budowa/app/callendary_page/callendary_page.dart';
import 'package:moja_budowa/app/cost_page/cost_page.dart';
import 'package:moja_budowa/app/foto_page/foto_page.dart';

import 'package:moja_budowa/app/notebook_page/notebook_page.dart';
import 'package:moja_budowa/app/plan_page/plan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moja Budowa'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: (ListView(
        children: [
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('Koszty Budowy'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CostPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Kalendarz'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CallendaryPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Notatnik'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const NotebookPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Planer Budowy'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PlanPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Zdjęcia/Faktury/Załączniki/Umowy'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FotoPage(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
