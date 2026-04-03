part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeLoadingState extends HomeCubitState {}

final class HomeSuccessState extends HomeCubitState {
  final List<SliderModel> sliders;
  final List<Product> products;
  HomeSuccessState({required this.sliders, required this.products});
}

final class HomeErrorState extends HomeCubitState {}
