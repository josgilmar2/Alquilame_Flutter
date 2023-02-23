import 'package:alquilame/blocs/blocs.dart';
import 'package:alquilame/blocs/user/user.dart';
import 'package:alquilame/config/locator.dart';
import 'package:alquilame/pages/pages.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupAsyncDependencies();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            final authService = getIt<JwtAuthService>();
            return AuthBloc(authService)..add(AppLoaded());
          },
        ),
        BlocProvider<UserBloc>(
          create: (context) {
            final userService = getIt<UserService>();
            return UserBloc(userService)..add(UserDelete());
          },
        )
      ],
      child: MyApp(),
    ),
  );
}

class GlobalContext {
  static late BuildContext ctx;
}

class MyApp extends StatelessWidget {
  static late MyApp _instance;

  static Route route() {
    print("Enrutando al login");
    return MaterialPageRoute<void>(builder: (context) {
      var authBloc = BlocProvider.of<AuthBloc>(context);
      authBloc..add(SessionExpiredEvent());
      return _instance;
    });
  }

  MyApp() {
    _instance = this;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          GlobalContext.ctx = context;
          if (state is AuthAuthenticated) {
            return HomePage(
              user: state.user,
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
