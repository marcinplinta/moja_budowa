import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/home/home_page.dart';
import 'package:moja_budowa/app/regist/regist_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logowanie'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: (Column(
            children: [
              const Image(
                image: AssetImage('images/domek.jpg'),
                width: 30,
              ),
              const SizedBox(height: 30),
              Text(
                'Moja budowa',
                style: GoogleFonts.kanit(fontSize: 25),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    hintText: 'E-mail',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          hintText: 'Hasło',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      cursorColor: Colors.black)),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(223, 42, 92, 230),
                ),
                child: const Text(
                  'Nie masz konta? Zarejestruj się',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RegistPage(),
                    ),
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
