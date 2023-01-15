import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String? email;
  // final credential =
  //     EmailAuthProvider.credential(email: email, password: password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${email ?? 'gość'}'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Wyloguj'))
            ],
          ),
        ),
      ),
    );
  }
}
