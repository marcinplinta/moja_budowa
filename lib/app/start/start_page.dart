import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/home/home_page.dart';
import 'package:moja_budowa/app/login/login_page.dart';
import 'package:moja_budowa/app/regist/regist_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(235, 213, 228, 241),
        body: Center(
          child: (Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Moja Budowa',
                style: GoogleFonts.kanit(fontSize: 40),
              ),
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('images/domek.jpg'),
                width: 300,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('szybki start'),
              ),
              ElevatedButton(
                child: const Text('Zaczynamy'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                child:
                    const Text('lub utwórz konto i przechowuj dane na stałe'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RegistPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Zaloguj Się'),
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
