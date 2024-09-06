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
  const newScript = '''build_runner:
    run: melos exec --depends-on="build_runner" -- "dart run build_runner build -d"
    description: Build all generated files for Dart & Flutter packages in this project.
''';

  final newContent = melosContent.replaceFirst(
    'all:',
    '$newScript\n  all:',
  );

  melosFile.writeAsStringSync(newContent);

  context.logger.info('Dart format in progress..');
}
