import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DwellingsDetail extends StatefulWidget {
  const DwellingsDetail({super.key});

  @override
  State<DwellingsDetail> createState() => _DwellingsDetailState();
}

class _DwellingsDetailState extends State<DwellingsDetail> {
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
            return DwellingDetailItem(dwellingDetail: state.dwellingDetail);
          case DwellingDetailStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
