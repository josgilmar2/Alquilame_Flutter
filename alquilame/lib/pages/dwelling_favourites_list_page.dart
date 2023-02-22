import 'package:alquilame/blocs/dwelling_favourite/dwelling_favourite.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/pages/dwelling_favourites_list.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DwellingFavouritesListPage extends StatelessWidget {
  const DwellingFavouritesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tus favoritas"),
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (context) {
          final userService = getIt<UserService>();
          return DwellingFavouritesBloc(userService)
            ..add(DwellingFavouritesFetched());
        },
        child: const DwellingFavouritesList(),
      ),
    );
  }
}
