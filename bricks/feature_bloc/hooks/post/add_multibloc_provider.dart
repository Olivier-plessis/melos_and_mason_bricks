import 'dart:developer';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

Future<void> runGeneratedMultiblocProvider(HookContext context) async {
  final appName = (context.vars['appName'] as String).snakeCase;
  final featureName = context.vars['feature_name'] as String;
  final addToMultiblocProvider = context.vars['multibloc_provider'] as bool;
  final platform = context.vars['platform'] as String;

  final currentDir = Directory.current.path;
  final filePath = p.join(
      currentDir, '$platform/$appName/lib/src/core/services/bloc_widget.dart');

  final file = File(filePath);

  if (!file.existsSync()) {
    log('File $filePath does not exist.');
    exit(1);
  }

  final importLine =
      "import 'package:$appName/src/feature/${featureName.snakeCase}/presentation/bloc/${featureName.snakeCase}_bloc.dart';";

  final blocLine =
      "BlocProvider<${featureName.pascalCase}Bloc>(create: (context) => ${featureName.pascalCase}Bloc()),\n";

  final content = file.readAsStringSync();

  // Add import line if it doesn't exist
  var newContent = content;

  if (!newContent.contains(importLine)) {
    newContent = newContent.replaceFirst(
        "import 'package:${appName.snakeCase}/src/router/router_bloc.dart';\n",
        "import 'package:${appName.snakeCase}/src/router/router_bloc.dart';\n$importLine\n");
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
      throw Exception('Mismatched brackets in providers array.');
    }

    return insertIndex - 1; // Before the last closing bracket
  }

  if (addToMultiblocProvider) {
    if (newContent.contains('providers: [')) {
      final branchesPattern = RegExp(r'providers:\s*\[');
      final match = branchesPattern.firstMatch(newContent);

      if (match != null) {
        try {
          final insertIndex = findBranchesEndIndex(newContent, match.end);
          newContent = newContent.replaceRange(
            insertIndex,
            insertIndex,
            '  $blocLine\n',
          );
          log('bloc added to providers.');
        } catch (e) {
          log(e.toString());
          exit(1);
        }
      } else {
        log('bloc array not found.');
        exit(1);
      }
    }
  }
  if (platform == 'apps' && addToMultiblocProvider) {
    file.writeAsStringSync(newContent);
    log('Bloc provider added successfully.');
  } else {
    log('Conditions not met for adding bloc.');
  }
}
