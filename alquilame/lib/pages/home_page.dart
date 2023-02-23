import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/blocs/create_dwelling/create_dwelling_bloc.dart';
import 'package:alquilame/blocs/user/user_bloc.dart';
import 'package:alquilame/blocs/user/user_event.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/pages/create_dwelling_page.dart';
import 'package:alquilame/pages/dwelling_favourites_list_page.dart';
import 'package:alquilame/pages/dwelling_user_list_page.dart';
import 'package:alquilame/pages/edit_password_page.dart';
import 'package:alquilame/pages/edit_profile_page.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:alquilame/pages/register_page.dart';
import 'package:alquilame/pages/user_eliminated_page.dart';
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
                      child: Image.network(widget.user.avatar == null
                          ? "https://simulacionymedicina.es/wp-content/uploads/2015/11/default-avatar-300x300-1.jpg"
                          : "http://localhost:8080/download/${widget.user.avatar}"),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                            ));
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
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DwellingFavouritesListPage(),
                            ));
                      }),
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
                      title: "Editar Contraseña",
                      iconData: Icons.fingerprint,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPasswordPage(),
                            ));
                      }),
                  ProfileList(
                    title: "Logout",
                    iconData: Icons.logout,
                    onPress: () async {
                      BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
                    },
                    textColor: Colors.red,
                  ),
                  ProfileList(
                    title: "Eliminar perfil",
                    iconData: Icons.delete_forever_outlined,
                    onPress: () async {
                      BlocProvider.of<UserBloc>(context).add(UserDelete());
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
          return Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreateDwellingPage(),
                ));
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black87)),
              child: const Text("Ir al formulario de registro"),
            ),
          );
        } else {
          return const Center(
            child: Text(
                "No puedes acceder al formulario de registro porque te registraste como inquilino."),
          );
        }
      default:
        throw Exception('Invalid index: $index');
    }
  }
}
