import 'package:handy_home/data/models/complex_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'floor_plan_model.dart';

part 'complex_detail_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ComplexDetailModel {

  final ComplexModel complex;

  final List<FloorPlanModel> floorPlans;

  ComplexDetailModel({
    required this.complex,
    required this.floorPlans,
  });

  factory ComplexDetailModel.fromJson(Map<String, dynamic> json) => _$ComplexDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexDetailModelToJson(this);

}