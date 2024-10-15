import 'package:fpdart/fpdart.dart';
import 'package:cubit_app/src/feature/splash/domain/model/splash.dart';

abstract class ISplashRepository {
  Future<Either<Left, Splash>> getSplash();
}
