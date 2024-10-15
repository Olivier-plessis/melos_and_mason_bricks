part of 'splash_bloc.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {
  List<Object> get props => [];
}

final class SplashLoading extends SplashState {}

final class SplashSuccess extends SplashState {}

final class SplashFailure extends SplashState {}
