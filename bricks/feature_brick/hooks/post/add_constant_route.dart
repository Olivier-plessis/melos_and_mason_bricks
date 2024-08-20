import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

import '../pre/available_platform.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedRouteConstant(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = (context.vars['feature_name'] as String).snakeCase;
  // Dynamically construct the file path
  final currentDir = Directory.current.path;
  final filePath = p.join(currentDir,
      '${AvailablePlatform.app}/$appName/lib/src/router/route_constants.dart');

  final file = File(filePath);

  if (!file.existsSync()) {
    log('File $filePath does not exist.');
    exit(1);
  }

  final content = file.readAsStringSync();

// Add import line
  var newContent = content;

  // Add route entry
  if (newContent.contains('enum AppPage')) {
    newContent = newContent.replaceFirst('}', '  ${featureName.camelCase},\n}');
  }

  // Add routePath entry in AppPageExtension
  if (newContent.contains('extension AppPageExtension on AppPage {')) {
    if (newContent.contains('String get routePath {')) {
      final pattern = RegExp(r'(return switch \(this\) \{([^\}]*?)\s*\})');
      final match = pattern.firstMatch(newContent);
      if (match != null) {
        final cases = match.group(2);
        final updatedCases =
            "$cases\n      AppPage.${featureName.camelCase} => '/${featureName.paramCase}',";
        newContent = newContent.replaceRange(
          match.start,
          match.end,
          'return switch (this) {$updatedCases\n    }',
        );
      }
    }

    // Add routeName entry in AppPageExtension
    if (newContent.contains('String get routeName {')) {
      final patternRouteName =
          RegExp(r'(return switch \(this\) \{([^\}]*?)\s*\})');
      final match = patternRouteName.allMatches(newContent).last;
      final cases = match.group(2);
      final updatedRouteCases =
          "$cases\n      AppPage.${featureName.camelCase} => '${featureName.toUpperCase()}',";
      newContent = newContent.replaceRange(
        match.start,
        match.end,
        'return switch (this) {$updatedRouteCases\n    }',
      );
    }
  }

  final isPage = context.vars['page'] as bool;
  final platforms = context.vars['platform'] as List<dynamic>;

  if (platforms.first == 'app' && isPage) {
    file.writeAsStringSync(newContent);
    log('Route added successfully.');
  }
}
