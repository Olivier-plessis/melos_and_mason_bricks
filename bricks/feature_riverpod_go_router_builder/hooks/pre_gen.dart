import 'package:mason/mason.dart';

import 'pre/get_project_info.dart';

Future<void> run(HookContext context) async {
  await getProjectInfo(context);
}
