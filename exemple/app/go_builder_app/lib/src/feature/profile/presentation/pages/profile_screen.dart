import 'package:flutter/material.dart';
import 'package:go_builder_app/src/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Profile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile screen'),
          ElevatedButton(
              onPressed: () => SettingsRoute().push(context),
              child: Text('edit settings'))
        ],
      )),
    );
  }
}
