import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import 'package:simple_app/src/feature/edit_profile/domain/model/edit_profile.dart';
import 'package:simple_app/src/feature/edit_profile/domain/repository/edit_profile_repository_impl.dart';

final class EditProfileRepository implements IEditProfileRepository {
  EditProfileRepository();

  @override
  Future<Either<Left, EditProfile>> getEditProfile() async {
    try {
      // TODO change to your own api response
      final EditProfile response = 'response to api' as EditProfile;

      return right(response);
    } on DioException catch (e) {
      return left(Left(e));
    }
  }
}
