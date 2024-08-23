import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/router/app_router.dart';
import 'package:simple_app/src/router/app_routes.dart';
import 'package:simple_app/src/router/route_constants.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile screen'),
          ElevatedButton(
              onPressed: () => context.pushNamed(AppPage.editProfile.routeName),
              child: Text('edit profile'))
        ],
      )),
    );
  }
}
