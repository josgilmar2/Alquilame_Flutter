import 'package:alquilame/blocs/dwelling_detail/dwelling_detail.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DwellingDetailPage extends StatelessWidget {
  const DwellingDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final dwellingService = getIt<DwellingService>();
          return DwellingDetailBloc(dwellingService)
            ..add(DwellingDetailFetched(id));
        },
        child: const DwellingsDetail(),
      ),
    );
  }
}
