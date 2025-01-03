import 'package:handy_home/data/models/user_model.dart';

abstract interface class SharedPreferencesRepository {

  Future<void> initSharedPrefs();

  void saveUser(UserModel model);

  UserModel? getUser();

}
