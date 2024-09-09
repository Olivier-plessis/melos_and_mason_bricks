import 'package:fpdart/fpdart.dart';
import 'package:simple_app/src/feature/settings/domain/model/settings.dart';

abstract class ISettingsRepository {
  Future<Either<Left, Settings>> getSettings();
}
