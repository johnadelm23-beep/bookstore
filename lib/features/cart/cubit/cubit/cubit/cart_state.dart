import 'package:flutter/foundation.dart';
import 'package:book_stroe/features/cart/data/model/cart_model.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartRemoveLoading extends CartState {}

final class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

final class CartSuccess extends CartState {
  final CartResponseModel cart;

  CartSuccess({required this.cart});
}
