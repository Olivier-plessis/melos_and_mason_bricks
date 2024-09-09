enum AppPage {
  startup,
  home,
  splash,
  empty,
  profile,
  settings,
  onboarding,
}

extension AppPageExtension on AppPage {
  String get routePath {
    return switch (this) {
      AppPage.home => '/',
      AppPage.startup => '/startup',
      AppPage.splash => '/splash',
      AppPage.empty => '/empty',
      AppPage.profile => '/profile',
      AppPage.settings => '/settings',
      AppPage.onboarding => '/onboarding',
    };
  }

  String get routeName {
    return switch (this) {
      AppPage.home => 'HOME',
      AppPage.startup => 'STARTUP',
      AppPage.splash => 'SPLASH',
      AppPage.empty => 'EMPTY',
      AppPage.profile => 'PROFILE',
      AppPage.settings => 'SETTINGS',
      AppPage.onboarding => 'ONBOARDING',
    };
  }
}
