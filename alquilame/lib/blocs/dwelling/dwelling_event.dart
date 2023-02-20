import 'package:equatable/equatable.dart';

abstract class DwellingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DwellingFetched extends DwellingEvent {}

class DwellingRefresh extends DwellingEvent {}
