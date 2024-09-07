import 'dart:io' as io;
import 'package:mason/mason.dart';

Future<void> addToParentDependencies(HookContext context) async {
  final name = context.vars['name'] as String;
  final pubspecPath = 'app/${context.vars['appName']}/pubspec.yaml';
  final file = io.File(pubspecPath);
  final content = await file.readAsLines();
  final styleUiDependency = '  $name:';

  final updatedContent = <String>[];
  bool dependenciesFound = false;
  final dependenciesToRemove = {'flex_color_scheme', 'flutter_screenutil'};

  for (final line in content) {
    final trimmedLine = line.trim();
    if (trimmedLine.startsWith('dependencies:')) {
      dependenciesFound = true;
      updatedContent.add(line);
      updatedContent.add(styleUiDependency);
    } else if (dependenciesFound &&
        dependenciesToRemove.any(trimmedLine.startsWith)) {
      // Skip lines for dependencies to remove
      continue;
    } else {
      updatedContent.add(line);
    }
  }

  if (!dependenciesFound) {
    updatedContent.add('dependencies:');
    updatedContent.add(styleUiDependency);
  }

  await file.writeAsString(updatedContent.join('\n'));

  final _ = await io.Process.run(
    'melos',
    ['bs'],
    workingDirectory: 'app/${context.vars['appName']}',
    runInShell: true,
  );

}
