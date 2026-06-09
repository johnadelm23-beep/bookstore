import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/cart/data/cart_repo.dart';
import 'package:book_stroe/features/cart/data/model/cart_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());

    final response = await CartRepo.getCart();

    if (response != null) {
      emit(CartSuccess(cart: response));
    } else {
      emit(CartError(message: "Failed to load cart"));
    }
  }

  Future<void> addToCart(int productId) async {
    final result = await CartRepo.addToCart(productId);

    if (result) {
      final updated = await CartRepo.getCart();
      if (updated != null) {
        emit(CartSuccess(cart: updated));
      }
    } else {
      emit(CartError(message: "Failed to add to cart"));
    }
  }

  /// REMOVE FROM CART (FIXED)
  Future<void> removeFromCart(int itemId) async {
    try {
      await CartRepo.removeCart(itemId: itemId);

      final updatedCart = await CartRepo.getCart();

      if (updatedCart != null) {
        emit(CartSuccess(cart: updatedCart));
      } else {
        emit(CartError(message: "Failed to load cart"));
      }
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> increaseQty(int itemId, int qty) async {
    final res = await CartRepo.updateCart(itemId: itemId, quantity: qty + 1);

    if (res != null) {
      emit(CartSuccess(cart: res));
    } else {
      emit(CartError(message: "Failed to update cart"));
    }
  }

  Future<void> decreaseQty(int itemId, int qty) async {
    if (qty <= 1) return;

    final res = await CartRepo.updateCart(itemId: itemId, quantity: qty - 1);

    if (res != null) {
      emit(CartSuccess(cart: res));
    } else {
      emit(CartError(message: "Failed to update cart"));
    }
  }
}
