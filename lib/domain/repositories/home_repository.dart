import 'package:dio/dio.dart';
import 'package:handy_home/data/models/complex_detail_model.dart';
import 'package:handy_home/data/models/complex_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class HomeRepository {

  Future<Result<List<ComplexModel>, DioException>> getComplexesFromKeyword(String keyword);

  Future<Result<ComplexDetailModel, DioException>> getComplexDetailFromComplexNo(String complexNo);

}