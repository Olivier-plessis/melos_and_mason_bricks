import 'dart:io' as io;

import 'package:mason/mason.dart';

Future<void> getProjectInfo(HookContext context) async {
  final pubspec = _getPubspec(context);

  final usesHooks = await _uses('hooks_riverpod', file: pubspec);
  context.vars['hooks'] = usesHooks;
  context.vars['withoutHooks'] = !usesHooks;

  final usesCodegen = await _uses('riverpod_generator', file: pubspec);
  context.vars['codegen'] = usesCodegen;

  final usesFreezed = await _uses('freezed', file: pubspec);
  context.vars['freezed'] = usesFreezed;

  final isStateFull = context.vars['isStateFull'] as bool;

  final isStateFullHook = usesHooks && isStateFull;
  context.vars['isStFullHook'] = isStateFullHook;

  final isStateFullNotHook = !usesHooks && isStateFull;
  context.vars['isStFullWithoutHook'] = isStateFullNotHook;

  final anyCodegen = usesCodegen || usesFreezed;
  context.vars['anyCodegen'] = anyCodegen;
}

Future<bool> _uses(String input, {required io.File file}) async {
  final lines = await file.readAsLines();
  for (final line in lines) {
    if (line.contains(input)) return true;
  }
  return false;
}

io.File _getPubspec(HookContext context) {
  final appName = (context.vars['appName'] as String).snakeCase;
  final platforms = context.vars['platform'] as List<dynamic>;

  try {
    return io.File.fromUri(
        Uri.file('${platforms.first}/$appName/pubspec.yaml'));
  } on io.PathNotFoundException {
    throw const NoPubspecFoundException();
  }
}

class NoPubspecFoundException implements Exception {
  const NoPubspecFoundException();

  @override
  String toString() =>
      'No `pubspec.yaml` found. You must create a Flutter project first';
}
