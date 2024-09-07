import 'dart:io' as io;

import 'package:mason/mason.dart';

void checkIfExists(io.Directory dr) {
  final present = dr.existsSync();
  if (!present) {
    dr.createSync(recursive: true);
  }
}

void run(HookContext context) {
  const packagePath = 'packages';
  final dr = io.Directory(packagePath);

  checkIfExists(dr);

  final movingTheme = context.vars['movingTheme'] as bool;

  context.vars['isMovingTheme'] = movingTheme;
}
