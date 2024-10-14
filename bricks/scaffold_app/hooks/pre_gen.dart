import 'dart:io' as io;

import 'package:mason/mason.dart';

import 'pre/available_platforms.dart';
import 'pre/validate_name.dart';
import 'pre/validate_org.dart';

void checkIfExists(io.Directory dr) {
  final present = dr.existsSync();
  print(present ? 'exists' : 'does not exist');
  if (!present) {
    dr.createSync(recursive: true);
  }
}

void run(HookContext context) async {
  final packagePath = 'packages';
  final dr = io.Directory(packagePath);

  checkIfExists(dr);

  final path = 'apps';
  final dir = io.Directory(path);

  checkIfExists(dir);

  // Asserting our dart package name
  final name = context.vars['name'] as String;
  assertValidDartPackageName(name);

  // Asserting org name and computing a reversed one
  final org = context.vars['org'] as String;
  assertValidOrg(org);
  context.vars['reversedOrg'] = org.split('.').reversed.join('.');

  final stateManagement =
      context.vars['state_management'].toString().toLowerCase();
  final isBloc = stateManagement == 'bloc';
  final isCubit = stateManagement == 'cubit';
  final isRiverpod = stateManagement == 'riverpod';
  final isBlocOrCubit = isBloc || isCubit;
  
  context.vars = {
    ...context.vars,
    'isBloc': isBloc,
    'isCubit': isCubit,
    'isRiverpod': isRiverpod,
    'isBlocOrCubit': isBlocOrCubit,
  };

  // Platform assertions and pre-process
  final platforms = context.vars['platforms'] as List<dynamic>;
  final parsedPlatforms = parsePlatforms(platforms.map((e) => e as String));
  context.vars['isCrossPlatform'] = parsedPlatforms.length > 1;
  context.vars['formattedPlatforms'] = parsedPlatforms.join(',');
  context.vars['hasIOs'] = parsedPlatforms.contains(AvailablePlatform.ios);
  context.vars['hasAndroid'] =
      parsedPlatforms.contains(AvailablePlatform.android);
  context.vars['hasMacOs'] = parsedPlatforms.contains(AvailablePlatform.macos);
  context.vars['hasWindows'] =
      parsedPlatforms.contains(AvailablePlatform.windows);
  context.vars['hasWeb'] = parsedPlatforms.contains(AvailablePlatform.web);
  context.vars['hasLinux'] = parsedPlatforms.contains(AvailablePlatform.linux);

  Future<bool> _uses(String input, {required io.File file}) async {
    final lines = await file.readAsLines();
    for (final line in lines) {
      if (line.contains(input)) return true;
    }
    return false;
  }
}
