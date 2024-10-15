part of 'splash_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStart() async {
    emit(SplashLoading());

    SchedulerBinding.instance.addPostFrameCallback((_) {
      onSuccess();
    });
  }

  void onSuccess() {
    emit(SplashSuccess());
  }

  void onFailure() {
    emit(SplashFailure());
  }
}
