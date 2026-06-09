import 'package:book_stroe/features/profile/data/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> showProfile() async {
    emit(ProfileLoading());

    try {
      final response = await ProfileRepo.showProfile();

      emit(ProfileSuccess(user: response!.data));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(
    String name,
    String phone,
    String city,
    String address,
  ) async {
    emit(ProfileLoading());

    try {
      final response = await ProfileRepo.editProfile(
        name: name,
        address: address,
        city: city,
        phone: phone,
      );

      emit(ProfileSuccess(user: response!.data));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
