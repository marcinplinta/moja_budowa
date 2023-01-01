import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moja_budowa/app/start/start_page.dart';

class RootPageContent extends StatelessWidget {
  const RootPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user == null) {
            return const StartPage();
          }
          return TestPage(user: user);
        });
  }
}

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Jesteś zalogowany jako ${user.email}'),
      ),
    );
  }
}
