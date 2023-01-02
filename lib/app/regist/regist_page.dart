import 'package:flutter/material.dart';
import 'package:moja_budowa/app/start/start_page.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rejestracja Konta'),
        ),
        backgroundColor: const Color.fromARGB(235, 213, 228, 241),
        body: Center(
          child: (Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/domek.jpg'),
                  width: 200,
                ),
              ),
              const SizedBox(height: 30),
              const Text('Zarejestruj się'),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'e-mail'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'hasło'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'potwierdź hasło'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Utwórz konto'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const StartPage(),
                    ),
                  );
                },
              ),
            ],
          )),
        ));
  }
}
