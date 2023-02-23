import 'package:alquilame/pages/pages.dart';
import 'package:flutter/material.dart';

class UserEliminatedPage extends StatelessWidget {
  const UserEliminatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black87)),
          child: const Text("Volver al login"),
        ),
      ),
    );
  }
}
