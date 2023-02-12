import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:alquilame/services/services.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/repos/repos.dart';

abstract class AuthenticationService {
  Future<User?> getCurrentUser();
  Future<User?> signInWithUsernameAndPassword(String username, String password);
  Future<void> signOut();
}

class JwtAuthenticationService extends AuthenticationService {
  late AuthRepo _authRepo;
  late LocalStorageService _localStorageService;

  JwtAuthenticationService() {
    _authRepo = GetIt.I.get<AuthRepo>();
    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  @override
  Future<User?> getCurrentUser() async {
    String? loggedUser = _localStorageService.getFromDisk("user");
    if (loggedUser != null) {
      var user = LoginResponse.fromJson(jsonDecode(loggedUser));
      return User(
          username: user.username ?? "",
          email: user.email ?? "",
          fullName: user.fullName ?? "",
          accessToken: user.token ?? "",
          avatar: user.avatar ?? "",
          phoneNumber: user.phoneNumber ?? "",
          address: user.address ?? "");
    }
    return null;
  }

  @override
  Future<User> signInWithUsernameAndPassword(
      String username, String password) async {
    LoginResponse response = await _authRepo.login(username, password);
    await _localStorageService.saveToDisk(
        'user', jsonEncode(response.toJson()));
    return User(
        username: response.username ?? "",
        email: response.email ?? "",
        fullName: response.fullName ?? "",
        accessToken: response.token ?? "",
        avatar: response.avatar ?? "",
        phoneNumber: response.phoneNumber ?? "",
        address: response.address ?? "");
  }

  @override
  Future<void> signOut() async {
    await _localStorageService.deleteFromDisk("user");
  }
}
