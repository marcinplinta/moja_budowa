import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_budowa/app/cubit/root_cubit.dart';
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
      backgroundColor: const Color.fromARGB(235, 213, 228, 241),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocProvider(
          create: (context) => RootCubit(LoginRepository()),
          child: BlocBuilder<RootCubit, RootState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Jesteś zalogowany jako ${email ?? 'gość'}'),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<RootCubit>().singOut();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Wyloguj'))
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
