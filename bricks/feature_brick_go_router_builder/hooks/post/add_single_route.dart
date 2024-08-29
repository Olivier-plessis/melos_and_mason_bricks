import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedSingleRoute(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = context.vars['feature_name'] as String;
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
  @TypedGoRoute<${feature}Route>(path: "/${feature.paramCase}")
  class ${feature}Route extends GoRouteData {
    const ${feature}Route();

    @override
    Widget build(BuildContext context, GoRouterState state) {
      return const ${feature}Screen();
    }
  }
  ''';

  var newContent = content;

  if (!newContent.contains(importLine)) {
    newContent = newContent.replaceFirst(
        "import 'package:go_router/go_router.dart';\n",
        "import 'package:go_router/go_router.dart';\n$importLine\n");
  }

  final pattern = RegExp('@TypedStatefulShellRoute<MainShellRouteData>');
  final match = pattern.firstMatch(newContent);

  if (match != null) {
    final beforeRoute = newContent.substring(0, match.start);
    final afterRoute = newContent.substring(match.start);
    newContent = '$beforeRoute$routeLine\n$afterRoute';
  }

  final isPage = context.vars['page'] as bool;
  final addToNavigationBar = context.vars['addToNavigationBar'] as bool;
  final platforms = context.vars['platform'] as String;

  if (platforms.first == 'app' && isPage && !addToNavigationBar) {
    file.writeAsStringSync(newContent);
    log('Route and classes added successfully.');
  }
}
