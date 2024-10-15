import 'dart:io';

import 'package:mason/mason.dart';

Future<void> runRemoveFolderGenerated(HookContext context, String name) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = (context.vars['feature_name'] as String).snakeCase;
  final platform = context.vars['platform'] as String;

  final removingFilesDone =
      context.logger.progress('Removing $name folder ...');
  final dir =
      Directory('${platform}/$appName/lib/src/feature/$featureName/$name');

  if (dir.existsSync()) {
    await dir.delete(recursive: true);
    removingFilesDone.complete();
  } else {
    removingFilesDone.fail('Folder $name does not exist.');
  }
}

Future<void> removeFiles(HookContext context, String name) async {
  final removingFilesDone =
      context.logger.progress('removing .gitkeep files ...');
  final dir = Directory('.');
  dir
      .list(recursive: true)
      .where((element) => element.toString().contains(name))
      .listen(
    (element) {
      element.delete();
    },
    onDone: removingFilesDone.complete,
    onError: (error) => removingFilesDone.fail(error.toString()),
  );
}
