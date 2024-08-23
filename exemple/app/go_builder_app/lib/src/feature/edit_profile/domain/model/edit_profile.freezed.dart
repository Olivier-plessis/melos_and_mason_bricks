// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfile _$EditProfileFromJson(Map<String, dynamic> json) {
  return _EditProfile.fromJson(json);
}

/// @nodoc
mixin _$EditProfile {
  /// Serializes this EditProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileCopyWith<$Res> {
  factory $EditProfileCopyWith(
          EditProfile value, $Res Function(EditProfile) then) =
      _$EditProfileCopyWithImpl<$Res, EditProfile>;
}

/// @nodoc
class _$EditProfileCopyWithImpl<$Res, $Val extends EditProfile>
    implements $EditProfileCopyWith<$Res> {
  _$EditProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfile
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EditProfileImplCopyWith<$Res> {
  factory _$$EditProfileImplCopyWith(
          _$EditProfileImpl value, $Res Function(_$EditProfileImpl) then) =
      __$$EditProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditProfileImplCopyWithImpl<$Res>
    extends _$EditProfileCopyWithImpl<$Res, _$EditProfileImpl>
    implements _$$EditProfileImplCopyWith<$Res> {
  __$$EditProfileImplCopyWithImpl(
      _$EditProfileImpl _value, $Res Function(_$EditProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfile
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$EditProfileImpl implements _EditProfile {
  _$EditProfileImpl();

  factory _$EditProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileImplFromJson(json);

  @override
  String toString() {
    return 'EditProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditProfileImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileImplToJson(
      this,
    );
  }
}

abstract class _EditProfile implements EditProfile {
  factory _EditProfile() = _$EditProfileImpl;

  factory _EditProfile.fromJson(Map<String, dynamic> json) =
      _$EditProfileImpl.fromJson;
}
