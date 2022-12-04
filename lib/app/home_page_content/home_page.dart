import 'package:flutter/material.dart';
import 'package:moja_budowa/app/login_page_content/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Moja Budowa'),
        ),
        backgroundColor: const Color.fromARGB(235, 213, 228, 241),
        body: Center(
          child: (ListView(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Koszty Budowy'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Kalendarz'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Notatnik'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Planer Budowy'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Zdjęcia/Faktury/Załączniki/Umowy'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
              ),
            ],
          )),
        ));
  }
}
