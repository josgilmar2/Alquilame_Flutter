import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/repositories/repositories.dart';
import 'package:alquilame/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(2)
@singleton
class DwellingService {
  late LocalStorageService _localStorageService;
  late DwellingRepository _dwellingRepository;

  DwellingService() {
    _dwellingRepository = getIt<DwellingRepository>();
    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  Future<List<Dwelling>> getAllDwellings(int starterIndex) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      List<Dwelling>? response =
          await _dwellingRepository.getAllDwellings(starterIndex);
      return response;
    }
    throw Exception('Failed to load all dwellings');
  }

  Future<OneDwellingResponse> getOneDwelling(int id) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      OneDwellingResponse response =
          await _dwellingRepository.getOneDwelling(id);
      return response;
    }
    throw Exception("Failed to load the dwelling $id details");
  }

  Future<List<Dwelling>> getUserDwellings(int page) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      List<Dwelling> response =
          await _dwellingRepository.getUserDwellings(page);
      return response;
    }
    throw Exception("Failed to load your users dwellings");
  }
}
