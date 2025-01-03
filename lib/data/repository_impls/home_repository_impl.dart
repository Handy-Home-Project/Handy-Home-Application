import 'dart:developer';

import 'package:dio/src/dio_exception.dart';
import 'package:handy_home/data/data_sources/home_data_source.dart';
import 'package:handy_home/data/models/complex_detail_model.dart';
import 'package:handy_home/data/models/complex_model.dart';
import 'package:handy_home/domain/repositories/home_repository.dart';
import 'package:multiple_result/src/result.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl({required HomeDataSource homeDataSource}) : _homeDataSource = homeDataSource;

  @override
  Future<Result<List<ComplexModel>, DioException>> getComplexesFromKeyword(String keyword) async {
    try {
      final result = await _homeDataSource.getComplexesFromKeyword(keyword);
      return Result.success(result.body);
    } on DioException catch (e, t) {
      log("getComplexesFromKeyword", error: e, stackTrace: t);
      return Result.error(e);
    }
  }

  @override
  Future<Result<ComplexDetailModel, DioException>> getComplexDetailFromComplexNo(String complexNo) async {
    try {
      final result = await _homeDataSource.getComplexDetailFromComplexNo(complexNo);
      return Result.success(result.body);
    } on DioException catch (e, t) {
      log("getComplexDetailFromComplexNo", error: e, stackTrace: t);
      return Result.error(e);
    }
  }

}