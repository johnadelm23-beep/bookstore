import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/bookmark/data/bookmark_repo.dart';
import 'package:book_stroe/features/cart/data/cart_repo.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/home/data/model/slider_model.dart';
import 'package:book_stroe/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    final slider = await HomeRepo.getSlider();
    final product = await HomeRepo.getProducts();
    if (slider != null && product != null) {
      emit(
        HomeSuccessState(
          sliders: slider.data?.sliders ?? [],
          products: product.data.products,
        ),
      );
    } else {
      emit(HomeErrorState());
    }
  }

  Future<void> addToCart(int productId) async {
    print('loading.................');
    emit(AddToCartLoadingState());
    final response = await CartRepo.addToCart(productId: productId);
    if (response) {
      print('success...............................');
      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartErrorState());
    }
  }

  Future<void> addToFavorite({required int bookId}) async {
    emit(BookMarkLoadingSate());
    final response = await BookMarkRepo.addToFavourite(bookId: bookId);
    if (response) {
      emit(BookMarkSuccessState(isAdded: true));
    } else {
      emit(BookMarkErrorState());
    }
  }

  Future<void> removeFroFavorite({required int bookId}) async {
    emit(BookMarkLoadingSate());
    final response = await BookMarkRepo.removeFromFavorite(bookId: bookId);
    if (response) {
      emit(BookMarkSuccessState(isAdded: false));
    } else {
      emit(BookMarkErrorState());
    }
  }
}
