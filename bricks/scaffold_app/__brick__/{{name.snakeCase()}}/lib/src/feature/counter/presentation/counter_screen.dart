import 'package:flutter/material.dart';
{{#isRiverpod}} import 'package:hooks_riverpod/hooks_riverpod.dart'; {{/isRiverpod}}
{{#isBloc}} 
import 'package:{{name.snakeCase()}}/src/core/theme/brightness_theme/brightness_bloc.dart';
import 'package:{{name.snakeCase()}}/src/core/theme/brightness_theme/brightness_event.dart';

import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
{{/isBloc}}
import 'package:{{name.snakeCase()}}/src/common_widgets/custom_appbar_widget.dart';
{{#isRiverpod}}
import 'package:{{name.snakeCase()}}/src/core/theme/theme_mode_controller.dart';
import 'package:{{name.snakeCase()}}/src/feature/counter/presentation/provider/counter_provider.dart'; {{/isRiverpod}}




class CounterScreen extends {{#isRiverpod}} ConsumerWidget {{/isRiverpod}}{{#isBloc}} StatelessWidget {{/isBloc}} {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context{{#isRiverpod}},WidgetRef ref {{/isRiverpod}}) {
    return Scaffold(
       appBar: CustomBarWidget(
        title: 'home page',
        themeRef: {{#isRiverpod}} ref.watch(themeModeControllerProvider) == ThemeMode.light {{/isRiverpod}}{{#isBloc}} context.watch<BrightnessBloc>().state.themeMode == Brightness.light {{/isBloc}},
        onPressed: () =>
            {{#isRiverpod}} ref.watch(themeModeControllerProvider.notifier).toggleThemeMode(), {{/isRiverpod}}{{#isBloc}} context.read<BrightnessBloc>().add(ToggleBrightnessEvent()), {{/isBloc}}
      ),  
      body: {{#isBloc}} BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterWidget(),
      ),{{/isBloc}} {{#isRiverpod}}CounterWidget(),{{/isRiverpod}}
    );
  }
}

class CounterWidget extends {{#isRiverpod}} ConsumerWidget {{/isRiverpod}}{{#isBloc}} StatelessWidget {{/isBloc}} {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context{{#isRiverpod}},WidgetRef ref {{/isRiverpod}}) {
    final theme = Theme.of(context);

   {{#isRiverpod}} final count = ref.watch(counterNotifierProvider); {{/isRiverpod}}
    {{#isBloc}} final count = context.watch<CounterBloc>().state.counter; {{/isBloc}}


    return Scaffold(
      body: Center(child: Text('$count', style: theme.textTheme.displayLarge)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () =>
              {{#isRiverpod}} ref
                  .read(counterNotifierProvider.notifier)
                  .update((state) => state += 1), {{/isRiverpod}}
              {{#isBloc}} context.read<CounterBloc>().add(Increment()), {{/isBloc}}
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'remove',
             onPressed: count > 0
                  ? () =>
                    {{#isRiverpod}} ref
                        .read(counterNotifierProvider.notifier)
                        .update((state) => state -= 1) {{/isRiverpod}}
                    {{#isBloc}} context.read<CounterBloc>().add(Decrement()) {{/isBloc}}
                  : null,

            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

