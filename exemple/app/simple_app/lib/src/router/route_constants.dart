enum AppPage {
  home,
  splash,
  empty,
  profile,
  settings,
}

extension AppPageExtension on AppPage {
  String get routePath {
    return switch (this) {
      AppPage.home => '/',
      AppPage.splash => '/splash',
      AppPage.empty => '/empty',
      AppPage.profile => '/profile',
      AppPage.settings => '/settings',
    };
  }

  String get routeName {
    return switch (this) {
      AppPage.home => 'HOME',
      AppPage.splash => 'SPLASH',
      AppPage.empty => 'EMPTY',
      AppPage.profile => 'PROFILE',
      AppPage.settings => 'SETTINGS',
    };
  }
}
