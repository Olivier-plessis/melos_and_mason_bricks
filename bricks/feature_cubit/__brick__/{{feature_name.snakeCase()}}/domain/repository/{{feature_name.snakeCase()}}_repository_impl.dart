import 'package:fpdart/fpdart.dart';
import 'package:{{appName.snakeCase()}}/src/feature/{{feature_name.snakeCase()}}/domain/model/{{feature_name.snakeCase()}}.dart';

abstract class I{{feature_name.pascalCase()}}Repository {
  Future<Either<Left, {{feature_name.pascalCase()}}>> get{{feature_name.pascalCase()}}();
}
