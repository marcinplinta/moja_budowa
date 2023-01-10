import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/home/home_page.dart';

import 'package:moja_budowa/app/login/login_page.dart';

class StartPage extends StatefulWidget {
  StartPage({
    Key? key,
  }) : super(key: key);
  final userCredential = FirebaseAuth.instance.signInAnonymously();

  @override
  State<StartPage> createState() => _StartPageState();
}

var errorMessage = '';

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/domek.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: (Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  'Moja Budowa',
                  style: GoogleFonts.kanit(fontSize: 40),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fixedSize: const Size(200, 50),
                    backgroundColor: const Color.fromARGB(255, 162, 222, 240),
                  ),
                  child: Text(
                    "Kontynuuj jako gość",
                    style: GoogleFonts.kanit(color: Colors.black, fontSize: 18),
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInAnonymously();
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }

                    print("Signed in with temporary account.");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 250),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fixedSize: const Size(180, 40),
                    backgroundColor: const Color.fromARGB(255, 162, 222, 240),
                  ),
                  child: Text(
                    "Zaloguj się",
                    style: GoogleFonts.kanit(color: Colors.black, fontSize: 26),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => LoginPage(),
                      ),
                    );
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(223, 14, 13, 13),
                  ),
                  child: const Text(
                    'Nie masz konta? Zarejestruj się',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => LoginPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 120),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
