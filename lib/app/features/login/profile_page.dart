import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/cubit/auth_cubit.dart';
import 'package:moja_budowa/repositories/login_repository.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profil użytkownika'),
      ),
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocProvider(
          create: (context) => AuthCubit(LoginRepository()),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Jesteś zalogowany jako ${email ?? 'gość'}',
                        style: GoogleFonts.kanit(
                            color: Colors.black, fontSize: 16)),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        fixedSize: const Size(180, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 162, 222, 240),
                      ),
                      onPressed: () {
                        context.read<AuthCubit>().singOut();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Wyloguj',
                        style: GoogleFonts.kanit(
                            color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
