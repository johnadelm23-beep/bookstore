import 'package:bloc/bloc.dart';
import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/home/data/model/slider_model.dart';
import 'package:book_stroe/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  Future<void> getSlider() async {
    emit(SliderLoadingState());
    final response = await HomeRepo.getSlider();
    if (response != null) {
      emit(SliderSuccessState(sliders: response.data?.sliders ?? []));
    } else {
      emit(SliderErrorState());
    }
  }

  Future<void> getProducts() async {
    emit(ProductLoadingStatus());
    final response = await HomeRepo.getProducts();
    if (response != null) {
      emit(ProductSuccessStatus(products: response.data.products));
    } else {
      emit(ProductErrorStatus());
    }
  }
}
