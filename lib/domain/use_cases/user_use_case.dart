import 'package:handy_home/domain/entities/user_entity.dart';
import 'package:handy_home/domain/repositories/shared_prefs_repository.dart';
import 'package:handy_home/domain/repositories/user_repository.dart';

class UserUseCase {

  final SharedPreferencesRepository _sharedPreferencesRepository;

  final UserRepository _userRepository;

  UserUseCase({
    required SharedPreferencesRepository sharedPreferencesRepository,
    required UserRepository userRepository,
  }) :  _sharedPreferencesRepository = sharedPreferencesRepository,
        _userRepository = userRepository;

  Future<UserEntity?> createUser(String name) async {
    final result = await _userRepository.createUser(name);
    if (result.isError()) return null;

    final userEntity = UserEntity.fromUserModel(result.getOrThrow());
    _sharedPreferencesRepository.saveUser(result.getOrThrow());

    return userEntity;
  }

  UserEntity? getSavedUser() {
    final userModel = _sharedPreferencesRepository.getUser();

    return userModel != null ? UserEntity.fromUserModel(userModel) : null;
  }

}