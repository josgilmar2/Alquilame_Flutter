import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DwellingOwnerDetail extends StatelessWidget {
  const DwellingOwnerDetail({super.key, required this.dwelling});

  final OneDwellingResponse? dwelling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Propietario"),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(dwelling?.owner?.avatar == null
                      ? "https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg"
                      : "http://localhost:8080/download/${dwelling?.owner?.avatar}"),
                ),
              ),
              const SizedBox(height: 10),
              Text("${dwelling?.owner?.fullName}",
                  style: Theme.of(context).textTheme.headlineMedium),
              Text("${dwelling?.owner?.email}",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(7)),
                    Column(
                      children: [
                        Text(
                          "${dwelling?.owner?.numPublications}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text(
                          "Viviendas publicadas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(7)),
                    Column(
                      children: [
                        Text(
                          "${dwelling?.owner?.phoneNumber}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text(
                          "Nº Teléfono",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(7)),
                    Column(
                      children: [
                        Text(
                          "${dwelling?.owner?.username}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text(
                          "Nombre de usuario",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
