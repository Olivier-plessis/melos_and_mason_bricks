import 'dart:io' as io;

import "package:mason/mason.dart";

Future<void> addDependencies(HookContext context) async {
  final name = context.vars['name'];

  final addDependencies = context.vars['add_dependencies'] as String;

  final dependencies = [
    'hooks_riverpod',
    'flutter_hooks',
    'riverpod_annotation',
    'freezed_annotation',
    'json_annotation',
    'dio',
    'go_router',
    'flex_color_scheme',
    'flutter_screenutil',
    'fpdart',
    if (addDependencies.isNotEmpty) addDependencies
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', ...dependencies],
    workingDirectory: './$name',
  );
}
