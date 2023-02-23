import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/services/dwelling_service.dart';
import 'package:alquilame/widgets/dwelling_user_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DwellingUserDetailsPage extends StatelessWidget {
  const DwellingUserDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final dwellingService = getIt<DwellingService>();
        return DwellingDetailBloc(dwellingService)
          ..add(DwellingDetailFetched(id));
      },
      child: const DwellingUserDetails(),
    );
  }
}

class DwellingUserDetails extends StatefulWidget {
  const DwellingUserDetails({super.key});

  @override
  State<DwellingUserDetails> createState() => _DwellingUserDetailsState();
}

class _DwellingUserDetailsState extends State<DwellingUserDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DwellingDetailBloc, DwellingDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case DwellingDetailStatus.failure:
            return const Center(
              child: Text('Failed to fech the dwelling details'),
            );
          case DwellingDetailStatus.success:
            return DwellingOwnerDetail(dwelling: state.dwellingDetail);
          case DwellingDetailStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
