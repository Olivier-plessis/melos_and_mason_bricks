import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash.freezed.dart';
part 'splash.g.dart';

@freezed
class Splash with _$Splash {
  factory Splash(
      // TODO add params here
      ) = _Splash;
  factory Splash.fromJson(Map<String, Object?> json) => _$SplashFromJson(json);

  factory Splash.empty() => _Splash(
      // TODO add params here
      );
}
