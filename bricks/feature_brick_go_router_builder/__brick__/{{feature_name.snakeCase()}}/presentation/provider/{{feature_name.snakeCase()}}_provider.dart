import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{feature_name.snakeCase()}}_provider.g.dart';
@riverpod
class {{feature_name.pascalCase()}} extends _${{feature_name.pascalCase()}} {
  @override
  FutureOr<void> build() {
  // ok to leave this empty if the return type is FutureOr<void>
  }
}
