import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/common_widgets/button/primary_button.dart';
import 'package:simple_app/src/feature/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:simple_app/src/router/route_constants.dart';
import 'package:simple_ui/simple_ui.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Onboarding screen',
              style: StyleTheme.titleSmall
                  .copyWith(color: Palette.secondaryColor)),
          PrimaryButton(
            text: 'Get Started Now !',
            isLoading: state.isLoading,
            onPressed: state.isLoading
                ? null
                : () async {
                    await ref
                        .read(onboardingProvider.notifier)
                        .completeOnboarding();
                    if (context.mounted) {
                      // go to home page after completing onboarding
                      context.goNamed(AppPage.home.routeName);
                    }
                  },
          ).paddedAll(UiSpacing.lg),
        ],
      )),
    );
  }
}
