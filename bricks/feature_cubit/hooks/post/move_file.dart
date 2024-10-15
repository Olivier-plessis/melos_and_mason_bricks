import 'dart:io' as io;

import 'package:mason/mason.dart';


Future<void> runMoveFileGenerated(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = (context.vars['feature_name'] as String).snakeCase;
  final platform = context.vars['platform'] as String;

  var result = await io.Process.run(
      'mv', [featureName, '${platform}/$appName/lib/src/feature']);

  io.stdout.write(result.stdout);
  io.stderr.write(result.stderr);
}
