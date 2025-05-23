// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bean.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bean _$BeanFromJson(Map<String, dynamic> json) {
  return _Bean.fromJson(json);
}

/// @nodoc
mixin _$Bean {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  String get roastLevel => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get roastingDate => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get origin => throw _privateConstructorUsedError; //産地
  @HiveField(6)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Bean to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeanCopyWith<Bean> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeanCopyWith<$Res> {
  factory $BeanCopyWith(Bean value, $Res Function(Bean) then) =
      _$BeanCopyWithImpl<$Res, Bean>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int quantity,
      @HiveField(3) String roastLevel,
      @HiveField(4) DateTime? roastingDate,
      @HiveField(5) String? origin,
      @HiveField(6) String? notes,
      @HiveField(7) String? imageUrl});
}

/// @nodoc
class _$BeanCopyWithImpl<$Res, $Val extends Bean>
    implements $BeanCopyWith<$Res> {
  _$BeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? roastLevel = null,
    Object? roastingDate = freezed,
    Object? origin = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      roastLevel: null == roastLevel
          ? _value.roastLevel
          : roastLevel // ignore: cast_nullable_to_non_nullable
              as String,
      roastingDate: freezed == roastingDate
          ? _value.roastingDate
          : roastingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeanImplCopyWith<$Res> implements $BeanCopyWith<$Res> {
  factory _$$BeanImplCopyWith(
          _$BeanImpl value, $Res Function(_$BeanImpl) then) =
      __$$BeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int quantity,
      @HiveField(3) String roastLevel,
      @HiveField(4) DateTime? roastingDate,
      @HiveField(5) String? origin,
      @HiveField(6) String? notes,
      @HiveField(7) String? imageUrl});
}

/// @nodoc
class __$$BeanImplCopyWithImpl<$Res>
    extends _$BeanCopyWithImpl<$Res, _$BeanImpl>
    implements _$$BeanImplCopyWith<$Res> {
  __$$BeanImplCopyWithImpl(_$BeanImpl _value, $Res Function(_$BeanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bean
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? roastLevel = null,
    Object? roastingDate = freezed,
    Object? origin = freezed,
    Object? notes = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$BeanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      roastLevel: null == roastLevel
          ? _value.roastLevel
          : roastLevel // ignore: cast_nullable_to_non_nullable
              as String,
      roastingDate: freezed == roastingDate
          ? _value.roastingDate
          : roastingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeanImpl implements _Bean {
  _$BeanImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.quantity,
      @HiveField(3) required this.roastLevel,
      @HiveField(4) this.roastingDate,
      @HiveField(5) this.origin,
      @HiveField(6) this.notes,
      @HiveField(7) this.imageUrl});

  factory _$BeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeanImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int quantity;
  @override
  @HiveField(3)
  final String roastLevel;
  @override
  @HiveField(4)
  final DateTime? roastingDate;
  @override
  @HiveField(5)
  final String? origin;
//産地
  @override
  @HiveField(6)
  final String? notes;
  @override
  @HiveField(7)
  final String? imageUrl;

  @override
  String toString() {
    return 'Bean(id: $id, name: $name, quantity: $quantity, roastLevel: $roastLevel, roastingDate: $roastingDate, origin: $origin, notes: $notes, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.roastLevel, roastLevel) ||
                other.roastLevel == roastLevel) &&
            (identical(other.roastingDate, roastingDate) ||
                other.roastingDate == roastingDate) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, roastLevel,
      roastingDate, origin, notes, imageUrl);

  /// Create a copy of Bean
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeanImplCopyWith<_$BeanImpl> get copyWith =>
      __$$BeanImplCopyWithImpl<_$BeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeanImplToJson(
      this,
    );
  }
}

abstract class _Bean implements Bean {
  factory _Bean(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final int quantity,
      @HiveField(3) required final String roastLevel,
      @HiveField(4) final DateTime? roastingDate,
      @HiveField(5) final String? origin,
      @HiveField(6) final String? notes,
      @HiveField(7) final String? imageUrl}) = _$BeanImpl;

  factory _Bean.fromJson(Map<String, dynamic> json) = _$BeanImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  int get quantity;
  @override
  @HiveField(3)
  String get roastLevel;
  @override
  @HiveField(4)
  DateTime? get roastingDate;
  @override
  @HiveField(5)
  String? get origin; //産地
  @override
  @HiveField(6)
  String? get notes;
  @override
  @HiveField(7)
  String? get imageUrl;

  /// Create a copy of Bean
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeanImplCopyWith<_$BeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
