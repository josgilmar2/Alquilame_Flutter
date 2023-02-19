import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:alquilame/services/dwelling_service.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final UserResponse user;

  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions(BuildContext context, UserResponse user) =>
      <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome, ${user.fullName}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: const Text("Log out"),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
                },
              ),
              ElevatedButton(
                child: const Text("Check"),
                onPressed: () async {
                  print("Checked");
                  JwtAuthService service = getIt<JwtAuthService>();
                  await service.getCurrentUser();
                },
              )
            ],
          ),
        ),
        Scaffold(
          body: BlocProvider(
            create: (context) {
              final dwellingService = getIt<DwellingService>();
              return DwellingBloc(dwellingService)..add(DwellingFetched());
            },
            child: const DwellingList(),
          ),
        ),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Configuración',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alqulame"),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _widgetOptions(context, widget.user).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mi Perfil',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Viviendas',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Añadir',
              backgroundColor: Colors.black)
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
