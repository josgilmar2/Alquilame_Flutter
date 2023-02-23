import 'package:alquilame/config/locator.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:alquilame/services/dwelling_service.dart';
import 'package:alquilame/widgets/dwelling_user_list_item.dart';
import 'package:alquilame/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class DwellingUserList extends StatefulWidget {
  const DwellingUserList({super.key});

  @override
  State<DwellingUserList> createState() => _DwellingUserListState();
}

class _DwellingUserListState extends State<DwellingUserList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DwellingBloc, DwellingState>(
      builder: (context, state) {
        switch (state.status) {
          case DwellingStatus.failure:
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('No tienes viviendas en tu propiedad'),
                ),
              ],
            );
          case DwellingStatus.success:
            if (state.dwellings.isEmpty) {
              return const Center(child: Text('no films'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.dwellings.length
                    ? const CircularProgressIndicator()
                    : DwellingUserListItem(
                        dwelling: state.dwellings[index],
                        dwellingBloc: DwellingBloc(getIt<DwellingService>()),
                      );
              },
              itemCount: state.hasReachedMax
                  ? state.dwellings.length
                  : state.dwellings.length + 1,
              controller: _scrollController,
            );
          case DwellingStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case DwellingStatus.delete:
            return const DwellingList();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<DwellingBloc>().add(DwellingUserFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
