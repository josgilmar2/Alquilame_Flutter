import 'dart:convert';
import 'package:alquilame/models/login.dart';
import 'package:alquilame/rest/rest_client.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(-1)
@singleton
class AuthRepo {
  late RestClient _restClient;

  AuthRepo() {
    _restClient = GetIt.I.get<RestClient>();
  }

  Future<dynamic> login(String username, String password) async {
    String url = '/auth/login';

    var json = await _restClient.post(
        url, LoginRequest(username: username, password: password));
    return LoginResponse.fromJson(jsonDecode(json));
  }
}
