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
  final featureName = context.vars['feature_name'] as String;
  final addToNavigationBar = context.vars['addToNavigationBar'] as bool;
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
  TypedStatefulShellBranch<${feature}ShellBranchData>(
    routes: <TypedRoute<RouteData>>[
      TypedGoRoute<${feature}RouteData>(
        name: '${featureName.camelCase}',
        path: '/${featureName.paramCase}',
      ),
    ],
  ),
  ''';

// Add import line
  var newContent = content;
  // Add import line if it doesn't exist
  if (!newContent.contains(importLine) && !addToNavigationBar) {
    newContent = newContent.replaceFirst(
        "import 'package:go_router/go_router.dart';\n",
        "import 'package:go_router/go_router.dart';\n$importLine\n");
  }

  // Add route entry by appending the routeLine to the end of the branches array within @TypedStatefulShellRoute<MainShellRouteData>
  final pattern = RegExp(
      r'@TypedStatefulShellRoute<MainShellRouteData>\(\s*branches: <TypedStatefulShellBranch<StatefulShellBranchData>>\[(.*)]\)',
      dotAll: true);
  // final pattern = RegExp(r'routes: \[((.*)]\n\s*\]', dotAll: true);
  final match = pattern.firstMatch(newContent);

  if (match != null) {
    final branchesArray = match.group(1)!;
    // Insert the new routeLine at the end of the branches array
    final updatedBranchesArray = '$branchesArray$routeLine';
    newContent = newContent.replaceRange(
      match.start,
      match.end,
      '@TypedStatefulShellRoute<MainShellRouteData>(branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[$updatedBranchesArray \n])',
    );
  }

  final isPage = context.vars['page'] as bool;
  final platforms = context.vars['platform'] as String;

  if (platforms.first == 'app' && isPage && addToNavigationBar) {
    file.writeAsStringSync(newContent);
    log('Route and classes added successfully.');
  }
}
