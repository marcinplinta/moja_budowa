import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moja_budowa/app/login/reset_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: SafeArea(
        child: Center(
          child: (Column(
            children: [
              const Image(
                image: AssetImage('images/domek.jpg'),
                width: 10,
              ),
              Text(
                'Moja budowa',
                style: GoogleFonts.kanit(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: widget.emailController,
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
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: widget.passwordController,
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
              Text(errorMessage),
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
                          isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj się',
                          style: GoogleFonts.kanit(
                              color: Colors.black, fontSize: 26),
                        ),
                        onPressed: () async {
                          if (isCreatingAccount == true) {
                            // register
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: widget.emailController.text,
                                password: widget.passwordController.text,
                              );
                            } catch (error) {
                              setState(() {
                                errorMessage = error.toString();
                              });
                            }
                          } else {
                            //logged
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: widget.emailController.text,
                                password: widget.passwordController.text,
                              );
                            } catch (error) {
                              setState(() {
                                errorMessage = error.toString();
                              });
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (isCreatingAccount == false) ...[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(223, 42, 92, 230),
                  ),
                  child: const Text(
                    'Nie masz konta? Zarejestruj się',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(223, 42, 92, 230),
                  ),
                  child: const Text(
                    'Masz już konto? Zaloguj się',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                ),
              ],
              if (isCreatingAccount == false) ...[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(223, 0, 0, 0),
                  ),
                  child: const Text(
                    'Zapomniałeś hasła? Zresetuj hasło',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
  }
}
