import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserFetched extends UserEvent {}

class UserDelete extends UserEvent {}
