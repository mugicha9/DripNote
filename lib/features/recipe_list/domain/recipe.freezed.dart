// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

 String get id; String get title; double? get waterAmount; double? get coffeeAmount; double? get temperature; String? get grain; List<String>? get steps;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.waterAmount, waterAmount) || other.waterAmount == waterAmount)&&(identical(other.coffeeAmount, coffeeAmount) || other.coffeeAmount == coffeeAmount)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.grain, grain) || other.grain == grain)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,waterAmount,coffeeAmount,temperature,grain,const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Recipe(id: $id, title: $title, waterAmount: $waterAmount, coffeeAmount: $coffeeAmount, temperature: $temperature, grain: $grain, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String id, String title, double? waterAmount, double? coffeeAmount, double? temperature, String? grain, List<String>? steps
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? waterAmount = freezed,Object? coffeeAmount = freezed,Object? temperature = freezed,Object? grain = freezed,Object? steps = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,waterAmount: freezed == waterAmount ? _self.waterAmount : waterAmount // ignore: cast_nullable_to_non_nullable
as double?,coffeeAmount: freezed == coffeeAmount ? _self.coffeeAmount : coffeeAmount // ignore: cast_nullable_to_non_nullable
as double?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,grain: freezed == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as String?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({required this.id, required this.title, this.waterAmount, this.coffeeAmount, this.temperature, this.grain, final  List<String>? steps}): _steps = steps;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  String id;
@override final  String title;
@override final  double? waterAmount;
@override final  double? coffeeAmount;
@override final  double? temperature;
@override final  String? grain;
 final  List<String>? _steps;
@override List<String>? get steps {
  final value = _steps;
  if (value == null) return null;
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.waterAmount, waterAmount) || other.waterAmount == waterAmount)&&(identical(other.coffeeAmount, coffeeAmount) || other.coffeeAmount == coffeeAmount)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.grain, grain) || other.grain == grain)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,waterAmount,coffeeAmount,temperature,grain,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Recipe(id: $id, title: $title, waterAmount: $waterAmount, coffeeAmount: $coffeeAmount, temperature: $temperature, grain: $grain, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double? waterAmount, double? coffeeAmount, double? temperature, String? grain, List<String>? steps
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? waterAmount = freezed,Object? coffeeAmount = freezed,Object? temperature = freezed,Object? grain = freezed,Object? steps = freezed,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,waterAmount: freezed == waterAmount ? _self.waterAmount : waterAmount // ignore: cast_nullable_to_non_nullable
as double?,coffeeAmount: freezed == coffeeAmount ? _self.coffeeAmount : coffeeAmount // ignore: cast_nullable_to_non_nullable
as double?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,grain: freezed == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as String?,steps: freezed == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
