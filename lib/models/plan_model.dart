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

// @JsonSerializable()
// class PlanModel {
//   const PlanModel({
//     required this.content,
//     required this.title,
//     required this.id,
//     required this.planId,
//   });

//   @JsonKey(name: 'content')
//   final String content;
//   @JsonKey(name: 'title')
//   final String title;
//   @JsonKey(name: 'id')
//   final int id;
//   @JsonKey(name: 'plan_id')
//   final int planId;

//   factory PlanModel.fromJson(Map<String, dynamic> json) =>
//       _$PlanModelFromJson(json);

//   Map<String, dynamic> toJson() => _$PlanModelToJson(this);
// }
