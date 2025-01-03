import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:handy_home/data/data_sources/user_data_source.dart';
import 'package:handy_home/data/models/user_model.dart';
import 'package:handy_home/domain/repositories/user_repository.dart';
import 'package:multiple_result/src/result.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource}) : _userDataSource = userDataSource;

  @override
  Future<Result<UserModel, DioException>> createUser(String name) async {
    try {
      final result = await _userDataSource.createUser({"name": name});
      return Result.success(result.body);
    } on DioException catch (e, t) {
      log("createUser", error: e, stackTrace: t);
      return Result.error(e);
    }
  }

}