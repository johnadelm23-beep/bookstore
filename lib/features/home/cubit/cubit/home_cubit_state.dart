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

final class AddToCartSuccessState extends HomeCubitState {}

final class AddToCartErrorState extends HomeCubitState {}

final class AddToCartLoadingState extends HomeLoadingState {}

final class BookMarkLoadingSate extends HomeLoadingState {}

final class BookMarkSuccessState extends HomeLoadingState {
  final bool isAdded;
  BookMarkSuccessState({required this.isAdded});
}

final class BookMarkErrorState extends HomeLoadingState {}
