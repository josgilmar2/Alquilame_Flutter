import 'dart:convert';

import 'package:alquilame/config/locator.dart';
import 'package:alquilame/rest/rest.dart';
import 'package:injectable/injectable.dart';
import 'package:alquilame/models/models.dart';

@Order(-1)
@singleton
class DwellingRepository {
  late RestAuthenticatedClient _client;

  DwellingRepository() {
    _client = getIt<RestAuthenticatedClient>();
  }

  Future<List<Dwelling>?> getAllDwellings([int starterIndex = 1]) async {
    String url = "/dwelling/?page=$starterIndex";

    var jsonResponse = await _client.get(url);
    return AllDwellingsResponse.fromJson(jsonDecode(jsonResponse)).content;
  }
}
