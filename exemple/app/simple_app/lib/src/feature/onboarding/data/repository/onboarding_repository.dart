import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_app/src/core/utils/shared_preference_provider.dart';

part 'onboarding_repository.g.dart';

class OnboardingRepository {
  OnboardingRepository(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const onboardingCompleteKey = 'onboardingComplete';

  Future<void> setOnboardingComplete() async {
    await sharedPreferences.setBool(onboardingCompleteKey, true);
  }

  bool isOnboardingComplete() =>
      sharedPreferences.getBool(onboardingCompleteKey) ?? false;

  Future<void> clearOnboardingComplete() async {
    await sharedPreferences.remove(onboardingCompleteKey);
  }
}

@Riverpod(keepAlive: true)
Future<OnboardingRepository> onboardingRepository(
    OnboardingRepositoryRef ref) async {
  return OnboardingRepository(
      await ref.watch(sharedPreferencesProvider).requireValue);
}
