import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile.freezed.dart';
part 'edit_profile.g.dart';

@freezed
class EditProfile with _$EditProfile {
  factory EditProfile(
      // TODO add params here
      ) = _EditProfile;
  factory EditProfile.fromJson(Map<String, Object?> json) =>
      _$EditProfileFromJson(json);

  factory EditProfile.empty() => _EditProfile(
      // TODO add params here
      );
}
