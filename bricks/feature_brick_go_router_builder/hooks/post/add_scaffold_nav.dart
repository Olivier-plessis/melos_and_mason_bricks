import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedNavigationRoute(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = context.vars['feature_name'] as String;
  // Dynamically construct the file path
  final currentDir = Directory.current.path;

  final navigationFilePath = p.join(currentDir,
      'app/$appName/lib/src/router/scaffold_with_nested_navigation.dart');

  final file = File(navigationFilePath);

  if (!file.existsSync()) {
    log('File $navigationFilePath does not exist.');
    exit(1);
  }

  final content = file.readAsStringSync();

  final navigationBarClassDefinitions = '''
          NavigationDestination(
            icon:  Icon(Icons.view_headline_outlined),
            selectedIcon:  Icon(Icons.view_headline),
            label: '${featureName.paramCase}',
          ),
  ''';

  final navigationRailClassDefinitions = '''
          NavigationRailDestination(
            icon: Icon(Icons.view_headline_outlined),
            selectedIcon: Icon(Icons.view_headline),
            label: Text('${featureName.paramCase}'),
          ),
  ''';

  var newContent = content;

  // Add route entry by appending the navigationBarClassDefinitions to the end of the destinations array in NavigationBar
  final navBarPattern =
      RegExp(r'destinations:\s*const\s*\[(.*?)\]', dotAll: true);
  final navBarMatch = navBarPattern.firstMatch(newContent);
  if (navBarMatch != null) {
    final routesArray = navBarMatch.group(1)!;
    final updatedRoutesArray = '$routesArray$navigationBarClassDefinitions';
    newContent = newContent.replaceRange(
      navBarMatch.start,
      navBarMatch.end,
      'destinations: const [$updatedRoutesArray\n        ]',
    );
  }

  final navRailPattern = RegExp(
      r'destinations:\s*const <NavigationRailDestination>\s*\[(.*?)\]',
      dotAll: true);
  final navRailMatch = navRailPattern.firstMatch(newContent);
  if (navRailMatch != null) {
    final routesArray = navRailMatch.group(1)!;
    final updatedRoutesArray = '$routesArray$navigationRailClassDefinitions';
    newContent = newContent.replaceRange(
      navRailMatch.start,
      navRailMatch.end,
      'destinations: const <NavigationRailDestination>[$updatedRoutesArray\n        ]',
    );
  }

  // Save changes if conditions are met
  final isPage = context.vars['page'] as bool;
  final addToNavigationBar = context.vars['addToNavigationBar'] as bool;
  final platforms = context.vars['platform'] as String;

  if (platforms == 'app' && isPage && addToNavigationBar) {
    file.writeAsStringSync(newContent);
    log('Navigation destination added successfully.');
  }
}
