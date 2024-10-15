import 'package:flutter/material.dart';

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
      // backgroundColor: Colors.white,
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
            color: Colors.blue,
            onPressed: onPressed,
            icon: Icon(
                color: themeRef ? Colors.teal : Colors.brown,
                themeRef ? Icons.light_mode : Icons.dark_mode))
      ],
    );
  }
}
