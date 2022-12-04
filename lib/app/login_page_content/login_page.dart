import 'package:flutter/material.dart';

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
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/domek.jpg'),
                  width: 300,
                ),
              ),
              SizedBox(height: 30),
              Text('Zaloguj się'),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'e-mail'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'hasło'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}
