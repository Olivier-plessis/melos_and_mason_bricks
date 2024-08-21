Iterable<AvailablePlatform> parsePlatforms(Iterable<String> platforms) {
  return platforms.map(AvailablePlatform.fromString);
}

enum AvailablePlatform {
  app,
  packages;

  const AvailablePlatform();

  factory AvailablePlatform.fromString(String os) => switch (os) {
        'app' => AvailablePlatform.app,
        'packages' => AvailablePlatform.packages,
        _ => throw UnsupportedPlatformException(os),
      };

  @override
  String toString() => name;
}

class UnsupportedPlatformException implements Exception {
  const UnsupportedPlatformException(this.os);
  final String os;
  @override
  String toString() => "This platform isn't supported by this brick yet: $os";
}
