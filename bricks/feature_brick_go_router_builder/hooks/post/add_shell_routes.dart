import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedShellRoute(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = context.vars['feature_name'] as String;
  // Dynamically construct the file path
  final currentDir = Directory.current.path;
  final filePath =
      p.join(currentDir, 'app/$appName/lib/src/router/app_shell_routes.dart');

  final file = File(filePath);

  if (!file.existsSync()) {
    log('File $filePath does not exist.');
    exit(1);
  }

  final feature = featureName.pascalCase;

  final importLine =
      "import 'package:$appName/src/feature/${featureName.snakeCase}/presentation/pages/${featureName.snakeCase}_screen.dart';";

  final content = file.readAsStringSync();

  final classDefinitions = '''
class ${feature}ShellBranchData extends StatefulShellBranchData {
  const ${feature}ShellBranchData();
}

class ${feature}RouteData extends GoRouteData {
  const ${feature}RouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ${feature}Screen();
  }
}
''';

// Add import line
  var newContent = content;
  // Add import line if it doesn't exist
  if (!newContent.contains(importLine)) {
    newContent = newContent.replaceFirst(
        "import 'package:go_router/go_router.dart';\n",
        "import 'package:go_router/go_router.dart';\n$importLine\n");
  }

// Add new class definitions if they don't exist
  if (!newContent.contains('class ${feature}ShellBranchData')) {
    newContent += '\n$classDefinitions';
  }

  final isPage = context.vars['page'] as bool;
  final addToNavigationBar = context.vars['addToNavigationBar'] as bool;
  final platforms = context.vars['platform'] as List<dynamic>;

  if (platforms.first == 'app' && isPage && addToNavigationBar) {
    file.writeAsStringSync(newContent);
    log('Route and classes added successfully.');
  }
}
