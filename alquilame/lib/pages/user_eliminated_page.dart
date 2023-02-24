import 'package:alquilame/main.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:flutter/material.dart';

class UserEliminatedPage extends StatelessWidget {
  const UserEliminatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Perfil eliminado con éxito"),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Tu perfil se ha eliminado correctamente")));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
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
