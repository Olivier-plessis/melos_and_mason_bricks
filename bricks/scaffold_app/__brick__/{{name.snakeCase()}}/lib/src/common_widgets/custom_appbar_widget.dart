import 'package:flutter/material.dart';
{{#isBlocOrCubit}}import 'package:flutter_bloc/flutter_bloc.dart';{{/isBlocOrCubit}}
{{#isBloc}}import 'package:{{name.snakeCase()}}/src/core/theme/brightness_theme/brightness_bloc.dart';{{/isBloc}}
{{#isCubit}}import 'package:{{name.snakeCase()}}/src/core/theme/brightness_theme/brightness_cubit.dart';{{/isCubit}}

class CustomBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool themeRef;
  final VoidCallback onPressed;
  const CustomBarWidget(
      {super.key,
      required this.title,
      required this.themeRef,
      required this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
            color: Colors.blue,
            onPressed: onPressed,
            icon: {{#isRiverpod}}Icon(
                color: themeRef ? Colors.teal : Colors.brown,
                themeRef ? Icons.light_mode : Icons.dark_mode){{/isRiverpod}}
                {{#isBloc}} Icon(
                    context.watch<BrightnessBloc>().toggleIcon(),
                    color: context.watch<BrightnessBloc>().toggleColor(),
                  ),{{/isBloc}}
                {{#isCubit}} Icon(
                    context.watch<BrightnessCubit>().toggleIcon(),
                    color: context.watch<BrightnessCubit>().toggleColor(),
                  ),{{/isCubit}}
        )
      ],
    );
  }
}
