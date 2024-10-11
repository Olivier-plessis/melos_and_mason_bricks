import 'dart:io' as io;

import "package:mason/mason.dart";

Future<void> addDevDependencies(HookContext context) async {
  final name = context.vars['name'];

  final addDevDependencies = context.vars['add_dev_dependencies'] as String;

  final codegen = context.vars['codegen'] as bool;
  final stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  final isRiverpod = stateManagement == 'riverpod';
  final devDependencies = [
    if (codegen) 'go_router_builder',
    'build_runner',
    'custom_lint',
    'freezed',
    'flutter_lints',
    'http_mock_adapter',
    'json_serializable',
    'logger',
    'mocktail',
    if (isRiverpod) 'riverpod_generator',
    if (isRiverpod) 'riverpod_lint',
    if (addDevDependencies.isNotEmpty) addDevDependencies
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', '-d', ...devDependencies],
    workingDirectory: './$name',
  );
}
