enum AppPage {
  home,
  splash,
  empty,
  profile,
  editProfile,
}

extension AppPageExtension on AppPage {
  String get routePath {
    return switch (this) {
      AppPage.home => '/',
      AppPage.splash => '/splash',
      AppPage.empty => '/empty',
      AppPage.profile => '/profile',
      AppPage.editProfile => '/edit-profile',
    };
  }

  String get routeName {
    return switch (this) {
      AppPage.home => 'HOME',
      AppPage.splash => 'SPLASH',
      AppPage.empty => 'EMPTY',
      AppPage.profile => 'PROFILE',
      AppPage.editProfile => 'EDIT_PROFILE',
    };
  }
}
