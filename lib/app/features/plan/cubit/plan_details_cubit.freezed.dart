// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlanDetailsState {
  List<PlanModel> get results => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlanDetailsStateCopyWith<PlanDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanDetailsStateCopyWith<$Res> {
  factory $PlanDetailsStateCopyWith(
          PlanDetailsState value, $Res Function(PlanDetailsState) then) =
      _$PlanDetailsStateCopyWithImpl<$Res, PlanDetailsState>;
  @useResult
  $Res call({List<PlanModel> results, Status status, String? errorMessage});
}

/// @nodoc
class _$PlanDetailsStateCopyWithImpl<$Res, $Val extends PlanDetailsState>
    implements $PlanDetailsStateCopyWith<$Res> {
  _$PlanDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlanDetailsStateCopyWith<$Res>
    implements $PlanDetailsStateCopyWith<$Res> {
  factory _$$_PlanDetailsStateCopyWith(
          _$_PlanDetailsState value, $Res Function(_$_PlanDetailsState) then) =
      __$$_PlanDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlanModel> results, Status status, String? errorMessage});
}

/// @nodoc
class __$$_PlanDetailsStateCopyWithImpl<$Res>
    extends _$PlanDetailsStateCopyWithImpl<$Res, _$_PlanDetailsState>
    implements _$$_PlanDetailsStateCopyWith<$Res> {
  __$$_PlanDetailsStateCopyWithImpl(
      _$_PlanDetailsState _value, $Res Function(_$_PlanDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_PlanDetailsState(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PlanModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PlanDetailsState implements _PlanDetailsState {
  _$_PlanDetailsState(
      {final List<PlanModel> results = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _results = results;

  final List<PlanModel> _results;
  @override
  @JsonKey()
  List<PlanModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PlanDetailsState(results: $results, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlanDetailsState &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlanDetailsStateCopyWith<_$_PlanDetailsState> get copyWith =>
      __$$_PlanDetailsStateCopyWithImpl<_$_PlanDetailsState>(this, _$identity);
}

abstract class _PlanDetailsState implements PlanDetailsState {
  factory _PlanDetailsState(
      {final List<PlanModel> results,
      final Status status,
      final String? errorMessage}) = _$_PlanDetailsState;

  @override
  List<PlanModel> get results;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_PlanDetailsStateCopyWith<_$_PlanDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
