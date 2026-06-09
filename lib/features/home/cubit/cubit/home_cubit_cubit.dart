import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/bookmark/data/bookmark_repo.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/home/data/model/slider_model.dart';
import 'package:book_stroe/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    try {
      final slider = await HomeRepo.getSlider();
      final product = await HomeRepo.getProducts();

      print("SLIDER => $slider");
      print("PRODUCT => $product");

      if (slider == null || product == null) {
        emit(HomeErrorState());
        return;
      }

      emit(
        HomeSuccessState(
          sliders: slider.data?.sliders ?? [],
          products: product.data?.products ?? [],
        ),
      );
    } catch (e) {
      print("HOME ERROR => $e");
      emit(HomeErrorState());
    }
  }

  Future<void> addFavorite({required int bookId}) async {
    emit(BookMarkLoadingState());
    final response = await BookMarkRepo.addToFavourite(bookId: bookId);

    if (response) {
      emit(BookMarkSuccessState(isAdded: true, productId: bookId));
    } else {
      emit(BookMarhErrorState());
    }
  }

  Future<void> removeFavorite({required int bookId}) async {
    emit(BookMarkLoadingState());
    final response = await BookMarkRepo.addToFavourite(bookId: bookId);

    if (response) {
      emit(BookMarkSuccessState(isAdded: false, productId: bookId));
    } else {
      emit(BookMarhErrorState());
    }
  }

  Future<void> showWishList() async {
    emit(ShowBookMarkLoadingState());

    final response = await BookMarkRepo.showBookMark();

    if (response != null) {
      emit(ShowBookMarkSuccessState(wishList: response.data.products));
    } else {
      emit(ShowBookMarkErrorState());
    }
  }
}
