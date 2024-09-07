import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> getSpiderJson(HookContext context) async {
  // Create spider.json in appName folder
  final name = context.vars['name'];
  final spiderJsonFile = io.File('packages/$name/spider.json');
  await spiderJsonFile.writeAsString('''
{
  "generate_tests": true,
  "no_comments": true,
  "export": true,
  "use_part_of": true,
  "use_references_list": false,
  "package": "resources",
  "groups": [
    {
      "path": "assets/images/branding",
      "prefix": "bdg_",
      "class_name": "BrandingAssets",
      "types": ["png", "webp", "wbmp", "svg"]
    }
  ]
}
''');

// Create assets/images/branding folder
  final brandingDir = io.Directory('packages/$name/assets/images/');
  if (!brandingDir.existsSync()) {
    brandingDir.createSync(recursive: true);
    context.logger
        .info('Created assets/images/branding folder in packages/$name');

    // Add assets to pubspec.yaml
    final pubspecFile = io.File('packages/$name/pubspec.yaml');
    if (pubspecFile.existsSync()) {
      final pubspecContent = pubspecFile.readAsStringSync();
      final updatedPubspec = pubspecContent.replaceFirst(
        '# The following section is specific to Flutter packages.\nflutter:\n',
        'flutter:\n  generate: true\n  assets:\n    - assets/\n    - assets/images/\n',
      );
      pubspecFile.writeAsStringSync(updatedPubspec);
      context.logger.info('Updated pubspec.yaml with assets');
    } else {
      context.logger.info('pubspec.yaml not found in packages/$name');
    }
  }

  // Add assets/fonts to packages/$name
  final fontDir = io.Directory('packages/$name/assets/fonts/');
  if (!fontDir.existsSync()) {
    fontDir.createSync(recursive: true);
    context.logger
        .info('Created assets/fonts folder in packages/$name');
  }

  context.logger.info('spider.json created in app/$name');
}

Future<void> addSpiderScript(HookContext context) async {
  final directory = io.Directory.current;
  final melosFile = io.File('${directory.path}/melos.yaml');
  if (!melosFile.existsSync()) {
    context.logger.info('melos.yaml not found');
    io.exit(1);
  }

  final melosContent = melosFile.readAsStringSync();
  var newContent = melosContent;

  const newScript = '''spider:
    run: melos exec --depends-on="spider" -- spider build
    description: Run spider to generate resources.
''';

  if (!newContent.contains('spider:')) {
    newContent = melosContent
        .replaceFirst(
          'all:',
          '$newScript\n  all:',
        )
        .replaceFirst(
          'all:\n    run: |\n      melos clean\n      melos bs\n      melos build_runner\n',
          'all:\n    run: |\n      melos clean\n      melos bs\n      melos build_runner\n      melos spider\n',
        );

    melosFile.writeAsStringSync(newContent);
    context.logger.info('Dart format in progress..');
  }else{
    context.logger.info('build_runner script already exists');
  }
}
