import 'package:flutter/material.dart';

class ResetPage extends StatelessWidget {
  ResetPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String? email;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: TextField(
                    controller: controller,
                    obscureText: true,
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
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    cursorColor: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Zresetuj hasło'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
