import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runDartFormat(HookContext context) async {
  final name = context.vars['name'];

  final _ = await io.Process.run(
    'dart',
    ['format', '.'],
    runInShell: true,
    workingDirectory: './apps/$name',
  );
}
