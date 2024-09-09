import 'dart:io';

import 'package:mason/mason.dart';

Future<void> movingTheme(HookContext context) async {
  final name = context.vars['name'] as String;
  final appName = context.vars['appName'] as String;
  final movingTheme = context.vars['movingTheme'] as bool;

  if (movingTheme) {
    // Create the directory if it does not exist
    Directory('packages/$name/lib/src/theme/').createSync(recursive: true);

    const themeFiles = [
      'app_theme_data.dart',
      'dark_theme.dart',
      'light_theme.dart'
    ];

    for (final file in themeFiles) {
      final result = await Process.run(
        'mv',
        [
          'app/$appName/lib/src/core/theme/$file',
          'packages/$name/lib/src/theme/',
        ],
      );

      stdout.write(result.stdout);
      stderr.write(result.stderr);
    }

    context.logger.info('$name theme imported into $name package.');

    // Replace imports in app_theme_data.dart
    final appThemeDataFilePath =
        'packages/$name/lib/src/theme/app_theme_data.dart';
    var appThemeDataContent = await File(appThemeDataFilePath).readAsString();
    appThemeDataContent = appThemeDataContent.replaceAll(
        "import 'package:$appName/src/core/theme/dark_theme.dart';\nimport 'package:$appName/src/core/theme/light_theme.dart';",
        '''
import 'package:$name/$name.dart';
''');

    await File(appThemeDataFilePath).writeAsString(appThemeDataContent);
    context.logger.info('$name theme imported into $name package.');

    // Modify _customAppTheme to include textTheme
    final appThemeDataFile =
        File('packages/$name/lib/src/theme/app_theme_data.dart');
    var content = await appThemeDataFile.readAsString();

    if (!content.contains('elevatedButtonTheme: ElevatedButtonThemeData')) {
      content = content.replaceFirst(
        'return copyWith();',
        '''
  return copyWith(
    // Just an example of how you can add your own theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(Sizes.p16),
        textStyle: StyleTheme.bodyLarge,
      ),
    ),
  );
''',
      );
      await appThemeDataFile.writeAsString(content);
    }
  } else {
    context.logger.info('$name theme  is already present in package.');
  }
}
