import 'package:fpdart/fpdart.dart';
import 'package:simple_app/src/feature/profile/domain/model/profile.dart';

abstract class IProfileRepository {
  Future<Either<Left, Profile>> getProfile();
}
