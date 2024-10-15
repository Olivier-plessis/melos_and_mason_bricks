// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Splash _$SplashFromJson(Map<String, dynamic> json) {
  return _Splash.fromJson(json);
}

/// @nodoc
mixin _$Splash {
  /// Serializes this Splash to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashCopyWith<$Res> {
  factory $SplashCopyWith(Splash value, $Res Function(Splash) then) =
      _$SplashCopyWithImpl<$Res, Splash>;
}

/// @nodoc
class _$SplashCopyWithImpl<$Res, $Val extends Splash>
    implements $SplashCopyWith<$Res> {
  _$SplashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SplashImplCopyWith<$Res> {
  factory _$$SplashImplCopyWith(
          _$SplashImpl value, $Res Function(_$SplashImpl) then) =
      __$$SplashImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashImplCopyWithImpl<$Res>
    extends _$SplashCopyWithImpl<$Res, _$SplashImpl>
    implements _$$SplashImplCopyWith<$Res> {
  __$$SplashImplCopyWithImpl(
      _$SplashImpl _value, $Res Function(_$SplashImpl) _then)
      : super(_value, _then);

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SplashImpl implements _Splash {
  _$SplashImpl();

  factory _$SplashImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashImplFromJson(json);

  @override
  String toString() {
    return 'Splash()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashImplToJson(
      this,
    );
  }
}

abstract class _Splash implements Splash {
  factory _Splash() = _$SplashImpl;

  factory _Splash.fromJson(Map<String, dynamic> json) = _$SplashImpl.fromJson;
}
