import 'package:flutter/material.dart';
import 'package:moja_budowa/app/home/home_page.dart';

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
            const Text('Zaloguj się'),
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
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Zaloguj Się'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
