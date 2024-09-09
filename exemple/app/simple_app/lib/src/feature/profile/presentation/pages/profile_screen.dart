import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/src/router/route_constants.dart';
import 'package:simple_ui/simple_ui.dart';

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
          Text('Profile screen').paddedV(UiSpacing.xxlg),
          gapH32,
          ElevatedButton(
              onPressed: () => context.pushNamed(AppPage.settings.routeName),
              child: Text('edit settings'))
        ],
      )),
    );
  }
}
