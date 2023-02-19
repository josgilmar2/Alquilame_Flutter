import 'dart:convert';
import 'package:alquilame/models/login.dart';
import 'package:alquilame/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(-1)
@singleton
class AuthRepository {
  late RestClient _client;

  AuthRepository() {
    _client = GetIt.I.get<RestClient>();
  }

  Future<dynamic> doLogin(String username, String password) async {
    String url = "/auth/login";

    var jsonResponse = await _client.post(
        url, LoginRequest(username: username, password: password));
    return LoginResponse.fromJson(jsonDecode(jsonResponse));
  }
}
