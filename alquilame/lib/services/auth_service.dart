import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/login.dart';
import 'package:alquilame/models/user.dart';
import 'package:alquilame/repositories/auth_repository.dart';
import 'package:alquilame/repositories/user_repository.dart';
import 'package:alquilame/services/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class AuthService {
  Future<UserResponse?> getCurrentUser();
  Future<UserResponse> signInWithUsernameAndPassword(
      String username, String password);
  Future<void> signOut();
}

@Order(2)
@singleton
class JwtAuthService extends AuthService {
  late AuthRepository _authRepository;
  late LocalStorageService _localStorageService;
  late UserRepository _userRepository;

  JwtAuthService() {
    _authRepository = getIt<AuthRepository>();
    _userRepository = getIt<UserRepository>();
    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  @override
  Future<UserResponse?> getCurrentUser() async {
    print("get current user");
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      UserResponse response = await _userRepository.profile();
      return response;
    }
    return null;
  }

  @override
  Future<UserResponse> signInWithUsernameAndPassword(
      String username, String password) async {
    LoginResponse response = await _authRepository.doLogin(username, password);
    await _localStorageService.saveToDisk('user_token', response.token);
    return UserResponse.fromLoginResponse(response);
  }

  @override
  Future<void> signOut() async {
    print("borrando token");
    await _localStorageService.deleteFromDisk("user_token");
  }
}