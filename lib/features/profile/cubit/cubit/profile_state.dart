part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserData user;
  ProfileSuccess({required this.user});
}

final class ProfileError extends ProfileState {}
