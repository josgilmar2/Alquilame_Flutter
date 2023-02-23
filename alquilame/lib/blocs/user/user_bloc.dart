import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/blocs/user/user_event.dart';
import 'package:alquilame/blocs/user/user_state.dart';
import 'package:alquilame/services/services.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);
int page = -1;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(UserService userService)
      : assert(userService != null),
        _userService = userService,
        super(const UserState()) {
    //on<UserFetched>(_onUserFetched);
    on<UserDelete>(_onUserDelete);
  }

  Future<void> _onUserDelete(
      UserDelete event, Emitter<UserState> emitter) async {
    try {
      await _userService.deleteProfile();
      return emitter(state.copyWith(status: UserStatus.delete));
    } catch (e) {
      emitter(state.copyWith(status: UserStatus.failure));
    }
  }
}
