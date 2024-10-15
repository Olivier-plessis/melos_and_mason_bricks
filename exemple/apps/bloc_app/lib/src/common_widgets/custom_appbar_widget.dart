import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/src/core/theme/brightness_theme/brightness_bloc.dart';

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
          icon: Icon(
            context.watch<BrightnessBloc>().toggleIcon(),
            color: context.watch<BrightnessBloc>().toggleColor(),
          ),
        )
      ],
    );
  }
}
