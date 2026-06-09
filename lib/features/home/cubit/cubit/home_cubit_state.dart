part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeLoadingState extends HomeCubitState {}

class HomeSuccessState extends HomeCubitState {
  final List<SliderModel> sliders;
  final List<Product> products;

  HomeSuccessState({required this.sliders, required this.products});
}

class HomeErrorState extends HomeCubitState {}

class BookMarkLoadingState extends HomeCubitState {}

class BookMarhErrorState extends HomeCubitState {}

class BookMarkSuccessState extends HomeCubitState {
  final bool isAdded;
  final int productId;

  BookMarkSuccessState({required this.isAdded, required this.productId});
}

class ShowBookMarkLoadingState extends HomeCubitState {}

class ShowBookMarkErrorState extends HomeCubitState {}

class ShowBookMarkSuccessState extends HomeCubitState {
  final List<Product> wishList;

  ShowBookMarkSuccessState({required this.wishList});
}
