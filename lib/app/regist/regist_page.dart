import 'package:flutter/material.dart';

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
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/domek.jpg'),
                  width: 200,
                ),
              ),
              SizedBox(height: 30),
              Text('Zarejestruj się'),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'e-mail'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'hasło'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'potwierdź hasło'),
                ),
              ),
              SizedBox(height: 20),
            ],
          )),
        ));
  }
}
