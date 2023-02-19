import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/models.dart';
import 'package:alquilame/repositories/repositories.dart';
import 'package:alquilame/services/services.dart';
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

  Future<List<Dwelling>?> getAllDwellings([int starterIndex = 1]) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      List<Dwelling>? response = await _dwellingRepository.getAllDwellings();
      return response;
    }
    return null;
  }
}
