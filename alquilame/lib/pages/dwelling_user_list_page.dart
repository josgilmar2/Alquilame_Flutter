import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/pages/dwelling_user_list.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DwellingUserListPage extends StatelessWidget {
  const DwellingUserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tus viviendas"),
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (context) {
          final dwellingService = getIt<DwellingService>();
          return DwellingBloc(dwellingService)..add(DwellingUserFetched());
        },
        child: const DwellingUserList(),
      ),
    );
  }
}
