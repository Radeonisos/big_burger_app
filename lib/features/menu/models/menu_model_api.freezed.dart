// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_model_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuModelAPI _$MenuModelAPIFromJson(Map<String, dynamic> json) {
  return _MenuModelAPI.fromJson(json);
}

/// @nodoc
mixin _$MenuModelAPI {
  String get ref => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuModelAPICopyWith<MenuModelAPI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuModelAPICopyWith<$Res> {
  factory $MenuModelAPICopyWith(
          MenuModelAPI value, $Res Function(MenuModelAPI) then) =
      _$MenuModelAPICopyWithImpl<$Res, MenuModelAPI>;
  @useResult
  $Res call(
      {String ref,
      String title,
      int price,
      String? description,
      String? thumbnail});
}

/// @nodoc
class _$MenuModelAPICopyWithImpl<$Res, $Val extends MenuModelAPI>
    implements $MenuModelAPICopyWith<$Res> {
  _$MenuModelAPICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? title = null,
    Object? price = null,
    Object? description = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuModelAPICopyWith<$Res>
    implements $MenuModelAPICopyWith<$Res> {
  factory _$$_MenuModelAPICopyWith(
          _$_MenuModelAPI value, $Res Function(_$_MenuModelAPI) then) =
      __$$_MenuModelAPICopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ref,
      String title,
      int price,
      String? description,
      String? thumbnail});
}

/// @nodoc
class __$$_MenuModelAPICopyWithImpl<$Res>
    extends _$MenuModelAPICopyWithImpl<$Res, _$_MenuModelAPI>
    implements _$$_MenuModelAPICopyWith<$Res> {
  __$$_MenuModelAPICopyWithImpl(
      _$_MenuModelAPI _value, $Res Function(_$_MenuModelAPI) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? title = null,
    Object? price = null,
    Object? description = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_MenuModelAPI(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MenuModelAPI implements _MenuModelAPI {
  const _$_MenuModelAPI(
      {required this.ref,
      required this.title,
      required this.price,
      this.description,
      this.thumbnail});

  factory _$_MenuModelAPI.fromJson(Map<String, dynamic> json) =>
      _$$_MenuModelAPIFromJson(json);

  @override
  final String ref;
  @override
  final String title;
  @override
  final int price;
  @override
  final String? description;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'MenuModelAPI(ref: $ref, title: $title, price: $price, description: $description, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuModelAPI &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ref, title, price, description, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuModelAPICopyWith<_$_MenuModelAPI> get copyWith =>
      __$$_MenuModelAPICopyWithImpl<_$_MenuModelAPI>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuModelAPIToJson(
      this,
    );
  }
}

abstract class _MenuModelAPI implements MenuModelAPI {
  const factory _MenuModelAPI(
      {required final String ref,
      required final String title,
      required final int price,
      final String? description,
      final String? thumbnail}) = _$_MenuModelAPI;

  factory _MenuModelAPI.fromJson(Map<String, dynamic> json) =
      _$_MenuModelAPI.fromJson;

  @override
  String get ref;
  @override
  String get title;
  @override
  int get price;
  @override
  String? get description;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_MenuModelAPICopyWith<_$_MenuModelAPI> get copyWith =>
      throw _privateConstructorUsedError;
}
