import 'package:book_stroe/features/profile/data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserData user;
  ProfileSuccess({required this.user});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
