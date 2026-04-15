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

final class BookMarkLoadingState extends HomeCubitState {}

final class BookMarhErrorState extends HomeCubitState {}

final class BookMarkSuccessState extends HomeCubitState {
  final bool isAdded;
  final int productId;
  BookMarkSuccessState({required this.isAdded, required this.productId});
}

final class ShowBookMarkLoadingState extends HomeCubitState {}

final class ShowBookMarkErrorState extends HomeCubitState {}

final class ShowBookMarkSuccessState extends HomeCubitState {
  final List<Product> wishList;
  ShowBookMarkSuccessState({required this.wishList});
}
