import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_app/src/core/theme/brightness_theme/brightness_cubit.dart';
import 'package:cubit_app/src/feature/counter/presentation/bloc/counter_cubit.dart';

import 'package:cubit_app/src/common_widgets/custom_appbar_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBarWidget(
        title: 'home page',
        themeRef: context.watch<BrightnessCubit>().state == ThemeMode.light,
        onPressed: () => context.read<BrightnessCubit>().toggleBrightness(),
      ),
      body: BlocProvider(
        create: (_) => CounterCubit(),
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

    final count = context.watch<CounterCubit>().state;

    return Scaffold(
      body: Center(child: Text('$count', style: theme.textTheme.displayLarge)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: count > 0
                ? () => context.read<CounterCubit>().decrement()
                : null,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
