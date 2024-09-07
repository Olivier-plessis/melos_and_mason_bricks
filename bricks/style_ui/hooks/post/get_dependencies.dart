import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> getDependencies(HookContext context) async {
  final appName = context.vars['appName'];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: 'app/$appName',
    runInShell: true,
  );
}


Future<void> runDartFormat(HookContext context) async {
  final appName = context.vars['appName'];

  final _ = await io.Process.run(
    'dart',
    ['format', '.'],
    workingDirectory: 'app/$appName',
  );
}
