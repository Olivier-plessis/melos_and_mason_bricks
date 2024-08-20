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

  final navigatorKeyLine =
      "final _${featureName.camelCase}NavigatorKey = GlobalKey<NavigatorState>(debugLabel: '${featureName.camelCase}');\n";

  final content = file.readAsStringSync();
  String routeLine = '';
  if (!addToNavigationBar) {
    routeLine = '''
  GoRoute(
    path: AppPage.${featureName.camelCase}.routePath,
    name: AppPage.${featureName.camelCase}.routeName,
    builder: (context, state) => const ${feature}Screen(),
  ),''';
  } else {
    routeLine = '''
  StatefulShellBranch(
    navigatorKey: _${featureName.camelCase}NavigatorKey,
    routes: [
      GoRoute(
        path: AppPage.${featureName.camelCase}.routePath,
        name: AppPage.${featureName.camelCase}.routeName,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ${feature}Screen(),
        ),
      ),
    ],
  ),''';
  }

  // Add import line if it doesn't exist
  var newContent = content;

  if (!newContent.contains(importLine)) {
    newContent = newContent.replaceFirst(
        "import 'package:go_router/go_router.dart';\n",
        "import 'package:go_router/go_router.dart';\n$importLine\n");
  }

  if (!newContent.contains(navigatorKeyLine) && addToNavigationBar) {
    newContent = newContent.replaceFirst(
      "final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');\n",
      "final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');\n$navigatorKeyLine",
    );
  }

  int findBranchesEndIndex(String content, int startIndex) {
    int openBrackets = 1;
    int closeBrackets = 0;
    int insertIndex = startIndex;

    while (openBrackets != closeBrackets && insertIndex < content.length) {
      if (content[insertIndex] == '[') openBrackets++;
      if (content[insertIndex] == ']') closeBrackets++;
      insertIndex++;
    }

    if (openBrackets != closeBrackets) {
      throw Exception('Mismatched brackets in branches array.');
    }

    return insertIndex - 1; // Before the last closing bracket
  }

  // Determine where to insert the new route
  if (addToNavigationBar) {
    if (newContent.contains('branches: [')) {
      final branchesPattern = RegExp(r'branches:\s*\[');
      final match = branchesPattern.firstMatch(newContent);

      if (match != null) {
        try {
          final insertIndex = findBranchesEndIndex(newContent, match.end);
          newContent = newContent.replaceRange(
            insertIndex,
            insertIndex,
            '  $routeLine\n',
          );
          log('Route added to branches.');
        } catch (e) {
          log(e.toString());
          exit(1);
        }
      } else {
        log('Branches array not found.');
        exit(1);
      }
    }
  } else {
    final startPattern =
        RegExp(r'List<RouteBase> appRoutes = \[(.*)\n\s*\]', dotAll: true);
    final endPattern = RegExp(r'StatefulShellRoute\.indexedStack');

    final startMatch = startPattern.firstMatch(newContent);
    final endMatch = endPattern.firstMatch(newContent);

    if (startMatch != null && endMatch != null) {
      final insertionIndex =
          endMatch.start; // Insert before the StatefulShellRoute
      newContent = newContent.replaceRange(
        insertionIndex,
        insertionIndex,
        '  $routeLine\n',
      );
    } else {
      log('Routes array not found or StatefulShellRoute not found.');
      exit(1);
    }
  }

  final isPage = context.vars['page'] as bool;
  final platforms = context.vars['platform'] as List<dynamic>;

  if (platforms.first == 'app' && isPage) {
    file.writeAsStringSync(newContent);
    log('Route added successfully.');
  } else {
    log('Conditions not met for adding route.');
  }
}
