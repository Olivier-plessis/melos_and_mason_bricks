import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> runMoveGeneratedApp(HookContext context) async {
  final appName = (context.vars['name'] as String).snakeCase;

  var result = await io.Process.run('mv', [appName, 'app']);

  io.stdout.write(result.stdout);
  io.stderr.write(result.stderr);
}
