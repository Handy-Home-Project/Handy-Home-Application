import 'package:dio/dio.dart';
import 'package:handy_home/data/models/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class UserRepository {

  Future<Result<UserModel, DioException>> createUser(String name);

}