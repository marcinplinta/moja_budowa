// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => PlanModel(
      content: json['content'] as String,
      title: json['title'] as String,
      id: json['id'] as int,
      planId: json['plan_id'] as int,
    );

Map<String, dynamic> _$PlanModelToJson(PlanModel instance) => <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
      'id': instance.id,
      'plan_id': instance.planId,
    };
