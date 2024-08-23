import 'package:flutter/material.dart';
import 'package:go_builder_app/src/router/app_routes.dart';
import 'package:go_builder_app/src/router/app_shell_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello EditProfile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile screen'),
          ElevatedButton(
              onPressed: () => ProfileRouteData().go(context),
              child: Text('back to profile'))
        ],
      )),
    );
  }
}
