import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/core/theme/theme_mode_controller.dart';
import 'package:simple_app/src/feature/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:simple_app/src/feature/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:simple_app/src/router/route_constants.dart';
import 'package:simple_ui/simple_ui.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Edit Profile screen'),
          ElevatedButton(
              onPressed: () => context.pop(), child: Text('back to profile')),
          gapH32,
          ThemeSelectorListTile(),
          PrimaryButton(
            text: 'Get Started Now !',
            isLoading: state.isLoading,
            onPressed: state.isLoading
                ? null
                : () async {
                    await ref
                        .read(onboardingProvider.notifier)
                        .clearOnboarding();
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

class ThemeSelectorListTile extends ConsumerWidget {
  const ThemeSelectorListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme mode'),
          SegmentedButton<ThemeMode>(
            multiSelectionEnabled: false,
            emptySelectionAllowed: false,
            showSelectedIcon: false,
            selected: {themeMode},
            onSelectionChanged: (Set<ThemeMode> newSelection) {
              ref
                  .read(themeModeControllerProvider.notifier)
                  .setThemeMode(newSelection.single);
            },
            segments: ThemeMode.values
                .where((theme) => theme != ThemeMode.system)
                .map<ButtonSegment<ThemeMode>>((ThemeMode theme) {
              // Capitalize first letter
              final label =
                  theme.name[0].toUpperCase() + theme.name.substring(1);
              return ButtonSegment<ThemeMode>(
                value: theme,
                label: Text(label),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
