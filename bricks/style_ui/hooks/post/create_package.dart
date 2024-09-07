import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> createBasePackage(HookContext context) async {
  final name = context.vars['name'];

  // Change directory to packages
  final _ = await io.Process.run(
    'flutter',
    [
      'create',
      '--template=package',
      '$name',
    ],
  );

  // Log the output to the console for debugging purposes
  context.logger.info(_.stdout.toString());
  context.logger.err(_.stderr.toString());

  // Remove the name_test.dart file from the test folder
  final testFile = io.File('./$name/test/${name}_test.dart');
  if (testFile.existsSync()) {
    await testFile.delete();
    context.logger.info('Removed test/${name}_test.dart');
  } else {
    context.logger.warn('test/${name}_test.dart not found');
  }
}

Future<void> addDependencies(HookContext context) async {
  final name = context.vars['name'];

  final dependencies = [
    'flex_color_scheme',
    'flutter_screenutil',
    'spider',
    'flutter_svg',
  ];

  await io.Process.run(
    'flutter',
    ['pub', 'add', ...dependencies],
    workingDirectory: './$name',
  );

  await io.Process.run(
    'flutter',
    ['pub', 'get'],
    workingDirectory: './$name',
  );
  context.logger.info('installed dependencies');
}

Future<void> runMoveGeneratedApp(HookContext context) async {
  final appName = (context.vars['name'] as String).snakeCase;

  final result = await io.Process.run('mv', [appName, 'packages']);

  io.stdout.write(result.stdout);
  io.stderr.write(result.stderr);
}
