import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{appName.snakeCase()}}/src/feature/{{feature_name.snakeCase()}}/presentation/bloc/{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit() : super({{feature_name.pascalCase()}}Initial());
}
