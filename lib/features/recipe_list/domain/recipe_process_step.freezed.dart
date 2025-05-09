// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_process_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeProcessStep _$RecipeProcessStepFromJson(Map<String, dynamic> json) {
  return _RecipeProcessStep.fromJson(json);
}

/// @nodoc
mixin _$RecipeProcessStep {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  RecipeProcessType get type => throw _privateConstructorUsedError;
  @HiveField(2)
  int get value => throw _privateConstructorUsedError;

  /// Serializes this RecipeProcessStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeProcessStepCopyWith<RecipeProcessStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeProcessStepCopyWith<$Res> {
  factory $RecipeProcessStepCopyWith(
          RecipeProcessStep value, $Res Function(RecipeProcessStep) then) =
      _$RecipeProcessStepCopyWithImpl<$Res, RecipeProcessStep>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) RecipeProcessType type,
      @HiveField(2) int value});
}

/// @nodoc
class _$RecipeProcessStepCopyWithImpl<$Res, $Val extends RecipeProcessStep>
    implements $RecipeProcessStepCopyWith<$Res> {
  _$RecipeProcessStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecipeProcessType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeProcessStepImplCopyWith<$Res>
    implements $RecipeProcessStepCopyWith<$Res> {
  factory _$$RecipeProcessStepImplCopyWith(_$RecipeProcessStepImpl value,
          $Res Function(_$RecipeProcessStepImpl) then) =
      __$$RecipeProcessStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) RecipeProcessType type,
      @HiveField(2) int value});
}

/// @nodoc
class __$$RecipeProcessStepImplCopyWithImpl<$Res>
    extends _$RecipeProcessStepCopyWithImpl<$Res, _$RecipeProcessStepImpl>
    implements _$$RecipeProcessStepImplCopyWith<$Res> {
  __$$RecipeProcessStepImplCopyWithImpl(_$RecipeProcessStepImpl _value,
      $Res Function(_$RecipeProcessStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$RecipeProcessStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecipeProcessType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeProcessStepImpl implements _RecipeProcessStep {
  const _$RecipeProcessStepImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.type,
      @HiveField(2) required this.value});

  factory _$RecipeProcessStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeProcessStepImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final RecipeProcessType type;
  @override
  @HiveField(2)
  final int value;

  @override
  String toString() {
    return 'RecipeProcessStep(id: $id, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeProcessStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, value);

  /// Create a copy of RecipeProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeProcessStepImplCopyWith<_$RecipeProcessStepImpl> get copyWith =>
      __$$RecipeProcessStepImplCopyWithImpl<_$RecipeProcessStepImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeProcessStepImplToJson(
      this,
    );
  }
}

abstract class _RecipeProcessStep implements RecipeProcessStep {
  const factory _RecipeProcessStep(
      {@HiveField(0) required final String id,
      @HiveField(1) required final RecipeProcessType type,
      @HiveField(2) required final int value}) = _$RecipeProcessStepImpl;

  factory _RecipeProcessStep.fromJson(Map<String, dynamic> json) =
      _$RecipeProcessStepImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  RecipeProcessType get type;
  @override
  @HiveField(2)
  int get value;

  /// Create a copy of RecipeProcessStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeProcessStepImplCopyWith<_$RecipeProcessStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
