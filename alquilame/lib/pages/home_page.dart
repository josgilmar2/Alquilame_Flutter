import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/dwelling_user_list_page.dart';
import 'package:alquilame/pages/pages.dart';
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
        return Scaffold(
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
                      child: Image.network(
                          "http://localhost:8080/download/${widget.user.avatar}"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${widget.user.fullName}",
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text("${widget.user.email}",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        //Petición editar sin contraseña
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Editar mi perfil",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileList(
                      title: "Ver mis favoritas",
                      iconData: Icons.favorite,
                      onPress: () {}),
                  ProfileList(
                      title: "Ver mis viviendas",
                      iconData: Icons.home,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DwellingUserListPage(),
                            ));
                      }),
                  ProfileList(
                    title: "Logout",
                    iconData: Icons.logout,
                    onPress: () async {
                      BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
                    },
                    textColor: Colors.red,
                  )
                ],
              ),
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
