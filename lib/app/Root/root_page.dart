// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:moja_budowa/app/features/home/home_page.dart';
// import 'package:moja_budowa/app/features/login/login_page.dart';

// class RootPage extends StatelessWidget {
//   const RootPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           final user = snapshot.data;
//           if (user == null) {
//             return LoginPage();
//           }
//           return
//               // Scaffold(
//               //     body:
//               //         Center(child: Text('Jesteś zalogowany jako ${user.email}')));
//               HomePage(user: user);
//         });
//   }
// }
