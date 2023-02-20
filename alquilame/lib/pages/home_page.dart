import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/pages.dart';

import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final LoginResponse user;

  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.user.role == "PROPIETARIO") {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Alquilame"),
          backgroundColor: Colors.black87,
        ),
        body: _buildBody(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mi Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Viviendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Añadir',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Alquilame"),
          backgroundColor: Colors.black87,
        ),
        body: _buildBody(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mi Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Viviendas',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      );
    }
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome, ${widget.user.fullName}',
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
        );
      case 1:
        return BlocProvider(
          create: (context) {
            final dwellingService = getIt<DwellingService>();
            return DwellingBloc(dwellingService)..add(DwellingFetched());
          },
          child: const DwellingList(),
        );
      case 2:
        if (widget.user.role == "PROPIETARIO") {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Configuración',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Hola"),
          );
        }

      default:
        throw Exception('Invalid index: $index');
    }
  }
}
