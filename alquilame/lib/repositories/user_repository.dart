import 'dart:convert';

import 'package:alquilame/models/user.dart';
import 'package:alquilame/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:alquilame/config/locator.dart';

@Order(-1)
@singleton
class UserRepository {
  late RestAuthenticatedClient _client;

  UserRepository() {
    _client = getIt<RestAuthenticatedClient>();
  }

  Future<dynamic> profile() async {
    String url = "/user/profile";

    var jsonResponse = await _client.get(url);
    return UserResponse.fromJson(jsonDecode(jsonResponse));
  }
}
