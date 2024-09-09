import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          Text('Onboarding screen'),
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
          ),
        ],
      )),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.text, this.isLoading = false, this.onPressed});
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
