import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runBuildRunner(HookContext context) async {
  final appName = context.vars['appName'];
  final _ = await io.Process.run(
    'flutter',
    // -d is the same as --delete-conflicting-outputs
    ['pub', 'run', 'build_runner', 'build', '-d'],
    workingDirectory: 'app/$appName',
    runInShell: true,
  );
}
