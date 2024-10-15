import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_app/src/feature/profile/presentation/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
}
