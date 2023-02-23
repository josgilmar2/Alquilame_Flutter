import 'package:alquilame/models/models.dart';
import 'package:equatable/equatable.dart';

enum UserStatus { initial, success, failure, delete }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const <UserResponse>[],
    this.hasReachedMax = false,
  });

  final UserStatus status;
  final List<UserResponse> users;
  final bool hasReachedMax;

  UserState copyWith({
    UserStatus? status,
    List<UserResponse>? users,
    bool? hasReachedMax,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''UserState { status: $status, hasReachedMax: $hasReachedMax, users: ${users.length} }''';
  }

  @override
  List<Object> get props => [status, users, hasReachedMax];
}
