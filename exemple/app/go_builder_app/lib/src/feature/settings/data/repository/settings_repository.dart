import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import 'package:go_builder_app/src/feature/settings/domain/model/settings.dart';
import 'package:go_builder_app/src/feature/settings/domain/repository/settings_repository_impl.dart';

final class SettingsRepository implements ISettingsRepository {
  SettingsRepository();

  @override
  Future<Either<Left, Settings>> getSettings() async {
    try {
      // TODO change to your own api response
      final Settings response = 'response to api' as Settings;

      return right(response);
    } on DioException catch (e) {
      return left(Left(e));
    }
  }
}
