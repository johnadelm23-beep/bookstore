import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/profile/data/models/user_model.dart';
import 'package:book_stroe/features/profile/data/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> showProfile() async {
    emit(ProfileLoading());
    final response = await ProfileRepo.showProfile();
    if (response != null) {
      emit(ProfileSuccess(user: response.data));
    } else {
      emit(ProfileError());
    }
  }
}
