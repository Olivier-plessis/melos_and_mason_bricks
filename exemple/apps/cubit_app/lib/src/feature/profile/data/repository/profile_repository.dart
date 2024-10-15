import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import 'package:cubit_app/src/feature/profile/domain/model/profile.dart';
import 'package:cubit_app/src/feature/profile/domain/repository/profile_repository_impl.dart';

final class ProfileRepository implements IProfileRepository {
  ProfileRepository();

  @override
  Future<Either<Left, Profile>> getProfile() async {
    try {
      // TODO change to your own api response
      final Profile response = 'response to api' as Profile;

      return right(response);
    } on DioException catch (e) {
      return left(Left(e));
    }
  }
}
