import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_app/src/feature/onboarding/data/repository/onboarding_repository.dart';

part 'onboarding_provider.g.dart';

@riverpod
class Onboarding extends _$Onboarding {
  @override
  FutureOr<void> build() {}

  Future<void> completeOnboarding() async {
    final onboardingRepository =
        ref.watch(onboardingRepositoryProvider).requireValue;
    state = const AsyncLoading();
    state = await AsyncValue.guard(onboardingRepository.setOnboardingComplete);
  }

  Future<void> clearOnboarding() async {
    final onboardingRepository =
        ref.watch(onboardingRepositoryProvider).requireValue;
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(onboardingRepository.clearOnboardingComplete);
  }
}
