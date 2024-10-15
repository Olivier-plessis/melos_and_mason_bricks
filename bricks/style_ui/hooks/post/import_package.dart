import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

Future<void> importPackageInApp(HookContext context) async {
  final name = context.vars['name'] as String;
  final appName = context.vars['appName'] as String;

  final movingTheme = context.vars['movingTheme'] as bool;

  final currentDir = Directory.current.path;
  final filePath = p.join(currentDir, 'apps/$appName/lib/src/app.dart');

  final file = File(filePath);

  if (!file.existsSync()) {
    log('File $filePath does not exist.');
    exit(1);
  }

  final content = file.readAsStringSync();

  final importLine = "import 'package:$name/$name.dart';";

  // Add import line if it doesn't exist
  var newContent = content;

  // Ensure the import line is before the MainApp class
  final mainAppIndex =
      newContent.indexOf('class MainApp extends ConsumerWidget');
  final statelessMainAppIndex =
      newContent.indexOf('class MainApp extends StatelessWidget');

  if ((mainAppIndex != -1 || statelessMainAppIndex != -1) &&
      !newContent
          .substring(
              0, mainAppIndex != -1 ? mainAppIndex : statelessMainAppIndex)
          .contains(importLine)) {
    final lastImportMatch = RegExp(r"^import\s'[^']+';", multiLine: true)
        .allMatches(newContent)
        .last;
    newContent =
        '${newContent.substring(0, lastImportMatch.end)}\n$importLine\n${newContent.substring(lastImportMatch.end)}';
  }

  // Remove specific import line if present
  const importToRemove =
      "import 'package:flutter_screenutil/flutter_screenutil.dart';";
  newContent = newContent.replaceAll(importToRemove, '');

  if (movingTheme) {
    final removeThemeData =
        "import 'package:$appName/src/core/theme/app_theme_data.dart';";
    newContent = newContent.replaceAll(removeThemeData, '');

    final themeImports = [
      'package:$appName/src/core/theme/dark_theme.dart',
      'package:$appName/src/core/theme/light_theme.dart'
    ];
    for (final import in themeImports) {
      newContent = newContent.replaceAll("import '$import';", '');
    }
  }

  file.writeAsStringSync(newContent);

  context.logger.info('$name package imported into pubspec.yaml.');
}
