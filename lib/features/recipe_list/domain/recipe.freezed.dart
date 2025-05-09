// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get waterAmount => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get coffeeAmount => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get temperature => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get grain => throw _privateConstructorUsedError;
  @HiveField(6)
  List<RecipeProcessStep>? get steps => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) int? waterAmount,
      @HiveField(3) int? coffeeAmount,
      @HiveField(4) int? temperature,
      @HiveField(5) String? grain,
      @HiveField(6) List<RecipeProcessStep>? steps});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? waterAmount = freezed,
    Object? coffeeAmount = freezed,
    Object? temperature = freezed,
    Object? grain = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      waterAmount: freezed == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      coffeeAmount: freezed == coffeeAmount
          ? _value.coffeeAmount
          : coffeeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      grain: freezed == grain
          ? _value.grain
          : grain // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeProcessStep>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) int? waterAmount,
      @HiveField(3) int? coffeeAmount,
      @HiveField(4) int? temperature,
      @HiveField(5) String? grain,
      @HiveField(6) List<RecipeProcessStep>? steps});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? waterAmount = freezed,
    Object? coffeeAmount = freezed,
    Object? temperature = freezed,
    Object? grain = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$RecipeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      waterAmount: freezed == waterAmount
          ? _value.waterAmount
          : waterAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      coffeeAmount: freezed == coffeeAmount
          ? _value.coffeeAmount
          : coffeeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      grain: freezed == grain
          ? _value.grain
          : grain // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeProcessStep>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) this.waterAmount,
      @HiveField(3) this.coffeeAmount,
      @HiveField(4) this.temperature,
      @HiveField(5) this.grain,
      @HiveField(6) final List<RecipeProcessStep>? steps})
      : _steps = steps;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final int? waterAmount;
  @override
  @HiveField(3)
  final int? coffeeAmount;
  @override
  @HiveField(4)
  final int? temperature;
  @override
  @HiveField(5)
  final String? grain;
  final List<RecipeProcessStep>? _steps;
  @override
  @HiveField(6)
  List<RecipeProcessStep>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, waterAmount: $waterAmount, coffeeAmount: $coffeeAmount, temperature: $temperature, grain: $grain, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.waterAmount, waterAmount) ||
                other.waterAmount == waterAmount) &&
            (identical(other.coffeeAmount, coffeeAmount) ||
                other.coffeeAmount == coffeeAmount) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.grain, grain) || other.grain == grain) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      waterAmount,
      coffeeAmount,
      temperature,
      grain,
      const DeepCollectionEquality().hash(_steps));

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) final int? waterAmount,
      @HiveField(3) final int? coffeeAmount,
      @HiveField(4) final int? temperature,
      @HiveField(5) final String? grain,
      @HiveField(6) final List<RecipeProcessStep>? steps}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  int? get waterAmount;
  @override
  @HiveField(3)
  int? get coffeeAmount;
  @override
  @HiveField(4)
  int? get temperature;
  @override
  @HiveField(5)
  String? get grain;
  @override
  @HiveField(6)
  List<RecipeProcessStep>? get steps;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
