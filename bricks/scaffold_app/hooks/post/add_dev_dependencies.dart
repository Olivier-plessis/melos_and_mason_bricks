import 'dart:io' as io;

import "package:mason/mason.dart";

Future<void> addDevDependencies(HookContext context) async {
  final name = context.vars['name'];

  final addDevDependencies = context.vars['add_dev_dependencies'] as String;

  final codegen = context.vars['codegen'] as bool;

  final devDependencies = [
    if (codegen) 'go_router_builder',
    'build_runner',
    'riverpod_generator',
    'freezed',
    'json_serializable',
    'custom_lint',
    'flutter_lints',
    'http_mock_adapter',
    'logger',
    'mocktail',
    'riverpod_lint',
    if (addDevDependencies.isNotEmpty) addDevDependencies
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', '-d', ...devDependencies],
    workingDirectory: './$name',
  );
}
