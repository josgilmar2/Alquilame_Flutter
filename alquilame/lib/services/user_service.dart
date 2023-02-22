import 'package:alquilame/config/locator.dart';
import 'package:alquilame/models/all_dwellings.dart';
import 'package:alquilame/models/user.dart';
import 'package:alquilame/repositories/repositories.dart';
import 'package:alquilame/services/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(2)
@singleton
class UserService {
  late LocalStorageService _localStorageService;
  late UserRepository _userRepository;

  UserService() {
    _userRepository = getIt<UserRepository>();
    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }

  Future<AllDwellingsResponse> getUserFavouriteDwellings(int page) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      AllDwellingsResponse response =
          await _userRepository.getUserFavouritesDwellings(page);
      return response;
    }
    throw Exception("Failed to load user favourite dwellings");
  }

  Future<List<UserResponse>?> getAllUsers(int page) async {
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      List<UserResponse>? response = await _userRepository.getAllUsers(page);
      return response;
    }
    return null;
  }
}
