import 'package:book_stroe/features/cart/data/model/checkout_model.dart';
import 'package:book_stroe/features/cart/data/model/govern_model.dart';
import 'package:book_stroe/features/cart/data/model/place_order_model.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final CheckoutModel model;
  CheckoutSuccess(this.model);
}

class CheckoutError extends CheckoutState {
  final String error;
  CheckoutError(this.error);
}

class PlaceOrderLoading extends CheckoutState {}

class PlaceOrderSuccess extends CheckoutState {
  final PlaceOrderModel model;
  PlaceOrderSuccess(this.model);
}

class PlaceOrderError extends CheckoutState {
  final String error;
  PlaceOrderError(this.error);
}

class GovernorateLoading extends CheckoutState {}

class GovernorateSuccess extends CheckoutState {
  final List<GovernorateModel> data;
  GovernorateSuccess(this.data);
}

class GovernorateError extends CheckoutState {
  final String error;
  GovernorateError(this.error);
}
