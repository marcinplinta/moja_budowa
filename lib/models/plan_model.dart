import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';
part 'plan_model.freezed.dart';

@freezed
class PlanModel with _$PlanModel {
  factory PlanModel(
    int id,
    @JsonKey(name: 'plan_id') int planId,
    String content,
    String title,
  ) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);
}
