import 'package:handy_home/data/models/complex_detail_model.dart';
import 'package:handy_home/data/models/floor_plan_model.dart';
import 'package:handy_home/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../commons/utils/generic_converter.dart';
import 'complex_model.dart';

part 'api_response_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ApiResponseModel<T> {

  final int statusCd;

  final String? statusMsg;

  final bool success;

  @GenericConverter()
  final T body;

  ApiResponseModel({
    required this.statusCd,
    required this.statusMsg,
    required this.success,
    required this.body,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => _$ApiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
}

