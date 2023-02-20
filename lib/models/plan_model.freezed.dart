// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_id')
  int get planId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'plan_id') int planId,
      String content,
      String title});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? content = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlanModelCopyWith<$Res> implements $PlanModelCopyWith<$Res> {
  factory _$$_PlanModelCopyWith(
          _$_PlanModel value, $Res Function(_$_PlanModel) then) =
      __$$_PlanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'plan_id') int planId,
      String content,
      String title});
}

/// @nodoc
class __$$_PlanModelCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$_PlanModel>
    implements _$$_PlanModelCopyWith<$Res> {
  __$$_PlanModelCopyWithImpl(
      _$_PlanModel _value, $Res Function(_$_PlanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? content = null,
    Object? title = null,
  }) {
    return _then(_$_PlanModel(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanModel implements _PlanModel {
  _$_PlanModel(
      this.id, @JsonKey(name: 'plan_id') this.planId, this.content, this.title);

  factory _$_PlanModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlanModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'plan_id')
  final int planId;
  @override
  final String content;
  @override
  final String title;

  @override
  String toString() {
    return 'PlanModel(id: $id, planId: $planId, content: $content, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, planId, content, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      __$$_PlanModelCopyWithImpl<_$_PlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanModelToJson(
      this,
    );
  }
}

abstract class _PlanModel implements PlanModel {
  factory _PlanModel(final int id, @JsonKey(name: 'plan_id') final int planId,
      final String content, final String title) = _$_PlanModel;

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$_PlanModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'plan_id')
  int get planId;
  @override
  String get content;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
