import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../feature_brick_go_router_builder/__brick__/{{feature_name.snakeCase()}}/domain/model/{{feature_name.snakeCase()}}.freezed.dart';
part '../../../../../feature_brick_go_router_builder/__brick__/{{feature_name.snakeCase()}}/domain/model/{{feature_name.snakeCase()}}.g.dart';

@freezed
class {{feature_name.pascalCase()}} with _${{feature_name.pascalCase()}} {
  factory {{feature_name.pascalCase()}}(
  // TODO add params here
  ) = _{{feature_name.pascalCase()}};
  factory {{feature_name.pascalCase()}}.fromJson(Map<String, Object?> json) => _${{feature_name.pascalCase()}}FromJson(json);

  factory {{feature_name.pascalCase()}}.empty() => _{{feature_name.pascalCase()}}(
    // TODO add params here
  );
}
