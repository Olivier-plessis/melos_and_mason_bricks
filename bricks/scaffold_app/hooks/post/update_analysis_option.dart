import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> updateAnalysisOptions(HookContext context) async {
  final directory = io.Directory.current;

  await _updateAnalysisOptions(directory);
}

Future<void> _updateAnalysisOptions(io.Directory directory) async {
  final analysisOptionsFile =
      io.File('${directory.path}/analysis_options.yaml');

  if (await analysisOptionsFile.exists()) {
    final content = await analysisOptionsFile.readAsString();
    final newContent = content.replaceAll(
      'include: package:flutter_lints/flutter.yaml',
      '''import: ../../analysis_options.yaml
analyzer:
  plugins:
    - custom_lint''',
    );

    await analysisOptionsFile.writeAsString(newContent);
    print('Updated: ${analysisOptionsFile.path}');
  }

  // Recursively search for analysis_options.yaml in subdirectories
  await for (var entity in directory.list()) {
    if (entity is io.Directory) {
      await _updateAnalysisOptions(entity);
    }
  }
}
