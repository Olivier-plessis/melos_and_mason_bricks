import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  factory Settings(
      // TODO add params here
      ) = _Settings;
  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);

  factory Settings.empty() => _Settings(
      // TODO add params here
      );
}
