import 'dart:io' as io;

import 'package:mason/mason.dart';

import 'execute_and_log.dart';
import 'post/add_to_parent_dependencies.dart';
import 'post/create_package.dart';
import 'post/get_dependencies.dart';
import 'post/import_package.dart';
import 'post/moving_theme.dart';
import 'post/spider_file.dart';

Future<void> run(HookContext context) async {
  await executeAndLog(
      context: context, cb: createBasePackage, message: 'Creating package...');

  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context, cb: addDependencies, message: 'Adding packages..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: runMoveGeneratedApp,
      message: 'Adding runMoveGeneratedApp..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: addToParentDependencies,
      message: 'Adding addToParentDependencies..');
  await Future<void>.delayed(_duration);

  if (context.vars['movingTheme'] as bool) {
    await executeAndLog(
      context: context,
      cb: movingTheme,
      message: 'moving app themes in progress ..',
    );
    await Future<void>.delayed(_duration);
  }
  await executeAndLog(
      context: context,
      cb: importPackageInApp,
      message: 'Adding importPackageInApp..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: getSpiderJson,
      message: 'Adding spider.json on app..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: addSpiderScript,
      message: 'Adding spider script in melos file..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: getDependencies,
      message: 'update parent dependencies..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: runDartFormat,
      message: 'Dart format in progress..');
  await Future<void>.delayed(_duration);
}

const _duration = Duration(milliseconds: 600);
