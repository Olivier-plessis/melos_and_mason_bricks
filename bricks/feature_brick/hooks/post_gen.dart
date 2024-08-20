import 'package:mason/mason.dart';

import 'execute_and_log.dart';
import 'post/add_constant_route.dart';
import 'post/add_route.dart';
import 'post/app_build_runner.dart';
import 'post/dart_formater.dart';
import 'post/move_file.dart';
import 'post/remove_folder.dart';

Future<void> run(HookContext context) async {
  await executeAndLog(
    context: context,
    cb: runMoveFileGenerated,
    message: 'Moving generated files in progress ..',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: (context) async {
      if (!(context.vars['page'] as bool)) {
        await runRemoveFolderGenerated(context, 'presentation');
      }
    },
    message: 'Remove folder in progress ..',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: (context) async {
      await removeFiles(context, '.gitkeep');
    },
    message: 'removing .gitkeep files ...',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: runGeneratedRoute,
    message: 'Add route in progress ..',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: runGeneratedRouteConstant,
    message: 'Add route in progress ..',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: runBuildRunner,
    message: 'Running `build_runner`..',
  );
  await Future<void>.delayed(_duration);

  await executeAndLog(
    context: context,
    cb: runDartFormat,
    message: 'Formatting code in progress ..',
  );
  await Future<void>.delayed(_duration);
}

const _duration = Duration(milliseconds: 600);
