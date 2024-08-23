import 'package:flutter/material.dart';
import 'package:go_builder_app/src/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        title: const Text('Hello Profile'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile screen'),
          ElevatedButton(
              onPressed: () => EditProfileRoute().push(context),  
              child: Text('edit profile'))
        ],
      )),
    );
  }
}
