import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/cubit/auth_cubit.dart';
import 'package:moja_budowa/app/features/login/reset_password.dart';
import 'package:moja_budowa/repositories/login_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(LoginRepository()),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(235, 213, 228, 241),
            body: SafeArea(
              child: Center(
                child: (ListView(
                  children: [
                    const Image(
                      image: AssetImage('images/domek.jpg'),
                      width: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Moja budowa',
                          style: GoogleFonts.kanit(fontSize: 25),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          hintText: 'e-mail',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              hintText: 'hasło',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          cursorColor: Colors.black),
                    ),
                    Text(state.errorMessage),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                fixedSize: const Size(180, 40),
                                backgroundColor:
                                    const Color.fromARGB(255, 162, 222, 240),
                              ),
                              child: Text(
                                state.isCreatingAccount == true
                                    ? 'Zarejestruj się'
                                    : 'Zaloguj się',
                                style: GoogleFonts.kanit(
                                    color: Colors.black, fontSize: 26),
                              ),
                              onPressed: () async {
                                if (state.isCreatingAccount == true) {
                                  await context.read<AuthCubit>().register(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                  Navigator.of(context).pop();
                                } else {
                                  await context.read<AuthCubit>().signIn(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.isCreatingAccount == false) ...[
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(223, 42, 92, 230),
                        ),
                        child: const Text(
                          'Nie masz konta? Zarejestruj się',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        onPressed: () {
                          context.read<AuthCubit>().creatingAccount();
                        },
                      ),
                    ],
                    if (state.isCreatingAccount == true) ...[
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(223, 42, 92, 230),
                        ),
                        child: const Text(
                          'Masz już konto? Zaloguj się',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        onPressed: () {
                          context.read<AuthCubit>().notCreatingAccount();
                        },
                      ),
                    ],
                    if (state.isCreatingAccount == false) ...[
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: const Color.fromARGB(223, 0, 0, 0),
                        ),
                        child: const Text(
                          'Zapomniałeś hasła? Zresetuj hasło',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ResetPage(
                                email: '',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
