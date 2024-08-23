import 'package:fpdart/fpdart.dart';
import 'package:go_builder_app/src/feature/edit_profile/domain/model/edit_profile.dart';

abstract class IEditProfileRepository {
  Future<Either<Left, EditProfile>> getEditProfile();
}
