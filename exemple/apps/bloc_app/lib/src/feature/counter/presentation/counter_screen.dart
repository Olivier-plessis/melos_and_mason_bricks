import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_app/src/core/theme/brightness_theme/brightness_bloc.dart';
import 'package:bloc_app/src/core/theme/brightness_theme/brightness_event.dart';

import 'package:bloc_app/src/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_app/src/feature/counter/presentation/bloc/counter_event.dart';

import 'package:bloc_app/src/common_widgets/custom_appbar_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBarWidget(
        title: 'home page',
        themeRef:
            context.watch<BrightnessBloc>().state.themeMode == Brightness.light,
        onPressed: () =>
            context.read<BrightnessBloc>().add(ToggleBrightnessEvent()),
      ),
      body: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final count = context.watch<CounterBloc>().state.counter;

    return Scaffold(
      body: Center(child: Text('$count', style: theme.textTheme.displayLarge)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => context.read<CounterBloc>().add(Increment()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: count > 0
                ? () => context.read<CounterBloc>().add(Decrement())
                : null,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
