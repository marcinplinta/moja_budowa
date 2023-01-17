import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/cubit/root_cubit.dart';

import 'package:moja_budowa/app/features/login/login_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

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
                  onPressed: () {
                    context.read<RootCubit>().signInAn();
                  },
                ),
                const SizedBox(height: 270),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fixedSize: const Size(200, 50),
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
              ],
            )),
          ),
        ),
      ),
    );
  }
}
