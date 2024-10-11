import 'dart:io' as io;

import "package:mason/mason.dart";

Future<void> addDependencies(HookContext context) async {
  final name = context.vars['name'];

  final addDependencies = context.vars['add_dependencies'] as String;
  final stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  final isBloc = stateManagement == 'bloc';
  final isRiverpod = stateManagement == 'riverpod';

  final dependencies = [
    if (isRiverpod) 'hooks_riverpod',
    if (isRiverpod) 'riverpod_annotation',
    'flutter_hooks',
    'freezed_annotation',
    'json_annotation',
    'dio',
    'go_router',
    'flex_color_scheme',
    'flutter_screenutil',
    'fpdart',
    if (isBloc) 'flutter_bloc',
    if (addDependencies.isNotEmpty) addDependencies
  ];

  final _ = await io.Process.run(
    'flutter',
    ['pub', 'add', ...dependencies],
    workingDirectory: './$name',
  );
}
