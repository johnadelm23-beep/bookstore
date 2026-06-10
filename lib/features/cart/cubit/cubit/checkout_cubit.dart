import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/cart/data/checkout_repo.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  Future<void> checkout() async {
    emit(CheckoutLoading());

    final result = await CheckoutRepo.checkout();

    if (result != null) {
      emit(CheckoutSuccess(result));
    } else {
      emit(CheckoutError("Checkout failed"));
    }
  }

  Future<void> getGovernorates() async {
    emit(GovernorateLoading());

    final result = await CheckoutRepo.getGovernorates();

    if (result != null) {
      emit(GovernorateSuccess(result));
    } else {
      emit(GovernorateError("Failed to load governorates"));
    }
  }

  Future<void> placeOrder({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String governorateId,
  }) async {
    emit(PlaceOrderLoading());

    final result = await CheckoutRepo.placeOrder(
      name: name,
      address: address,
      phone: phone,
      email: email,
      governorateId: governorateId,
    );

    if (result != null) {
      emit(PlaceOrderSuccess(result));
    } else {
      emit(PlaceOrderError("Order failed"));
    }
  }
}
