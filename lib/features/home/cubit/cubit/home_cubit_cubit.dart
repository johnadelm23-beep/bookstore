import 'package:bloc/bloc.dart';
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
}
