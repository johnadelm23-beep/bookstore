part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class SliderLoadingState extends HomeCubitState {}

final class SliderSuccessState extends HomeCubitState {
  final List<SliderModel> sliders;
  SliderSuccessState({required this.sliders});
}

final class SliderErrorState extends HomeCubitState {}
