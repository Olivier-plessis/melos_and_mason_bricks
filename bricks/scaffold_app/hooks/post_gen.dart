import 'package:mason/mason.dart';

import 'execute_and_log.dart';
import 'post/add_dependencies.dart';
import 'post/add_dev_dependencies.dart';
import 'post/app_build_runner.dart';
import 'post/creator_base_project.dart';
import 'post/dart_formater.dart';
import 'post/get_dependencies.dart';
import 'post/melos_script.dart';
import 'post/move_generated_app.dart';
import 'post/update_analysis_option.dart';

Future<void> run(HookContext context) async {
  await executeAndLog(
      context: context,
      cb: createBaseProject,
      message: 'Creating base project..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context, cb: addDependencies, message: 'Adding packages..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: addDevDependencies,
      message: 'Adding dev packages..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context, cb: getDependencies, message: 'Installing packages..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: runBuildRunner,
      message: 'Running `build_runner`..');

  await executeAndLog(
      context: context,
      cb: runMoveGeneratedApp,
      message: 'Moving generated app in progress ..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: (context) async => await updateAnalysisOptions(context),
      message: 'Update analysis_options.yaml in progress ..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: addBuilderScript,
      message: 'Adding builder script in melos file..');
  await Future<void>.delayed(_duration);

  await executeAndLog(
      context: context,
      cb: runDartFormat,
      message: 'Formatting code in progress ..');
  await Future<void>.delayed(_duration);
}

const _duration = Duration(milliseconds: 600);
