import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> addBuilderScript(HookContext context) async {
  final directory = io.Directory.current;
  final melosFile = io.File('${directory.path}/melos.yaml');
  if (!melosFile.existsSync()) {
    context.logger.info('melos.yaml not found');
    io.exit(1);
  }

  final melosContent = melosFile.readAsStringSync();
  const buildScript = '''build_runner:
    run: melos exec --depends-on="build_runner" -- "dart run build_runner build -d"
    description: Build all generated files for Dart & Flutter packages in this project.
''';

  const watchScript = '''watch_runner:
    run: melos exec --depends-on="build_runner" -- "dart run build_runner watch -d"
    description: Watch all generated files for Dart & Flutter packages in this project.
''';
  var newContent = melosContent;

  if (!newContent.contains('watch_runner:') &&
      !newContent.contains('build_runner:')) {
    newContent = melosContent
        .replaceFirst(
          'all:',
          '$watchScript\n  $buildScript\n  all:',
        )
        .replaceFirst(
          'all:\n    run: |\n      melos clean\n      melos bs\n',
          'all:\n    run: |\n      melos clean\n      melos bs\n      melos watch_runner\n      melos build_runner\n',
        );

    melosFile.writeAsStringSync(newContent);

    context.logger.info('Dart format in progress..');
  } else {
    context.logger.info('build_runner script already exists');
  }
}
