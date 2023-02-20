import 'package:json_annotation/json_annotation.dart';
part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel {
  const PlanModel({
    required this.content,
    required this.title,
    required this.id,
    required this.planId,
  });

  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'plan_id')
  final int planId;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);
}
