import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedRoute(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = (context.vars['feature_name'] as String);
  // Dynamically construct the file path
  final currentDir = Directory.current.path;
  final filePath =
      p.join(currentDir, 'app/$appName/lib/src/router/app_routes.dart');

  final file = File(filePath);

  if (!file.existsSync()) {
    log('File $filePath does not exist.');
    exit(1);
  }

  final feature = featureName.pascalCase;

  final importLine =
      "import 'package:$appName/src/feature/${featureName.snakeCase}/presentation/pages/${featureName.snakeCase}_screen.dart';";

  final content = file.readAsStringSync();
  final routeLine = '''
   GoRoute(
     path: AppPage.${featureName.camelCase}.routePath,
     name: AppPage.${featureName.camelCase}.routeName,
     builder: (context, state) => const ${feature}Screen(),
   ),''';

// Add import line
  var newContent = content;
// Add import line if it doesn't exist
  if (!newContent.contains(importLine)) {
    newContent = newContent.replaceFirst(
        "import 'package:go_router/go_router.dart';\n",
        "import 'package:go_router/go_router.dart';\n$importLine\n");
  }

// Add route entry by appending the routeLine to the end of routes array
  if (newContent.contains('List<RouteBase> appRoutes = [')) {
    final pattern = RegExp(r'List<RouteBase> appRoutes =  \[(.*)\n\s*\]', dotAll: true);
    final match = pattern.firstMatch(newContent);
    if (match != null) {
      final routesArray = match.group(1)!;
      final updatedRoutesArray = '$routesArray\n$routeLine';
      newContent = newContent.replaceRange(
        match.start,
        match.end,
        'List<RouteBase> appRoutes = [$updatedRoutesArray\n  ]',
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
