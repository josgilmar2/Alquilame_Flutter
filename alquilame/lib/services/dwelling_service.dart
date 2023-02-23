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

  Future<AllDwellingsResponse> getAllDwellings(int starterIndex) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      AllDwellingsResponse response =
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

  Future<AllDwellingsResponse> getUserDwellings(int page) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      AllDwellingsResponse response =
          await _dwellingRepository.getUserDwellings(page);
      return response;
    }
    throw Exception("Failed to load your users dwellings");
  }

  Future<OneDwellingResponse> markAsFavourite(int id) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      OneDwellingResponse response =
          await _dwellingRepository.markAsFavourite(id);
      return response;
    }
    throw Exception("Failed to mark as favourite");
  }

  Future<void> deleteFavourite(int id) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      return _dwellingRepository.deleteFavourite(id);
    }
    throw Exception("Failed to delete favourite");
  }

  Future<OneDwellingResponse> createDwelling(
      String name,
      String address,
      String description,
      String type,
      double price,
      double m2,
      int numBedrooms,
      int numBathrooms,
      bool hasElevator,
      bool hasPool,
      bool hasTerrace,
      bool hasGarage,
      String provinceName) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      OneDwellingResponse response = await _dwellingRepository.createDwelling(
          name,
          address,
          description,
          type,
          price,
          m2,
          numBedrooms,
          numBathrooms,
          hasElevator,
          hasPool,
          hasTerrace,
          hasGarage,
          provinceName);
      return response;
    }
    throw Exception("Failed to create dwelling");
  }

  Future<void> deleteDwelling(int id) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      return _dwellingRepository.deleteDwelling(id);
    }
    throw Exception("Failed to delete dwelling");
  }
}
