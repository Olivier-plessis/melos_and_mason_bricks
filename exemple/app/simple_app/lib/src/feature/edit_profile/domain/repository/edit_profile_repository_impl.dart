import 'package:fpdart/fpdart.dart';
import 'package:simple_app/src/feature/edit_profile/domain/model/edit_profile.dart';

abstract class IEditProfileRepository {
  Future<Either<Left, EditProfile>> getEditProfile();
}
