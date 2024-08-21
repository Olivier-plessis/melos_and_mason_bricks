import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runDartFormat(HookContext context) async {
  final appName = context.vars['appName'];

  final _ = await io.Process.run(
    'dart',
    ['format', '.'],
    workingDirectory: 'app/$appName',
  );
}
