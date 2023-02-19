import 'package:alquilame/blocs/auth/auth.dart';
import 'package:alquilame/rest/rest.dart';
import 'package:alquilame/services/services.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(AuthService authService)
      : assert(authService != null),
        _authService = authService,
        super(AuthInitial()) {
    on<AppLoaded>(_onAppLoaded);
    on<UserLoggedIn>(_onUserLoggedIn);
    on<UserLoggedOut>(_onUserLoggedOut);
    on<SessionExpiredEvent>(_onSessionExpired);
  }

  _onAppLoaded(AppLoaded event, Emitter<AuthState> emitter) async {
    emitter(AuthLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final currentUser = await _authService.getCurrentUser();

      if (currentUser != null) {
        emitter(AuthAuthenticated(user: currentUser));
      } else {
        emitter(AuthNotAuthenticated());
      }
    } on UnauthorizedException catch (e) {
      print(e);
      emitter(AuthNotAuthenticated());
    } on Exception catch (e) {
      emitter(AuthFailure(message: 'Ha ocurrido un error; ${e.toString()}'));
    }
  }

  _onUserLoggedIn(UserLoggedIn event, Emitter<AuthState> emitter) async {
    emitter(AuthAuthenticated(user: event.user));
  }

  _onUserLoggedOut(UserLoggedOut event, Emitter<AuthState> emitter) async {
    await _authService.signOut();
    emitter(AuthNotAuthenticated());
  }

  _onSessionExpired(
      SessionExpiredEvent event, Emitter<AuthState> emitter) async {
    print("Sesión expirada");
    await _authService.signOut();
    emitter(SessionExpiredState());
  }
}
