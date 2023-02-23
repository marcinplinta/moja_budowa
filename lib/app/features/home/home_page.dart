import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/features/contract/contract_page.dart';
import 'package:moja_budowa/app/features/invoice/invoice_page.dart';
import 'package:moja_budowa/app/features/tasks/tasks_page.dart';
import 'package:moja_budowa/app/features/cost/cost_page.dart';
import 'package:moja_budowa/app/features/foto/foto_page.dart';

import 'package:moja_budowa/app/features/event/event_page.dart';
import 'package:moja_budowa/app/features/login/profile_page.dart';
import 'package:moja_budowa/app/features/plan/plan_page/plan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moja Budowa'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfilPage(
                    email: widget.user.email,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const TasksView();
        }

        if (currentIndex == 2) {
          return const CostView();
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: (ListView(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(60),
                margin: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                        style: GoogleFonts.kanit(fontSize: 20),
                        'dodaj zdjęcie domu')),
              ),
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
                child: const Text('Lista zadań'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const TasksPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Wydarzenia'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const EventPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Planer budowy'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PlanPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Zdjęcia'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const FotoPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const InvoicePage(),
                    ),
                  );
                },
                child: const Text('Faktury'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ContractPage(),
                    ),
                  );
                },
                child: const Text('Umowy'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      'suma kosztów'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      '0 zł'),
                ],
              )
            ],
          )),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: "Lista zadań",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "start",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "koszty",
          ),
        ],
      ),
    );
  }
}
